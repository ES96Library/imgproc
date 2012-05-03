function [Image]=subtractBackground1(Image)
    
    %create mask
    disp('create mask')
    mask = createmask2(Image);
    
    %crop mask and use to crop Image
    disp('crop mask & image')
    cropthres = 30;
    [left,right,bottom,top]=crop1(mask,cropthres);
    mask = imcrop(mask,[left top (right-left) (bottom-top)]);
    Image = imcrop(Image,[left top (right-left) (bottom-top)]); 
    if isempty(mask)
        return;
    end
    
    %rotate and recrop Image
    disp('rotating mask and image')
    theta = rotate1(mask);
    mask = imrotate(mask,theta);
    
    [left2,right2,bottom2,top2] = crop1(mask,cropthres);
    mask = imcrop(mask,[left2 top2 (right2-left2) (bottom2-top2)]);
    Image = imrotate(Image,theta);
    Image = imcrop(Image,[left2 top2 (right2-left2) (bottom2-top2)]);
    
    %make background white
    disp('making background white')
    mask1 = cast(mask,class(Image));
    mask = imcomplement(mask)*255;
    mask2 = cast(mask,class(Image));
    Image(:,:,1) = mask2 + mask1.*Image(:,:,1);
    Image(:,:,2) = mask2 + mask1.*Image(:,:,2);
    Image(:,:,3) = mask2 + mask1.*Image(:,:,3);
end