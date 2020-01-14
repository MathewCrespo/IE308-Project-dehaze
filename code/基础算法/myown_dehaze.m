function [ trans_est,A ] = myown_dehaze( image, omega, win_size )
%% ��Ҫ�ǽ�cvpr09 ��eecv10�����������������
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

%% ϸ������ֵ������һ���˲� 
x = guided_filter_my(rgb2gray(image), trans_est, r, res);

improved_tran= reshape(x, m, n);
%% �����ͼƬ�С�����ȥ
img=final_dehaze(improved_tran,image,atmosphere);


figure;
imshow(img);



end

