function img_out = flip_ver(img_in)
width = size(img_in,1);
height = size(img_in,2);

for i=1:width
    for j=1:height
        img_out((height+1)-i,j)= img_in(i,j);
    end
end
flip_ver = img_out;