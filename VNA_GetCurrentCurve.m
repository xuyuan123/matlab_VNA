function results = VNA_GetCurrentCurve(Obj,savefilename,datestring)
%% this function obtain the S parameters from the VNA.
% results =VNA_GetCurrentCurve(VNA,'after_cal');
% Author: XuYuan; 
basedir = 'D:/Data/';
if nargin<3 
    datestring=datestr(now,'yymmdd');
end

frequency = VNA_GetFreq(Obj);
rawdata = VNA_GetData(Obj);
results = [frequency,rawdata];
plot(frequency,rawdata,'DisplayName',strrep([savefilename,'_',datestring],'_','\_'));
xlabel('Frequency(GHz)');
ylabel('S parameter (dB)');
title(strrep([savefilename,'|',datestring],'_','\_'));

filepath = [basedir,datestring,'/'];
fullfilename = [filepath, savefilename, '.dat'];
if ~exist(filepath,'dir')
    mkdir(filepath);
end
dlmwrite(fullfilename,results,'delimiter','\t','precision','%.10f');
fullfigname = [filepath, savefilename, '.jpg'];
saveas(gcf,fullfigname);
end