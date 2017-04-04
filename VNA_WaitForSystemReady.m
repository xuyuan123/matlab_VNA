function VNA_WaitForSystemReady(Obj)
% Author: XuYuan; 
opcStatus = 0;
while(~opcStatus)
    opcStatus = query(Obj, '*OPC?','%s\n','%d'); 
    pause(1);
end
end