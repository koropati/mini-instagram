function img_out=filter_roberts(img_in)
[row,col, chan]=size(img_in);
img_out=zeros(row-1,col-1);
if chan==3
    img_in=filter_grey(img_in);
end
img_in = double(img_in);
for i=1 : row-1
    for j=1 : col-1
        img_out(i,j)=sqrt((img_in(i,j)-img_in(i+1,j+1))^2+(img_in(i+1,j)-img_in(i,j+1))^2);
    end
end

img_out=uint8(img_out);
filter_roberts=img_out;