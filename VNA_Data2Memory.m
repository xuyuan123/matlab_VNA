function  VNA_Data2Memory(Obj)
%% This function write the current data into to the memory.
% Author: XuYuan; 
fprintf(Obj, ':CALC1:MATH:MEM');
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end