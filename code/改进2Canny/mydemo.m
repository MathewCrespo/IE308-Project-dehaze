%% mydemo.m�и����˼���dehaze���㷨��
%% myown_dahze��Ҫ������ʵ��CVPR09 ��ͨ��ȥ�� �� EECV2010 �����˲���dehaze�㷨��
%% myown_dehaze3���ûҶ�ͼ�ĸ�ʴ�����浼���˲�
%% myown_dehaze2���ڿ�ʼ�õ���ͨ����ʱ�������canny��Ե��⡣

warning('off','all');
clear all;
clc;
tic;
image = double(imread('tiananmen.png'))/255;
%image = imresize(image, 0.4);
figure,imshow(image);

 myown_dehaze(image,0.95,5);
 %myown_dehaze2(image,1,5);
 %myown_dehaze3(image, 0.95, 5); 

toc;


warning('on','all');