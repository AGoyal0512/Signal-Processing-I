function [t2] = refl_delay(xv, dt, c, dxr,  dyr)
% 
% Student Name: Agam Goyal
%
% This function calculates the time taken by the sinusoidal 
% signal to reach the vehicle after relfection from the reflector
%
% Arguments: xv -> Position of the vehicle
%                      dt-> y-coordinate of the transmitter 
%                      c-> Speed of Light
%                      dxr-> x-coordinate of the Reflector
%                      dyr-> y-coordinate of the Reflector
% Returns: t2 -> The values of the resulting Sinusoidal Signal

t2 = (sqrt(dxr^2 + (dt-dyr)^2) + sqrt((dxr-xv)^2 + dyr^2))/c;
end