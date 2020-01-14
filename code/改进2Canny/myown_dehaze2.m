function [ img] = myown_dehaze2( image, omega, win_size )
%% ����canny���Ӵ���ͼƬ���õ���ͨ��

if ~exist('omega', 'var')
    omega = 0.95;
end

if ~exist('win_size', 'var')
    win_size = 15;
end

%r = 15;
%res = 0.001;
%[m,n,~]= size (image);

image_R = image(:,:,1);
%image_G = image(:,:,2);
%image_B = image(:,:,3);
I1 = edge (image_R,'canny');
%I2=  edge (image_G,'canny');
%I3=  edge (image_B,'canny');

%B=0.1*[0 1 0
%   1 1 1
%   0 1 0];

%B=ones(5,5);
%edge_canny= imdilate(I1,B);

%% �õ�ͼ��İ�ͨ��
dark_channel = get_dark_improved(I1,image, win_size);
%figure,imshow(dark_channel);
%dark_channel2 = get_dark(image,win_size);
%figure,imshow(dark_channel2);
%% �õ�����ֵ
atmosphere = get_A_new(dark_channel,image)
%% �õ������Ĵ�������ֵ
trans_est = get_t_new(dark_channel,omega);
%% ��͸���ʵĴ���
%B1=[0 0.0001 0
%    0.0001 0.0001 0.0001
%    0 0.0001 0];

%B2=[0 0.9 0
%    0.9 0.9 0.9
%    0 0.9 0];

B3=0.01*ones(5,5);
%B4=0.001*ones(6,6);



trans_improved= imerode(trans_est, B3);

%% �����ͼƬ�С�����ȥ
img=final_dehaze(trans_improved,image,atmosphere);
%img2=final_dehaze(trans_est,image,atmosphere);

figure,imshow(img);



end

