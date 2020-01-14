function q = guided_filter_my(guide, result, radius, para)
%% 实现导向滤波，防止边缘平滑化

[h, w] = size(guide);

avg_denom = sum_filter(ones(h, w), radius);

mean_g = sum_filter(guide, radius) ./ avg_denom;
mean_t = sum_filter(result, radius) ./ avg_denom;
corr_gg = sum_filter(guide .* guide, radius) ./ avg_denom;
corr_gt = sum_filter(guide .* result, radius) ./ avg_denom;

var_g = corr_gg - mean_g .* mean_g;
cov_gt = corr_gt - mean_g .* mean_t;

a = cov_gt ./ (var_g + para);
b = mean_t - a .* mean_g;

mean_a = sum_filter(a, radius) ./ avg_denom;
mean_b = sum_filter(b, radius) ./ avg_denom;

q = mean_a .* guide + mean_b;

end