function dark = get_dark_improved(edge_canny,image,winsize)
%% 在局部窗口的图像范围内，找到RGB三通道的最小值，由此得到暗通道
[width,depth,~] =size(image);

edge=floor(winsize/2);
%% 把图像矩阵放在最中间，其他地方扩张，方便窗口查找。
image_window = padarray(image, [edge edge], 256);
dark = zeros(width, depth); 
%% 遍历图像，找每一个窗口中的暗值，从而得到暗通道
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