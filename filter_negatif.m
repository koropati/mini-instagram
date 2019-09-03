function img_out=filter_negatif(img_in)
[row, col, chan]=size(img_in);
img_out=uint8(zeros(size(img_in)));
if chan == 3
    r_chan=img_in(:,:,1);
    g_chan=img_in(:,:,2);
    b_chan=img_in(:,:,3);
    for i=1:row
        for j=1:col
            r_img(i,j)=255-r_chan(i,j);
            g_img(i,j)=255-g_chan(i,j);
            b_img(i,j)=255-b_chan(i,j);
        end
    end
    img_out(:,:,1)=r_img;
    img_out(:,:,2)=g_img;
    img_out(:,:,3)=b_img;  
else
    for i=1:row
        for j=1:col
            img_out(i,j)=255-img_in(i,j);
        end
    end
end
filter_negatif=img_out;
%versi pendek
%img_out=255-img_in;