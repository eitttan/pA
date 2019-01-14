%% create log file
% config
algoType = [0 1 2 3];
simSize = [zeros(1,7) ones(1,7)]; % 0 Large , 1 Small
serverType = [0 1 1 1 2 2 2 0 1 1 1 2 2 2]; %0 -homo,1  hetro *2 ,2  hetro *2
serverDist = [0 0 1 2 0 1 2 0 0 1 2 0 1 2]; % 0 9-1 , 1 5-5 ,2 1-9
ratio = [0.6 0.7  0.8 0.83 0.86 0.88 0.9 0.92 0.94 0.96 0.97 0.99];
numLogs = 14;
%% 
sizeVec = numel(algoType).*numel(ratio);
algoVec = repmat(algoType,(numel(ratio)),1);
algoVec =reshape(algoVec ,sizeVec,1);
ratioVec = repmat(ratio',1,(numel(algoType)));
ratioVec =reshape(ratioVec ,sizeVec,1);

for i =1:numLogs
simSizeVec =simSize(i).* ones(sizeVec,1);
serverTypeVec =serverType(i).* ones(sizeVec,1);
serverDistVec =serverDist(i).* ones(sizeVec,1);


mat = [algoVec simSizeVec serverTypeVec serverDistVec ratioVec];
%% write to log
filename = ['simConf_' , num2str(numel(algoType)),'Algo_', num2str(simSize(i)),'_',num2str(serverType(i)),...
    '_',num2str(serverDist(i)),'_',num2str(numel(ratio)),'RatioS.txt'];
 dlmwrite(['inputFiles\' filename],mat,'delimiter',' ');
end

