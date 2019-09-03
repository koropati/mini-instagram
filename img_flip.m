function img_out = img_flip(img_in,flip)
width = size(img_in,1);
height = size(img_in,2);

for i=1:width
    for j=1:height
        if (flip=='H')
            img_out(i,(height+1)-j)= img_in(i,j);
        elseif(flip=='V')
            img_out((height+1)-i,j)= img_in(i,j);
        elseif(flip=='HV')
            img_out((width+1)-i,(height+1)-j)= img_in(i,j);
        end
       
    end
end


img_flip = img_out;