function results = VNA_GetData(Obj)
%% this function obtain the current data of the sweep unit in dB.
% Author: XuYuan; 
fprintf(Obj, ':CALC1:DATA:FDATA?');
pause(3);
results0 = binblockread(Obj, 'double');
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
points = VNA_SweepPoints(Obj);
results1 = reshape(results0,2,points);
results = results1(1,:);
results = results' ;
end