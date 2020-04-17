function plot_system(d_array,y_array,t)
% Faiyaz Chowdhury
% Plots System
% Start Date: 12/19/2019
% Last Update: 12/22/2019
% Version: 1.0.0

% d_array: Array of decisions for each time
% y_array: Happiness states for each time
% time: x-axis time

figure(1)
subplot(2,1,1);
plot(t, y_array)
title('Individual Happiness States')
xlabel('Time (s)'); ylabel('Value');
legend('Y (Individual States)')

subplot(2,1,2);
plot(t, mean(sum(y_array))*d_array/2,'*',t, sum(y_array))
title('Decisions and Total Happiness')
xlabel('Time (s)'); ylabel('D');
axis([0 t(end) 0 1.1*max(sum(y_array))])
legend('D (Decisions), Total Happiness')

end