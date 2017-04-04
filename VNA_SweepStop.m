function results = VNA_SweepStop(Obj,freq)
%% read and set the stop frequency of the sweep
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':SENS1:FREQ:STOP?');
    results = str2double(results);
else
    fprintf(Obj,[':SENS1:FREQ:STOP ', num2str(freq)]);
    results = freq;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end