function results = VNA_AvegStates(Obj,states)
% states must be one of these strings: {'ON', 'OFF'}
% read and set the average state of the sweep; the results is bool number
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':SENS1:AVER?');
    results = deblank(results);
    results = logical(str2double(results));
else
    fprintf(Obj,[':SENS1:AVER ', states]);
    if strcmp(states,'OFF')
        results = false;
    else
        results = true;
    en
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end