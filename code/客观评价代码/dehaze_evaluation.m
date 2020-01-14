%% 去雾效果的客观评价。
out=imread('chubusenlin.jpg');
in=imread('forest.jpg');
HSVout=rgb2hsv(out);
HSVin=rgb2hsv(in);
H_out=mean(HSVout(:,:,1));
H_in=mean(HSVin(:,:,1));

score=abs((H_out-H_in)/H_in)