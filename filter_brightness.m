function img_out=filter_brightness(img_in,B)
%only for color_depth==8, citra grey
[row,col,chan]=size(img_in);
% height=size(img_in,1);
% width=size(img_in,2);
img_out=uint8(zeros(size(img_in)));
if chan ==3 
    rColor = img_in(:, :, 1);
    gColor = img_in(:, :, 2);
    bColor = img_in(:, :, 3);
    for i = 1: row
        for j = 1: col
           rColor(i,j)=img_cliping(rColor(i,j)+B);
           gColor(i,j)=img_cliping(gColor(i,j)+B);
           bColor(i,j)=img_cliping(bColor(i,j)+B);
        end
    end
    img_out = cat(3, rColor, gColor, bColor);
else
    
    for i=1:row
        for j=1:col
            img_out(i,j)=img_cliping(img_in(i,j)+B);
        end
    end
end
filter_brightness=img_out;
