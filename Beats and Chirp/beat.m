function [xx, tt] = beat(A, fc, fa, fsamp, dur)
% #### Agam Goyal ####
% BEAT compute samples of the sum of two cosine waves
% 
% Usage:
% ==============================
% [xx, tt] = beat(A, fc, delf, fsamp, dur)
%
% Arguments:
% ==============================
% A = amplitude of both cosines
% fc = center frequency
% fa = frequency difference
% fsamp = sampling rate
% dur = total time duration in seconds
%
% Returns:
% ==============================
% xx = output vector of samples
% tt = time vector corresponding to xx

dt = 1/fsamp;
tt=0:dt:dur;
xx = 2*A*cos(2*pi*fa*tt).*cos(2*pi*fc*tt);