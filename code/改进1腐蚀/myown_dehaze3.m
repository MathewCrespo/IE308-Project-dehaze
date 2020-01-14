function [ trans_est,A ] = myown_dehaze3( image, omega, win_size )

if ~exist('omega', 'var')
    omega = 0.95;
end

if ~exist('win_size', 'var')
    win_size = 15;
end

r = 15;
res = 0.001;
[m,n,~]= size (image);
%% 得到图像的暗通道
dark_channel = get_dark(image, win_size);

%% 得到大气值
atmosphere = get_A(image, dark_channel);
%% 得到初步的大气折射值
[trans_est,~] = get_t(image, atmosphere, omega, win_size);

%% 对透射率的处理：采用灰度图的腐蚀，来优化trans_est（估计的折射率图片）
%B1=[0 0.0001 0
%    0.0001 0.0001 0.0001
 %   0 0.0001 0];

%B2=[0 0.9 0
%    0.9 0.9 0.9
%    0 0.9 0];

B3=0.001*ones(5,5);
%B4=0.001*ones(6,6);



trans_improved= imerode(trans_est, B3);

%% 将雾从图片中“减”去
img=final_dehaze(trans_improved,image,atmosphere);
figure;
imshow(img);



end

