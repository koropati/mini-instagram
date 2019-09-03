function img_out=len_d(img_in)
[row,col,chan]=size(img_in);
img_out=uint8(zeros(size(img_in))); %error when proceesing binary image
% img_out=img_in;
center_row=row/2;
center_col=col/2;
img_resize=img_zoomout(img_in,2);
img_c=flip_image(img_resize, 'V');

if chan == 3
    r_chan_c=img_c(:,:,1);

    g_chan_c=img_c(:,:,2);

    b_chan_c=img_c(:,:,3);

    
    for i=1 : row
        for j=1 : col
            if(j<=center_row && i<=center_col)
                out_r(i,j)=img_out(i,j);
                out_g(i,j)=img_out(i,j);
                out_b(i,j)=img_out(i,j);
            elseif(j>center_row && i<=center_col)
                out_r(i,j)=r_chan_c(i,j-center_col);
                out_g(i,j)=g_chan_c(i,j-center_col);
                out_b(i,j)=b_chan_c(i,j-center_col);
            elseif(j<=center_row && i>center_col)
                out_r(i,j)=img_out(i,j);
                out_g(i,j)=img_out(i,j);
                out_b(i,j)=img_out(i,j);
            elseif(j>center_row && i>center_col)
                out_r(i,j)=img_out(i,j);
                out_g(i,j)=img_out(i,j);
                out_b(i,j)=img_out(i,j);
            end
        end
    end
    img_out(:,:,1)=out_r;
    img_out(:,:,2)=out_g;
    img_out(:,:,3)=out_b;
else
    for i=1 : row
        for j=1 : col
            if(j<=center_row && i<=center_col)
                img_out(i,j)=img_out(i,j);
            elseif(j>center_row && i<=center_col)
                img_out(i,j)=img_c(i,j-center_col);
            elseif(j<=center_row && i>center_col)
                img_out(i,j)=img_out(i,j);
            elseif(j>center_row && i>center_col)
                img_out(i,j)=img_out(i,j);
            end
        end
    end
end

len_d=img_out;