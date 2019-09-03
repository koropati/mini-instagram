function img_out=filter_bottomhat(img_in,ukuran)
[row,col,chan]=size(img_in);
if chan==3
    img_in=rgbTogrey(img_in);
end
clossing=bukaTutup(img_in,ukuran,0);
row=size(clossing,1);
col=size(clossing,2);
img_out = imresize(clossing, [col,row]) - imresize(img_in, [col,row]);

filter_bottomhat=img_out;