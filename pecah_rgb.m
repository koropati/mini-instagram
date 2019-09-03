function img_out=pecah_rgb(img_in, channel)
[row,col,chan]=size(img_in);
if chan==3
    if channel == 'r'
       img_out=img_in(:,:,1);
    elseif channel == 'g'
        img_out=img_in(:,:,2);
    elseif channel == 'b'
        img_out=img_in(:,:,3);
    end
else
    img_out=img_in;
end

pecah_rgb=img_out;