%% ECE 203 Lab Assignment 3: Multi-Path Interferance
% ### Agam Goyal ###
% # Live Script containing skeleton code for Lab Assignment 3 created by Talha 
% Sultan, 02/2021 #
%% Prepare workspace

close all
clear

% Complete the following lines of Code 
% Uncomment to run

dt = 1000; % meters
dxr = 100; % meters
dyr = 900; % meters
c = 3*10^8; % speed of radio signal propagation meters/sec.
%% Part (a): Direct path propagation delay t1 from vehicle to Transmitter

% Complete the following lines of Code 
% Write dir_delay function and then uncomment to call function

xv1 = 0;
xv2 = 65;
t1_1 = dir_delay(xv1, dt, c);
t1_2 = dir_delay(xv2, dt, c);

disp('Part (a) Direct Path Delay')
disp(['t1(0) = ' num2str(dir_delay(xv1,dt,c)) ' sec'])
disp(['t1(65) = ' num2str(dir_delay(xv2,dt,c)) ' sec'])
%% Part (b): Reflective path delay where reflector is at (dxr, dyr)

% Complete the following lines of Code 
% Write dir_delay function and then uncomment to call function
xv = 65
refl_delay(xv,dt,c,dxr,dyr)
% Uncomment to run and check function output for xv = 0
disp('Part (b) Reflective Path Delay')
disp(['t2(0) = ' num2str(refl_delay(65,dt,c,dxr,dyr))])
%% Part (c): Received Signal at the Vehicle (Sum of 2 Signals) 

% Complete the following lines of Code 
% Uncomment to run

% Part 1: Predict Amplitude and Phase of rv using Phasor Addition Rule

% Amplitude and Phase Shift of Sinusoid 1: Direct Path from t1(xv)
A1 = 1; phi1  = 0
% Amplitude and Phase Shift of Sinusoid 2: Direct Path from t2(xv)
A2 = 1; phi2  = pi
% Use Phasor Addition Rule to calculate A, phi for rv (use pen and paper)

% Hint: Check your work using AddPhasors.m function you wrote down
% previously

Amps = [A1 A2]; Phases = [phi1 phi2];
[A,phi] = AddPhasors(Amps, Phases)
% Part 2: Plot total signal rv vs t (for fixed xv)

% Enter Inputs
f = 150*10^6;  % Hz
T = 1/f;  % Period (sec)
t = -3*T/2:T/300:3*T/2  % time samples for three cycles, 100 points per cycle
% vehicle position
xv = 0; 

% Call function dir_delay to compute delay of direct path
t1 = dir_delay(xv, dt, c);  

% Generate sinusoid signal from the direct signal
rdir = cos(2*pi*f*(t-t1));

% Call function refl_delay to compute delay of relected path
t2 = refl_delay(xv, dt, c, dxr, dyr); 

% Generate sinusoid signal from the reflected signal
rref = cos(2*pi*f*(t-t2) + pi);

% Compute Sum of Sinusoids 
rv = rdir + rref;

% Plot rv vs t when xv = 0;
figure; 
plot(t, rv)
hold on; 
title('Sum of Direct and Reflected Signals')
xlabel('Time (in secs)')
ylabel('Value of the Signal Received')
hold off
%% Part (d) Received signal strength versus xv

% Complete the following lines of Code 
% Uncomment to run

% Enter Inputs
lambda = c/f; % meters
xv = 0:lambda/100:300; 
N = length(xv); % # of points to use


% Compute Amplitude of rv for different xv
val = zeros(N,1);
for i = 1:N
    cxv = xv(i);
    t1 = dir_delay(cxv, dt, c); 
    t2 = refl_delay(cxv, dt, c, dxr, dyr);

    max = exp(-2*j*pi*f*t1)-exp(-2*j*pi*f*t2);
    val(i) = abs(max);
end

% Plot Amp of rv vs xv
figure,
plot(xv, val);
xlabel('Vehicle Position (in m)');
ylabel('Singal Strength')
title('Plot of Signal Strength vs Vehicle Position')
% Find Minimum Amplitude
round(min(val),4)