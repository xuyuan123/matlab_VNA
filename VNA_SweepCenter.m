function results = VNA_SweepCenter(Obj,freq)
%% read and set the center frequency of the sweep
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':SENS1:FREQ:CENT?');
    results = str2double(results);
else
    fprintf(Obj,[':SENS1:FREQ:CENT ', num2str(freq)]);
    results = freq;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end