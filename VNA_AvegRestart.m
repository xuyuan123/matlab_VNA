function  VNA_AvegRestart(Obj)
% This function Re-start the average
% Author: XuYuan; 
fprintf(Obj, ':SENS1:AVER:CLE');
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end