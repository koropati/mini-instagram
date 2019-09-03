function img_out=filter_tophat(img_in,ukuran)
[row,col,chan]=size(img_in);
if chan==3
    img_in=rgbTogrey(img_in);
end
opening=bukaTutup(img_in,ukuran,1);
row=size(opening,1);
col=size(opening,2);

img_out = imresize(img_in, [col,row]) - imresize(opening, [col,row]);

filter_tophat=img_out;