function results = VNA_GetSparameters(Obj,savefilename,datestring,Sparameter,format)
%% this function obtain the S parameters from the VNA.
% results =VNA_GetSparameters(VNA,'after_cal');
% Author: XuYuan; 
basedir = 'D:/Data/';
if nargin<5
    format = 'MLOG';
end
if nargin<4  
    Sparameter='S21';
end
if nargin<3 
    datestring=datestr(now,'yymmdd');
end
VNA_DataFormat(Obj,format);
VNA_MeasType(Obj,Sparameter);
frequency = VNA_GetFreq(Obj);
rawdata = VNA_GetData(Obj);
results = [frequency,rawdata];
plot(frequency.*1e-9,rawdata, 'DisplayName',strrep([savefilename,'_',datestring,'_',Sparameter],'_','\_'));
xlabel('Frequency(GHz)');xlim([min(frequency.*1e-9),max(frequency.*1e-9)]);
ylabel(['|',Sparameter,'|^2 (dB)']);
title(strrep([savefilename,'|',datestring,'|',Sparameter,'|',format],'_','\_'));
auto2();%fixl();
filepath = [basedir,datestring,'/'];
fullfilename = [filepath, savefilename, '.dat'];
if ~exist(filepath,'dir')
    mkdir(filepath);
end
dlmwrite(fullfilename,results,'delimiter','\t','precision','%.10f');
fullfigname = [filepath, savefilename, '.jpg'];
saveas(gcf,fullfigname);
end