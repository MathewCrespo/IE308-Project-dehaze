%% mydemo.m中给出了几种dehaze的算法：
%% myown_dahze主要是联合实现CVPR09 暗通道去噪 和 EECV2010 导向滤波的dehaze算法；
%% myown_dehaze3是用灰度图的腐蚀来代替导向滤波
%% myown_dehaze2是在开始得到暗通道的时候采用了canny边缘检测。

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