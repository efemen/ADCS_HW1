%% UZB421E Attitude Determination and Control HW1
% Euler Method Version
clear; clc; close all;

% Efe Egemen Sen, 110190129
n = 9; % last digit of my student number.

%% Initial Parameters

% Initial Euler Angles

roll_0 = (-0.01 - 0.002 * n);
pitch_0 = (0.01 - 0.002 * n);
yaw_0 = (-0.005- 0.002 * n);

e_angles0 = [yaw_0 pitch_0 roll_0]; % rad

% Initial Angular Velocities

w1_0 = (-0.002 - 0.0001 * n);
w2_0 = (0.003 - 0.0001 * n);
w3_0 = (-0.004 - 0.0001 * n);

w_0 = [w1_0 w2_0 w3_0]; % rad/s

% Mass moments of inertia

I1 = 2.1e-3; 
I2 = 2e-3;
I3 = 1.9e-3;

I = [I1; I2; I3]; % kg * m^2

% Torques

L1 = 3.6e-10; 
L2 = L1;
L3 = L1;

L = [L1; L2; L3]; % N * m

%% Simulation Parameters

N = 6000; % number of samples
dt = 1; % time-step, seconds

T = linspace(0, N*dt, N); % time array

w = zeros(N,3); % angular velocities rad/s.
w(1,:) = w_0;   % initial angular velocities added.
w_dot = w;      % angular accelerations rad/s^2.

e_angles = zeros(N,3);     % in order of yaw, pitch, roll sequence. Radians.
e_angles(1,:) = e_angles0; % initial Euler angles.
e_angles_dot = zeros(N,3); % same order with angles. rad/s

%% Angular acceleration expressions

% w1_dot = @(w2, w3) (-(I3 - I2) * w2 * w3 + L1) / I1; % values excluded from parantheses are already constant.
% w2_dot = @(w1, w3) (-(I1 - I3) * w3 * w1 + L2) / I2; % values within the parantheses are time dependent.
% w3_dot = @(w1, w2) (-(I2 - I1) * w1 * w2 + L3) / I3; % hence we have our angular acceleration expressions.

w_dot_fun = @(w) [(-(I3 - I2) * w(1,2) * w(1,3) + L1) / I1; (-(I1 - I3) * w(1,3) * w(1,1) + L2) / I2; (-(I2 - I1) * w(1,1) * w(1,2) + L3) / I3]';

%% Main iteration loop

for i = 1:N-1
    [e_angles, w] = F6_RK4(w_dot_fun, dt, e_angles, w, i);
end


%% Convertion to degrees
e_angles_deg_raw = rad2deg(e_angles);
e_angles_deg = F4_MatrixAngleNormalizerDeg(e_angles_deg_raw);
w_deg_s = rad2deg(w);

%% Plotting
subplot(3,1,1)
plot(T, e_angles_deg(:,1),"Color", "#011627", "LineWidth", 2.5)
xlabel("T (s)", 'FontSize', 15)
ylabel("\psi (°)", 'FontSize', 15)
grid on

ax = gca;
ax.FontSize = 15;
ax.GridAlpha = 0.4;

subplot(3,1,2)
plot(T, e_angles_deg(:,2),"Color", "#ff3366", "LineWidth", 2.5)
xlabel("T (s)", 'FontSize', 15)
ylabel("\theta (°)", 'FontSize', 15)
grid on

ax = gca;
ax.FontSize = 15;
ax.GridAlpha = 0.4;

subplot(3,1,3)
plot(T, e_angles_deg(:,2),"Color", "#ff7f11", "LineWidth", 2.5)
xlabel("T (s)", 'FontSize', 15)
ylabel("\phi (°)", 'FontSize', 15)
grid on

ax = gca;
ax.FontSize = 15;
ax.GridAlpha = 0.4;

set(gcf,'position',[0,0, 1280, 750])


figure(2)

plot(T, w_deg_s(:,1),"Color", "#ffa400", "LineWidth", 2.5)

hold on
xlabel("T (s)", 'FontSize', 20)
ylabel("\omega deg/s", 'FontSize', 20)
grid on
plot(T, w_deg_s(:,2),"Color", "#009ffd", "LineWidth", 2.5)
plot(T, w_deg_s(:,3),"Color", "#2a2a72", "LineWidth", 2.5)

legend("\omega_1","\omega_2","\omega_3", "Location","northeast")

ax = gca;
ax.FontSize = 20;
ax.GridAlpha = 0.4;

set(gcf,'position',[0,0, 1280, 750])



rk4_e_angles = e_angles_deg_raw;

save rk4_angles.mat rk4_e_angles
