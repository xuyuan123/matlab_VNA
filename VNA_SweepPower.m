function results = VNA_SweepPower(Obj,power)
%% read and set the power of the sweep
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':SOUR1:POW?');
    results = str2double(results);
else
    fprintf(Obj,[':SOUR1:POW ', num2str(power)]);
    results = power;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end