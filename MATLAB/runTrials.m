function runTrials
% Faiyaz Chowdhury
% Multiple trials of System and Control of Emotionally Saturating System
% Start Date: 12/22/2019
% Last Update: 12/22/2019
% Version: 1.0.0

for i = 1:200
N = randi(32);
C = randi(32);
D = randi(32);
avrR = randi(200);
stdR = randi(50);
lowT = 5*rand(1);
rangeT = 5*rand(1);
lowA = 10*rand(1);
rangeA = 10*rand(1);
lowB = 10*rand(1);
rangeB = 10*rand(1);
sparseS = rand(1);
sparseR = rand(1);
see = 0;
endt = rangeT+lowT+randi(200);
saveName = strcat('trial',num2str(i));
[~,~,~,~,~,~] = sat_control(N,C,D,endt,...
                                       avrR,stdR,lowT,...
                                       rangeT,lowA,rangeA,lowB,rangeB,...
                                       sparseS,sparseR,see,saveName);
end
end