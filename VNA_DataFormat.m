function results = VNA_DataFormat(Obj,foamat)
%% format must be one of these strings: {'MLOG', 'PHAS', 'REAL', 'IMAG'}
% read and set the format type of the sweep
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':CALC1:SEL:FORM?');
    results = deblank(results);
else
    fprintf(Obj,[':CALC1:SEL:FORM ', foamat, ' ']);
    results = foamat;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end