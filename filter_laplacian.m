function img_out = filter_laplacian(img_in)

[a, b, chan] = size(img_in);
img_out=zeros(a,b);   
if chan==3
    img_in=filter_grey(img_in);
end
img_in=double(img_in);
for i=2 : a-1
    for j=2 : b-1
        img_out(i, j) = 8 * img_in(i,j)-(img_in(i-1,j-1) + img_in(i-1,j)+ img_in(i-1,j+1) + img_in(i,j-1)+img_in(i,j+1)+img_in(i+1,j-1) + img_in(i+1,j)+img_in(i+1,j+1)) ;
        
    end
end

img_out = uint8(img_out);