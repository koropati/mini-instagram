function img_in_out=filter_emboss(img_in)

mask = [0 0 -1 ; 0 0 0 ; 1 0 0];
[row, col] = size(mask);

[nrow, ncol, chan] = size(img_in);
img_in = cast(img_in, 'double');
newimg_in = zeros(nrow-1,ncol-1);

if chan==3
% Inner
    r_chan=img_in(:,:,1);
    g_chan=img_in(:,:,2);
    b_chan=img_in(:,:,3);
    r_chan=r_chan(1:nrow-1,1:ncol-1);
    g_chan=g_chan(1:nrow-1,1:ncol-1);
    b_chan=b_chan(1:nrow-1,1:ncol-1);
    for i = 0.5*(row+1) : nrow - 0.5*(row+1)
        for j = 0.5*(col+1) : ncol - 0.5*(col+1)
            subMat = img_in(i-1:i+1,j-1:j+1);
            r_chan(i,j) = sum(sum(subMat.*mask)) + 128;
            g_chan(i,j) = sum(sum(subMat.*mask)) + 128;
            b_chan(i,j) = sum(sum(subMat.*mask)) + 128;
        end
    end
    newimg_in(:,:,1)=r_chan;
    newimg_in(:,:,2)=g_chan;
    newimg_in(:,:,3)=b_chan;

else
    for i = 0.5*(row+1) : nrow - 0.5*(row+1)
        for j = 0.5*(col+1) : ncol - 0.5*(col+1)
            subMat = img_in(i-1:i+1,j-1:j+1);
            newimg_in(i,j) = sum(sum(subMat.*mask)) + 128;
        end
    end
end

newimg_in = cast(newimg_in, 'uint8');

img_in_out=newimg_in;
