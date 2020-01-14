function [t,temp] = get_t (image,atmosphere_value, w, winsize)
%% 得到物理模型中光线的
[width,depth,~]=size(image);
temp=ones(width,depth,3);
temp(:,:,1)=atmosphere_value(1)*temp(:,:,1);
temp(:,:,2)=atmosphere_value(2)*temp(:,:,2);
temp(:,:,3)=atmosphere_value(3)*temp(:,:,3);

t = 1- w * get_dark(image./ temp, winsize);








end