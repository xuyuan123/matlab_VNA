function Obj = VNA_connect(gpib)
%% This function connect the VNA with the gpib
% VNA = VNA_connect('GPIB0::6::INSTR');
% Author: XuYuan; 
Obj = visa('agilent',gpib);
set(Obj, 'Timeout', 500);
set(Obj, 'InputBufferSize', 100000);
fopen(Obj);
query(Obj, '*OPC?','%s\n','%d');
VNA_WaitForSystemReady(Obj);
fprintf(Obj,':FORM:BORD SWAP');
fprintf(Obj,':FORM:DATA REAL');
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end