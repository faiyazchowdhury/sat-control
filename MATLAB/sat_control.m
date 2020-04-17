function [decisions_array,S,R,T,A,B] = sat_control(N,C,D,endt,...
                                       avrR,stdR,lowT,...
                                       rangeT,lowA,rangeA,lowB,rangeB,...
                                       sparseS,sparseR,see,saveName)
% Faiyaz Chowdhury
% Simulation of System and Control of Emotionally Saturating System
% Start Date: 12/19/2019
% Last Update: 12/22/2019
% Version: 1.0.0

%[decisions_array,S,R,T,A,B] = sat_control(8,6,10,200,40,10,0.3,0.4,0,4,0,4,0.3,0.3,1,'Trial1')

% N: Dimention of independent Saturating States (States of System)
% C: Dimention of Choices (Input of System)
% D: Dimention of Decisions (Choice combinations (Control input of System)
% endt: Simulation end time
% avrR: Average of Reward Values
% stdR: Standard Deviation of Reward Values
% lowT: Lowest Possible Activity Duration
% rangeT: Difference of high and lowest possible Activity Duration
% lowA: Lowest possible Addictiveness
% rangeA: Difference of high and lowest possible Addictiveness
% lowB: Lowest possible Boringness
% rangeB: Difference of high and lowest possible Addictiveness
% see: Plots a graph if true
% saveName: .mat filename containing values of S,R,T,A,B

[S,R,T,A,B] = generateVals(N,C,D,avrR,stdR,lowT,rangeT,lowA,rangeA,...
                                    lowB,rangeB,sparseS,sparseR);
[decisions_array] = sat_control_system(endt,S,R,T,A,B);
save(strcat(saveName,'.mat'))
if(see)
    plot_system(d_array,y_array,t) 
end
end