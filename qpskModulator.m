function y = qpskModulator(x)
%qpskModulator QPSK modulator with pulse shaping
%   Y = qpskModulator(X,SPS) QPSK modulates the input X, and returns the
%   root-raised cosine pulse shaped signal Y. X must be a column vector
%   of values in the set [0 3]. The root-raised cosine filter has a
%   roll-off factor of 0.35 and spans four symbols. The output signal
%   Y has unit power.

filterCoeffs = rcosdesign(0.35, 4, 8);
% Modulate
syms = pskmod(x,4,pi/4);
% Pulse shape
y = filter(filterCoeffs, 1, upsample(syms,8));
end