function VNA_AutoScale(Obj)
%% This function auto scale the Y axis.
% Author: XuYuan; 
fprintf(Obj, ':DISP:WIND1:TRAC1:Y:AUTO');
VNA_WaitForSystemReady(Obj);
clrdevice(Obj);
end