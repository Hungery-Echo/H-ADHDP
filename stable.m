% Data for Battery Capacity Loss (Table 3) 
drive_cycles = {'MANHATTAN', 'UDDS', 'WLTC', '1015_6PRIUS', 'WVUSUB', 'WVUCITY', 'WVUNTER'};
benchmark_capacity_loss = [2.081e-5, 8.361e-5, 2.807e-3, 1.854e-5, 4.092e-5, 1.733e-5, 8.099e-5];
h_adhdp_capacity_loss = [1.109e-5, 4.700e-5, 1.020e-3, 1.325e-5, 3.129e-5, 1.271e-5, 6.911e-5];

% Data for Energy Consumption (Table 4)
energy_consumption_benchmark = [1.244, 3.335, 0.330, 0.927, 0.455, 1.932];
energy_consumption_h_adhdp = [0.954, 3.281, 0.328, 0.918, 0.434, 1.856];

% Data for Iteration Time per step (Table 5)
iteration_cycles = {'UDDS', 'WLTC', 'WVUNTER'};
iteration_time_min = [0.09, 0.07, 0.08];
iteration_time_max = [26.14, 27.23, 25.67];

% Create a figure for Battery Capacity Loss
figure(1);
bar_data = bar([benchmark_capacity_loss; h_adhdp_capacity_loss]', 'stacked');
set(gca, 'xticklabel', drive_cycles);
ylabel('Battery Capacity Loss (%)');
title('Battery Capacity Loss Comparison');
legend('Benchmark', 'H-ADHDP');
grid on;

% Set soft colors for Benchmark and H-ADHDP
bar_data(1).FaceColor = [0 0.5 0]; % Green for Benchmark
bar_data(2).FaceColor = [1 0.6 0]; % Orange for H-ADHDP

% Add data labels for Battery Capacity Loss
for i = 1:length(benchmark_capacity_loss)
    text(i, benchmark_capacity_loss(i)/2, num2str(benchmark_capacity_loss(i), '%.2e'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'black');
    text(i, benchmark_capacity_loss(i) + h_adhdp_capacity_loss(i)/2, num2str(h_adhdp_capacity_loss(i), '%.2e'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'black');
end

% Adjust the Y-axis range for better visibility
ylim([0 4e-3]);

% Create a figure for Energy Consumption
figure(2);
bar_data = bar([energy_consumption_benchmark; energy_consumption_h_adhdp]', 'grouped');
set(gca, 'xticklabel', drive_cycles(1:end-1)); % Exclude the last cycle to match the data length
ylabel('Energy Consumption (kWh)');
title('Energy Consumption Comparison');
legend('Benchmark', 'H-ADHDP');
grid on;

% Set soft colors for Benchmark and H-ADHDP
bar_data(1).FaceColor = [0 0.5 0]; % Green for Benchmark
bar_data(2).FaceColor = [1 0.6 0]; % Orange for H-ADHDP

% Add data labels for Energy Consumption
for i = 1:length(energy_consumption_benchmark)
    text(i, energy_consumption_benchmark(i)/2, num2str(energy_consumption_benchmark(i), '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'black');
    text(i, energy_consumption_benchmark(i) + energy_consumption_h_adhdp(i)/2, num2str(energy_consumption_h_adhdp(i), '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'black');
end

% Adjust the Y-axis range for better visibility
ylim([0 4]);

% Create a figure for Iteration Time per Step
figure(3);
bar_data = bar([iteration_time_min; iteration_time_max]', 'grouped');
set(gca, 'xticklabel', iteration_cycles);
ylabel('Iteration Time (ms)');
title('Iteration Time per Step');
legend('Minimum Time', 'Maximum Time');
grid on;

% Set soft colors for Minimum Time and Maximum Time
bar_data(1).FaceColor = [0 0.5 0]; % Green for Minimum Time
bar_data(2).FaceColor = [1 0.6 0]; % Orange for Maximum Time

% Add data labels for Iteration Time per Step
for i = 1:length(iteration_time_min)
    text(i, iteration_time_min(i)/2, num2str(iteration_time_min(i), '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'black');
    text(i, iteration_time_min(i) + iteration_time_max(i)/2, num2str(iteration_time_max(i), '%.2f'), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'black');
end

% Adjust the Y-axis range for better visibility
ylim([0 30]);

% Adjust figure size and spacing
set(gcf, 'Position', [100, 100, 800, 600]); % Adjust the figure size
