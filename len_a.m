function img_out=len_a(img_in)
[row,col,chan]=size(img_in);
img_out=uint8(zeros(size(img_in))); %error when proceesing binary image
% img_out=img_in;
center_row=row/2;
center_col=col/2;
img_resize=img_zoomout(img_in,2);
img_a=img_resize;
if chan == 3
    r_chan_a=img_a(:,:,1);
    g_chan_a=img_a(:,:,2);
    b_chan_a=img_a(:,:,3);

    for i=1 : row
        for j=1 : col
            if(j>center_row && i>center_col)
                out_r(i,j)=r_chan_a(i-center_row,j-center_col);
                out_g(i,j)=g_chan_a(i-center_row,j-center_col);
                out_b(i,j)=b_chan_a(i-center_row,j-center_col);
            end
        end
    end
    img_out(:,:,1)=out_r;
    img_out(:,:,2)=out_g;
    img_out(:,:,3)=out_b;
else
    for i=1 : row
        for j=1 : col
            if(j>center_row && i>center_col)
                img_out(i,j)=img_a(i-center_row,j-center_col);
            end
        end
    end
end

len_a=img_out;