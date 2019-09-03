function img_out=filter_freichen(img_in)
[row,col, chan]=size(img_in);
img_out=zeros(row-1,col-1);
akar2 = sqrt(2);

if chan==3
    img_in=filter_grey(img_in);
else
    
end

img_in = double(img_in);
    for i=1 : row-2
    for j=1 : col-2
        img_out(i, j) = sqrt(...
            (img_in(i,j+2)+akar2*img_in(i+1,j+2)+img_in(i+2,j+2) - ...
             img_in(i,j)-akar2*img_in(i+1,j)-img_in(i+2,j))^2 + ...
            (img_in(i,j)+akar2*img_in(i,j+1)+img_in(i,j+2) - ...
             img_in(i+2,j)-akar2*img_in(i+2,j+1)-img_in(i+2,j+2))^2);
    end
    end
    img_out=uint8(img_out);

filter_freichen=img_out;