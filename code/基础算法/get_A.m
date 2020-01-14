function atmosphere_value = get_A (image,dark)
%% �ҵ�ǰ0.1%��ֵ���Ӷ���Ϊ������Aֵ
[width,depth,~]=size(image);
area= width*depth;
target_num = ceil(0.001*area);
darkline= reshape(dark,area,1);
imageline=reshape(image,area,3);

[~,index] = sort(darkline,'descend');

accu = zeros(1,3);
for i = 1:target_num
    accu = accu + imageline(index(i),:);
end
atmosphere_value = accu/ target_num;

end
