function [A,phi] = AddPhasors(Amps,Phases)
% 
% Student Name: Agam Goyal
%
% This function implements the Phasor Addition Rule
% Arguments: Amps -> Length N vector of Amplitudes
%                      Phases -> Length N vector of Phases
% Returns: A -> Resulting Amplitude
%                 phi -> Resulting Phase


z = sum(Amps.*exp(j*Phases));
A = abs(z);
phi = angle(z);