function results = VNA_SweepPoints(Obj,points)
%% read and set the power of the sweep
% Author: XuYuan; 
if nargin<2
    results = query(Obj, 'SENS:SWE:POIN?'); 
    results = str2double(results);
else
    fprintf(Obj,['SENS:SWE:POIN ', num2str(points)]);
    results = points;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end