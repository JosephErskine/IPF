%% Old log method
%sd_transpose = transpose(series_differece);
%sd_size = size(sd_transpose);
%sd_array = sd_transpose(index_of_dilatation:(sd_size(1)));
%sd_sum = sum(sd_array);

%% New method
load('baseline_alinged_area.mat');
load('follow_alinged_area.mat');
base_area = transpose(baseline_alinged_area);
follow_area = transpose(follow_alinged_area);
base_size = size(base_area);
follow_size = size(follow_area);
series_diff = follow_area(index_of_dilatation) - base_area(index_of_dilatation);
% Calculating percentage volume change
series_diff = follow_area(index_of_dilatation:follow_size(1)) - base_area(index_of_dilatation:base_size(1));
perc_diff = (sum(series_diff)/sum(base_area(index_of_dilatation:(base_size(1)))))*100;
% An array with percentage volume change, baseline and follow up area after
% dilatation.
final_array = [perc_diff, sum(base_area(index_of_dilatation:end)), sum(follow_area(index_of_dilatation:end))];