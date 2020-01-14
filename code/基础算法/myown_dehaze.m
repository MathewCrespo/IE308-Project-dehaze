function [ trans_est,A ] = myown_dehaze( image, omega, win_size )
%% 主要是将cvpr09 和eecv10的两个方法结合起来
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

%% 细化折射值，进行一次滤波 
x = guided_filter_my(rgb2gray(image), trans_est, r, res);

improved_tran= reshape(x, m, n);
%% 将雾从图片中“减”去
img=final_dehaze(improved_tran,image,atmosphere);


figure;
imshow(img);



end

