function results = VNA_AvegCount(Obj,counts)
%% read and set the average factor
% Author: XuYuan; 
if nargin<2
    results = query(Obj, 'SENS:AVER:COUN?');
    results = str2double(results);
else
    fprintf(Obj,['SENS:AVER:COUN ', num2str(counts)]);
    results = counts;
end
clrdevice(Obj);
VNA_WaitForSystemReady(Obj);
end