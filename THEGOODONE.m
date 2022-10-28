% Lab 8 2020
%
% Version 10/14/2020
% Read 5 XFLR5 data files for the THEGOODONE design
%
Datum = csvread('THEGOODONE.csv',7,0,[7 0 27 12]);  
Data_n3 = csvread('THEGOODONE_n3.csv',7,0,[7 0 27 12]);
Data_n5 = csvread('THEGOODONE_n5.csv',7,0,[7 0 27 12]);
Data_p3 = csvread('THEGOODONE_p3.csv',7,0,[7 0 27 12]);
Data_p5 = csvread('THEGOODONE_p5.csv',7,0,[7 0 27 12]);

% CL datum
alpha = Datum(:,1); % read angles of attack
CL_datum = Datum(:,3);
CD_datum = Datum(:,6);
Cm_datum = Datum(:,9);

% Create lift increment column vectors
dCL_n5 = Data_n5(:,3)- CL_datum; 
dCL_p3 = Data_p3(:,3) - CL_datum;
dCL_0 = CL_datum - CL_datum; % this vector will be all zeros
dCL_p5 = Data_p5(:,3) - CL_datum;
dCL_n3 = Data_n3(:,3) - CL_datum;

% Create drag increment column vectors here
dCD_n5 = Data_n5(:,6)- CD_datum; 
dCD_p3 = Data_p3(:,6) - CD_datum;
dCD_0 = CD_datum - CD_datum; % this vector will be all zeros
dCD_p5 = Data_p5(:,6) - CD_datum;
dCD_n3 = Data_n3(:,6) - CD_datum;

% Create moment increment column vectors here
dCm_n5 = Data_n5(:,9)- Cm_datum; 
dCm_p3 = Data_p3(:,9) - Cm_datum;
dCm_0 = Cm_datum - Cm_datum; % this vector will be all zeros
dCm_p5 = Data_p5(:,9) - Cm_datum;
dCm_n3 = Data_n3(:,9) - Cm_datum;

% Elevator deflection angle vector;
delev = [-5, -3, 0, 3, 5];

% Combine the lift coefficient increment vectors into a single increment array
dCL_elev = [dCL_n5, dCL_n3, dCL_0, dCL_p3, dCL_p5];

% Repeat the process for drag and moment increments here
dCD_elev = [dCD_n5, dCD_n3, dCD_0, dCD_p3, dCD_p5];

dCm_elev = [dCm_n5, dCm_n3, dCm_0, dCm_p3, dCm_p5];

% Save the lift coefficient increments to a .mat file
save('dCL_elev.mat', 'dCL_elev')   

% Save the drag coefficient increments to a .mat file
save('dCD_elev.mat', 'dCD_elev')  

% Save the moment coefficient increments to a .mat file
save('dCm_elev.mat', 'dCm_elev')  

% Plot the Datam Coefficients vs Alpha
graph1 = [CL_datum, CD_datum, Cm_datum];
plot(alpha, graph1, '-x')
xlabel('Alpha (deg)')
ylabel('Coefficients')
title('CL, CD, Cm Datum vs Alpha')
grid on 
legend('CL_{datum}', 'CD_{datum}', 'Cm_{datum}')

% Plot the CL, CD, Cm Increment Values vs Alpha
% plot(alpha, dCL_elev, '-x')
% xlabel('Alpha (deg)')
% ylabel('CL Increment Values')'
% title('CL Increment Values vs Alpha')
% grid on 
% legend('-5', '-3', '0', '3', '5')

% plot(alpha, dCD_elev, '-x')
% xlabel('Alpha')
% ylabel('CD Increment Values')
% title('CD Increment Values vs Alpha')
% grid on 
% legend('-5', '-3', '0', '3', '5')

% plot(alpha, dCm_elev, '-x')
% xlabel('Alpha (deg)')
% ylabel('Cm Increment Values')
% title('Cm Increment Values vs Alpha')
% grid on 
% legend('-5', '-3', '0', '3', '5')
