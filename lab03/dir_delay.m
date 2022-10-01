function [t1] = dir_delay(xv, dt, c)
% 
% Student Name: Agam Goyal
%
% This function calculates the time taken by the
% sinusoidal signal to reach the vehicle directly
%
% Arguments: xv -> Position of the vehicle
%                      dt-> y-coordinate of the transmitter 
%                      c-> Speed of Light
% Returns: t1 -> The values of the resulting Sinusoidal Signal

t1 = sqrt(dt^2 + xv^2)/c;
end