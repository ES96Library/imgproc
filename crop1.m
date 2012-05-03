function [left,right,bottom,top] = crop1(mask,thresh)
    [height,width] = size(mask);
    left = 0;
    right = 0;
    top = 0;
    bottom = 0;
    for n=1:width
        if sum(mask(:,n)) > thresh
            left = n;
            break
        end
    end
    for n=1:width
        if sum(mask(:,width-n+1)) > thresh
            right = width-n+1;
            break
        end
    end
    for n=1:height
        if sum(mask(n,:)) > thresh
            top = n;
            break
        end
    end
    for n=1:height
        if sum(mask(height-n+1,:)) > thresh
            bottom = height-n+1;
            break
        end
    end