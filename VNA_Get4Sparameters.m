function results = VNA_Get4Sparameters(Obj,savefilename,datestring,format)
%% this function obtain the four S parameters S11, S21, S12, S22 together from the VNA.
% results = VNA_Get4Sparameters(VNA,'after_cal');
% Author: XuYuan; 
basedir = 'D:/Data/';
if nargin<4  
    format = 'MLOG';
end
if nargin<3 
    datestring=datestr(now,'yymmdd');
end
parameters = {'S11', 'S22', 'S12', 'S21'};
for i=1:length(parameters)
    tempsavefilename= [savefilename,'_',parameters{i}];
    results(:,:,i) = VNA_GetSparameters(Obj,tempsavefilename,datestring,parameters{i},format);
    close all;
end
result_S11 = results(:,:,1);
result_S22 = results(:,:,2);
result_S12 = results(:,:,3);
result_S21 = results(:,:,4);
[hAx,hLine1,hLine2]=plotyy([result_S12(:,1).*1e-9,result_S21(:,1).*1e-9],[result_S12(:,2),result_S21(:,2)],...
    [result_S11(:,1).*1e-9,result_S22(:,1).*1e-9],[result_S11(:,2),result_S22(:,2)]);
% yyaxis right
% plot(results(:,1,1),results(:,2,1),results(:,1,2),results(:,2,2));
% yyaxis left
% plot(results(:,1,3),results(:,2,3),results(:,1,4),results(:,2,4));
hLine1(1).DisplayName = strrep([savefilename,'_',parameters{1}],'_','\_');
hLine1(2).DisplayName = strrep([savefilename,'_',parameters{2}],'_','\_');
hLine2(1).DisplayName = strrep([savefilename,'_',parameters{3}],'_','\_');
hLine2(2).DisplayName = strrep([savefilename,'_',parameters{4}],'_','\_');
auto2();%fixl();
xlabel('Frequency(GHz)'); xlim([min(result_S12(:,1).*1e-9),max(result_S12(:,1).*1e-9)]);
ylabel(hAx(1),'|S21|^2 & |S12|^2 (dB)');
ylabel(hAx(2),'|S11|^2 & |S22|^2 (dB)');
title(strrep([savefilename,'|',datestring,'4Scurve'],'_','\_'));
filepath = [basedir,datestring,'/'];
fullfigname = [filepath,savefilename,'_4Sdata.jpg'];
if ~exist(filepath,'dir')
    mkdir(filepath);
end
saveas(gcf,fullfigname);
end