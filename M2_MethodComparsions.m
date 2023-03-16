clear; clc; close all;

load euler_e_angles.mat
load rk4_angles.mat

N = 6000; % number of samples
dt = 1;   % time-step, seconds

T = linspace(0, N*dt, N); % time array


diff_angles = rk4_e_angles - e_euler_angles;

plot(T, diff_angles(:,1),"Color", "#011627", "LineWidth", 2.5)

hold on
xlabel("T (s)", 'FontSize', 20)
ylabel("RK4 - Euler", 'FontSize', 20)
grid on
plot(T, diff_angles(:,2),"Color", "#ff3366", "LineWidth", 2.5)
plot(T, diff_angles(:,3),"Color", "#ff7f11", "LineWidth", 2.5)

legend("\psi","\theta","\phi", "Location","northeast")

ax = gca;
ax.FontSize = 20;
ax.GridAlpha = 0.4;

set(gcf,'position',[0,0, 1280, 750])

v_norms = [2000 norm(e_euler_angles(2000,:)) norm(rk4_e_angles(2000,:)); 
    4000 norm(e_euler_angles(4000,:)) norm(rk4_e_angles(4000,:));
    6000 norm(e_euler_angles(6000,:)) norm(rk4_e_angles(6000,:))];

T = array2table(v_norms);
filename = 'vectorNorms.xlsx';
T.Properties.VariableNames = ["Time Step (s)","Euler Method (deg)", "RK4 Method (deg)"];
writetable(T,filename,'Sheet',1,'Range','A1')

%% Section C

DCM2000 = F2_Euler2DCM321(e_euler_angles(2000,1), e_euler_angles(2000,2), e_euler_angles(2000,3));
DCM4000 = F2_Euler2DCM321(e_euler_angles(4000,1), e_euler_angles(4000,2), e_euler_angles(4000,3));
DCM6000 = F2_Euler2DCM321(e_euler_angles(6000,1), e_euler_angles(6000,2), e_euler_angles(6000,3));

angles1 = F4_MatrixAngleNormalizerDeg(F7_DCM2Euler313(DCM2000));
angles2 = F4_MatrixAngleNormalizerDeg(F7_DCM2Euler313(DCM4000));
angles3 = F4_MatrixAngleNormalizerDeg(F7_DCM2Euler313(DCM6000));


