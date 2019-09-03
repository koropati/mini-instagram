function img_out = img_blend(img_1,img_2,blend)

height=size(img_1,1);
width=size(img_1,2);
blend2=1-blend;

img_out = img_2;
for i=1:height
        for j=1:width
            img_out(i,j) = (img_1(i,j)*blend)+(img_2(i,j)*blend2);
            
        end
    end
 img_blend=img_out;