%Generate Gaussian pulse sampled at a rate of 1000 GHz
function gaussource(fc,bw)
fs = 100*fc;    % sample freq

tc = gauspuls('cutoff',fc,bw);     % Width of pulse
t  = -1*tc : 1/fs : 1*tc;
source = gauspuls(t,fc,bw)'; % Signal evaluation time

time=(t-min(t))';

plot(time,source)

save source source time
