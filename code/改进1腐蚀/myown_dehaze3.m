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
%% �õ�ͼ��İ�ͨ��
dark_channel = get_dark(image, win_size);

%% �õ�����ֵ
atmosphere = get_A(image, dark_channel);
%% �õ������Ĵ�������ֵ
[trans_est,~] = get_t(image, atmosphere, omega, win_size);

%% ��͸���ʵĴ������ûҶ�ͼ�ĸ�ʴ�����Ż�trans_est�����Ƶ�������ͼƬ��
%B1=[0 0.0001 0
%    0.0001 0.0001 0.0001
 %   0 0.0001 0];

%B2=[0 0.9 0
%    0.9 0.9 0.9
%    0 0.9 0];

B3=0.001*ones(5,5);
%B4=0.001*ones(6,6);



trans_improved= imerode(trans_est, B3);

%% �����ͼƬ�С�����ȥ
img=final_dehaze(trans_improved,image,atmosphere);
figure;
imshow(img);



end

