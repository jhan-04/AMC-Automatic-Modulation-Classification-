function y = pam4Modulator(x)

%pam4Modulator PAM4 modulator with pulse shaping
%   Y = pam4Modulator(X,SPS) PAM4 modulates the input X, and returns the
%   root-raised cosine pulse shaped signal Y. X must be a column vector
%   of values in the set [0 3]. The root-raised cosine filter has a
%   roll-off factor of 0.35 and spans four symbols. The output signal
%   Y has unit power.

amp = 1 / sqrt(mean(abs(pammod(0:3, 4)).^2));
filterCoeffs = rcosdesign(0.35, 4, 8);

syms = amp *pammod(x,4);

% Square-root raised cosine filter

y = filter(filterCoeffs, 1, upsample(syms,8));%sample per symbol
end