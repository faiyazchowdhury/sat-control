function [decisions_array] = sat_control_system(endt,S,R,T,A,B)
% Faiyaz Chowdhury
% Forward Euler System and Control of Emotionally Saturating System
% Start Date: 12/19/2019
% Last Update: 12/22/2019
% Version: 1.0.0

% S: Selection Matrix: Turn decisions into choices [CxD]
% R: Reward Matrix: Turns choices to a pleasure u. [NxC] or Neural Net
% T: Duration of doing each decision [Dx1]
% A: Addictiveness of each choice
% B: Boringness of each choice

% Initializing
[C,D] = size(S);
N = size(R,1);
h = 0.0001;
t = 0:h:endt;
r = ones(C,1); % [Cx1] Available Choices
y = zeros(N,1); % Initial Emotion states
y_array = zeros(N,length(t)); d_array = zeros(D,length(t));

decisions_array = zeros(1,ceil(endt/min(T)));
decisionCount = 0;
% Find best decision
decisionValue = zeros(D,1);
for decision = 1:D
    u = R*(S(:,decision).*r);
    decisionValue(decision) = sum((u-y.^A)./((y+1).^B));
end
[~,bestDecision] = max(decisionValue);
activityDurSum = 0;

%Starting System and Control
for i = 0:length(t)-1
    % microcontroller code (discrete-time update)
    if i*h-activityDurSum>T(bestDecision) % Sample till ActivityDur
        activityDurSum = i*h;
        % Find best decision
        decisionValue = zeros(D,1);
        for decision = 1:D
            u = R*(S(:,decision).*r);
            decisionValue(decision) = sum((u-y.^A)./((y+1).^B));
        end
        [~,bestDecision] = max(decisionValue);
        
        decisionCount = decisionCount+1;
        decisions_array(decisionCount) = bestDecision;
    end
    
    % store results
    y_array(:,i+1) = y; d_array(bestDecision,i+1) = 1;

    % plant physics (continuous-time update of human emotion)
    u = R*(S(:,bestDecision).*r);
    dy = (u-y.^A)./((y+1).^B);
    y = y + h.*dy;
end
decisions_array(decisionCount+1:end) = [];

end