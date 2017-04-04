function results = VNA_DataMath(Obj,func)
%% read and set the data math of the current data trace
% func must be one of the string {'NORM', 'DIV', 'MULT', 'SUBT' , 'ADD'}
% these functions corresponding to {math off; Data/Mem; Data X MEM; Data - MEM; Data + MEM;}
% Author: XuYuan; 
if nargin<2
    results = query(Obj, 'CALC1:MATH:FUNC?'); 
    results = deblank(results);
else
    fprintf(Obj,['CALC1:MATH:FUNC ', func, ' ']);
    results = func;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end