function [mask]=createmask2(Image)
    thresh = 0.04;
    Image = rgb2hsv_fast(Image,'single','H'); 
    [height,width] = size(Image);
    ref_image = repmat(Image(10,10), [height,width]);
    mask = abs(Image - ref_image) > thresh;
    mask = imfill(mask, 'holes');
end