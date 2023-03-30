%% Timing and testing trmm_llnn_unb_var[1-8]
% This live script helps you visualize the performance of triangular matrix-matrix 
% multiplication algorithms implemented with FLAMEC
%% Load the timing data

output
%% Check if the answers for the different implementations are correct

max_diff = max( abs( data_unb_var1(:,3) ) )
if ( max_diff > 1.0e-12 )
    disp( 'Trouble in paradise?' );
else
    disp( 'All seems to be well' );
end

max_diff = max( abs( data_unb_var1( :, 3 ) ) )
if ( max_diff > 1.0e-12 )
    disp( 'Trouble in paradise' );
else
    disp( 'All seems to be well' );
end
%% Plot the timing data

plot( data_ref( :, 1 ), data_ref( :, 2 ), '-' )
hold on
plot( data_unb_var1(:,1), data_unb_var1(:,2), 'x-r' );
plot( data_unb_var1(:,1), data_unb_var1(:,2)+ones(size(data_unb_var1)), 'o-b' );


legend( 'Reference', ...
    'unb\_var1', 'unb\_var2' );

axis( [0,max(data_unb_var1(:,1)), 0,max(data_unb_var1(:,2)) ] )  % set the range of the axes

title( 'Execution time' )
xlabel( 'problem size m = n' )
ylabel( 'seconds' )
% plot the GFLOPS attained

figure     % start new figure
hold off

% create an array of the number of flops executed in billions
gflops_ref = data_ref(:,1).^3 * 1.0e-9;


plot( data_ref( :, 1 ), gflops_ref./data_ref( :, 2 ), '-' )
hold on

gflops_unb_var1 = data_unb_var1(:,1).^3 * 1.0e-9;
plot( data_unb_var1(:,1), gflops_unb_var1./data_unb_var1(:,2), 'x-r' );

legend( 'Reference', ...
    'unb\_var1' );

axis( [0,max(data_unb_var1(:,1)), 0,max(gflops_ref./data_ref(:,2)) ] )  % set the range of the axes

title( 'GFLOPS attained' )
xlabel( 'problem size m = n' )

ylabel( 'GFLOPS' )

%% 
%