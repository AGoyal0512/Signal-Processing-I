function [x, t] = one_cos(A, omega, phi, dur)
% 
% Student Name: Agam Goyal
%
% A function to generate a sinusoid 
%               x(t)=Acos(ωt+ϕ)  
% of duration `dur` seconds
%
% Arguments: A -> Amplitude of the Sinusoid
%                      omega -> Angular Frequency of the Sinusoid
%                      phi -> Phase of the Sinusoid
%                      dur -> Duration for which we want to generate the sinusoid 
% Returns: x -> The values of the resulting Sinusoidal Signal
%                 t -> Corresponding Times for the Sinusoid

f = omega/(2*pi);
T = 1/f;

t = 0:T/20:dur;
x = A*cos(2*pi*f*t+ phi);

