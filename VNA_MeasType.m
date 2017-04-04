function results = VNA_MeasType(Obj,sparameter)
%% sparameter must be one of these strings: {'S11', 'S21', 'S12', 'S22'}
% read and set the measure type of the sweep
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':CALC1:PAR1:DEF?');
    results = deblank(results);
else
    fprintf(Obj,[':CALC1:PAR1:DEF ', sparameter, ' ']);
    results = sparameter;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end