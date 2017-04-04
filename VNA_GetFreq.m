function results = VNA_GetFreq(Obj)
%% This function obtain the x-axis frequency data.
% Author: XuYuan; 
fprintf(Obj, ':SENS1:FREQ:DATA?');
pause(3);
results = binblockread(Obj, 'double');
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end