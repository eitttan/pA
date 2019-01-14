function [simSize,typeServers,speedServers] = enum2srting(simParam)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if (numel(unique(simParam(:,2))== 1))
    switch unique(simParam(:,2))
        case -1
            errordlg('not equal size sim');
        case 0 
            simSize = 'Large';
        case 1
            simSize = 'Small';
    end     
end
if (numel(unique(simParam(:,3))== 1))
    switch unique(simParam(:,3))
        case -1
            errordlg
        case 0 
            typeServers = 'homogenous';
        case 1
            typeServers = 'hetrogenous *2';
        case 2
            typeServers = 'hetrogenous *10';
    end     
end
if (numel(unique(simParam(:,4))== 1))
    switch unique(simParam(:,4))
        case -1
            errordlg('not equal ratio');%{ FAST_9_SLOW_1, FAST_5_SLOW_5, FAST_1_SLOW_9 
        case 0 
            speedServers = 'FAST_9_SLOW_1';
        case 1
            speedServers = 'FAST_5_SLOW_5';
        case 2
            speedServers = 'FAST_1_SLOW_9';
    end     
end
end

