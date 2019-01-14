clc;clear;%close all
%% load file
path = uigetdir('*txt');
logFiles = dir(path);
data =cell(size(logFiles,2));
algoType = [];

for k = 3:size(logFiles,1)
    %if ~logFiles(i).isdir
    data{k-2}.vec = importdata([logFiles(k).folder '\' logFiles(k).name]);
    data{k-2}.name = logFiles(k).name;
    algoType =[algoType str2double(logFiles(k).name(1))];
end

%%
[C,ir,ic ] = unique(algoType);
numAlgo = numel(C);
numPointInAlgo = length(data)/numAlgo;
numRuns = length(data);

%% collect data
leg={};
x =[];y=[];
simParam = -1*(ones(numRuns,5));
%figure; hold on;
for j=1:numAlgo
    leg = [leg ,num2str(C(j))];
    for k =1 :numPointInAlgo
        i = numPointInAlgo*(j-1)+k;
        splName = strsplit(data{i}.name,'_');
        splName = splName(1:5);
        splName = cellfun(@str2num,splName,'UniformOutput',false);
        simParam(i,:)=cell2mat(splName);
        x(j,k) =splName{5};
        y(j,k) =sum(data{i}.vec)/numel(data{i}.vec);
    end
end

%% plot
f =figure;hold on
ax =f.Children;
for j =1 :numAlgo
    [xx idx] =sort(x(j,:),'ascend');
    yy =y(j,:);
    yy = yy(idx);
    plot (xx,yy,'-*');
end
legend (algoEnum(leg),'location','northwest');
xlabel ('ratio'); ylabel ('avg per job [sec]');
% to regular cases -all algo, include rand.
ylim ([0 max(max(y(2:numAlgo,:)))*1.1]);
xticks(xx);xtickangle(45);
ax.XGrid ='on';
[simSize,typeServers,speedServers] = enum2srting(simParam);
tit = 'avg time per job \newline';
paramString = [ simSize,' _ ',typeServers];
if ~strcmp(typeServers,'homogenous')
    paramString =[paramString , ' - ' , speedServers];
end
title([tit paramString]);
%save([paramString ,'.jpg'],'f');
%savefig(f,['graphs\' paramString]);
%%  convergence  graph
%
figure;hold on
ratios2show = [0 length(xx)-3 length(xx)-1];
ratios2show = [0 6:11]
for jj =1:numel(ratios2show)
    for j =1 :numAlgo
        d = data{ir(j)+ratios2show(jj)}.vec;
        dd =1:length(d);
        d=d(dd);
        xd = (1:numel(d));
        cd = cumsum(d);
        yd =cd(:) ./ xd(:) ;
        % yd = (cumsum(d)./xd);
        subplot(numel(ratios2show) , 1 ,jj);
        plot (xd,yd)
        hold on
    end
    xlabel('# slots'); ylabel ('avgTime per slot');
    title (['convergence  graph  R = ' ,num2str(xx(ratios2show(jj)+1))]);
end
legend (algoEnum(leg))

%}




