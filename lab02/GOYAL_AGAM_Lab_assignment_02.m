%% 
% *Block (a):* Generate a series of time values

tt = linspace(-0.00025, 0.00025, 4000);
%% 
% *Block (b):* Find the values of two sinusoids at the time points from *Block 
% (a)*

A1 = 11; A2 = 16; f0 = 4000;
x1 = A1*cos(2*pi*f0*(tt - .00009));
x2 = A2*cos(2*pi*f0*(tt + .00001));
%% 
% *Block (c):* Create a third sinusoid as the sum of the two sinusoids you found 
% in *Block (b)*

x3 = x1 + x2;
%% 
% *Block (d):* Plot the three sinusoids

subplot(3,1,1), plot(tt, x1)
xlabel('t (seconds)');
title('First Sinusoid');
subplot(3,1,2), plot(tt, x2)
xlabel('t (seconds)');
title('Second Sinusoid');
subplot(3,1,3), plot(tt, x3)
xlabel('t (seconds)');
title('Sum of Sinusoids - Agam Goyal');