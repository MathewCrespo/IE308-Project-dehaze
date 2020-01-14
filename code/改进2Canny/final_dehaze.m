function img = final_dehaze(trans_est, image, A)
[width,depth,~]=size(image);
temp=zeros(width,depth,3);
temp(:,:,1)=trans_est;
temp(:,:,2)=trans_est;
temp(:,:,3)=trans_est;

AA=ones(width,depth,3);
AA(:,:,1)=A(1)*AA(:,:,1);
AA(:,:,2)=A(1)*AA(:,:,2);
AA(:,:,3)=A(1)*AA(:,:,3);

img=((image-AA)./temp)+AA;
end