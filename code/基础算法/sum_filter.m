function sum_img = sum_filter(image, radius)

[width, depth] = size(image);
sum_img = zeros(size(image));

%% ����Y����ۼ�
im_cum = cumsum(image, 1);
%% ���ȿ����ײ���H������
sum_img(1:radius+1, :) = im_cum(1+radius:2*radius+1, :); % �м�����
sum_img(radius+2:width-radius, :) = im_cum(2*radius+2:width, :) - im_cum(1:width-2*radius-1, :); %β������
sum_img(width-radius+1:width, :) = repmat(im_cum(width, :), [radius, 1]) - im_cum(width-2*radius:width-radius-1, :);

%% Ȼ����X�᷽����ۼ�
im_cum = cumsum(sum_img, 2);

sum_img(:, 1:radius+1) = im_cum(:, 1+radius:2*radius+1);
sum_img(:, radius+2:depth-radius) = im_cum(:, 2*radius+2:depth) - im_cum(:, 1:depth-2*radius-1);
sum_img(:, depth-radius+1:depth) = repmat(im_cum(:, depth), [1, radius]) - im_cum(:, depth-2*radius:depth-radius-1);

end


