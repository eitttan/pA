clc;clear;
in = dir('inputFiles');
%% small
for i=13:16
    disp ('i = '); disp (i);
   filename = in(i).name
   cmd =['Project1.exe inputFiles\' filename];
   system (cmd)
end

%% large 
for i=3:9
   filename = in(i).name;
   cmd =['Project1.exe inputFiles\' filename];
   system (cmd)
end