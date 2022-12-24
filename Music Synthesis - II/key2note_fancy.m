function xx = key2note_fancy(X, keynum, dur, fs)
% KEY2NOTE_FANCY Produce a sinusoidal waveform corresponding to a
% given piano key number by applying its ADSR envelope to the first three 
% harmonics of the notes
%
% usage: xx = key2note_env (X, keynum, dur, fs)
%
% xx = the output sinusoidal waveform
% X = complex amplitude for the sinusoid, X = A*exp(j*phi).
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note
% fs = sampling frequency
%

tt = 0:(1/fs):dur;
freq = 440 * (2^(1/12))^(keynum-49);
E = getADSR(length(tt));
xx = E .* (real(X*exp(1j*2*pi*freq*tt)) + 0.7*real(X*exp(1j*2*pi*(2*freq)*tt)) + 0.6*real(X*exp(1j*2*pi*(3*freq)*tt)));
