function dark = get_dark_improved(edge_canny,image,winsize)
%% �ھֲ����ڵ�ͼ��Χ�ڣ��ҵ�RGB��ͨ������Сֵ���ɴ˵õ���ͨ��
[width,depth,~] =size(image);

edge=floor(winsize/2);
%% ��ͼ�����������м䣬�����ط����ţ����㴰�ڲ��ҡ�
image_window = padarray(image, [edge edge], 256);
dark = zeros(width, depth); 
%% ����ͼ����ÿһ�������еİ�ֵ���Ӷ��õ���ͨ��
for i=1:width
    for j=1:depth
        if (edge_canny(i,j) == 0)
        current_window = image_window(i:i+winsize-1,j:j+winsize-1,:);
        dark(i,j) = min(current_window(:));
        end
        dark(i,j) = min(image_window(i,j,:));
    end
end





end