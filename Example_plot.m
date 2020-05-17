
%Getting a file - the save files will 
file_path = ls([pwd '\P*']);

%Plotting baseline airway.
result_sturct = Unpack_loaded_sturct('P_11664A_LU.mat');

%Ploting the figure
figure
area_array = result_sturct.tapering_raw_image.area_results.phyiscal_area;
arclength = result_sturct.tapering_raw_image.arclegth;
tapering_vaule = result_sturct.tapering_raw_image.area_results.tapering;

%Plotting follow up airway.
result_sturct_2 = Unpack_loaded_sturct('P_11664B_LU.mat');

%Ploting the figure
figure
area_array_2 = result_sturct_2.tapering_raw_image.area_results.phyiscal_area;
arclength_2 = result_sturct_2.tapering_raw_image.arclegth;
tapering_vaule_2 = result_sturct_2.tapering_raw_image.area_results.tapering;

coefficients = polyfit(arclength, log(area_array), 1);
xFit = linspace(min(arclength), max(arclength), 1000);
yFit = polyval(coefficients , xFit);

hold on
plot(arclength,log(area_array))
grid on
%hold on
plot(arclength_2,log(area_array_2),'r')
legend('Baseline', 'Follow up')
xlabel('Arclength mm')
ylabel('Log Area')
title(['11664 Left Upper Lobe.'])
