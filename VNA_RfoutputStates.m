function results = VNA_RfoutputStates(Obj,states)
% states must be one of these strings: {'ON', 'OFF'}
% read and set the Rf output state of the VNA
% Author: XuYuan; 
if nargin<2
    results = query(Obj, ':OUTP?');
    results = deblank(results);
    results = logical(str2double(results));
else
    fprintf(Obj,[':OUTP ', states]);
    if strcmp(states,'OFF')
        results = false;
    else
        results = true;
    end
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end