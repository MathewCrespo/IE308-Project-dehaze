function [t] = get_t_new (dark_channel, w)
%% 得到物理模型中光线的透射率
t = 1- w * dark_channel;

end