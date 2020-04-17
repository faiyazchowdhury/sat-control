function [S,R,T,A,B] = generateVals(N,C,D,avrR,stdR,lowT,...
                                    rangeT,lowA,rangeA,lowB,rangeB,...
                                    sparseS,sparseR)
% Faiyaz Chowdhury
% Random Matrix Gen of Selection, Reward, Duration, Addiction and Boredom
% Start Date: 12/22/2019
% Last Update: 12/22/2019
% Version: 1.0.0
                                
% N: Dimention of independent Saturating States (States of System)
% C: Dimention of Choices (Input of System)
% D: Dimention of Decisions (Choice combinations (Control input of System)
% avrR: Average of Reward Values
% stdR: Standard Deviation of Reward Values
% lowT: Lowest Possible Activity Duration
% rangeT: Difference of high and lowest possible Activity Duration
% lowA: Lowest possible Addictiveness
% rangeA: Difference of high and lowest possible Addictiveness
% lowB: Lowest possible Boringness
% rangeB: Difference of high and lowest possible Addictiveness
% sparseS: Chance of entry being S
% sparseR: Chance of entry being R

S = rand(C,D)<sparseS;  % [CxD]
R = (avrR+(stdR*randn(N,C))).*(rand(N,C)<sparseR);% [NxC]; or Neural Net
T = lowT+(rangeT*rand(D,1)); % [Dx1]
A = lowA+(rangeA*rand(N,1)); % [Nx1] % Addictiveness
B = A+(lowB+(rangeB*rand(N,1))); % [Nx1] % Boringness
end