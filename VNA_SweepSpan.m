function results = VNA_SweepSpan(Obj,freq)
%% read and set the span frequency of the sweep
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':SENS1:FREQ:SPAN?');
    results = str2double(results);
else
    fprintf(Obj,[':SENS1:FREQ:SPAN ', num2str(freq)]);
    results = freq;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end