function img_out=len_d_neg(img_in)
[row,col,chan]=size(img_in);
dasar=filter_batik3(img_in);
%error when proceesing binary image
% img_out=img_in;
center_row=row/2;
center_col=col/2;
img_resize=img_zoomout(img_in,2);
img_c=flip_image(img_resize, 'V');

if chan == 3
    r_chan_c=img_c(:,:,1);
    g_chan_c=img_c(:,:,2);
    b_chan_c=img_c(:,:,3);
    r_dasar=dasar(:,:,1);
    g_dasar=dasar(:,:,2);
    b_dasar=dasar(:,:,3);
    for i=1 : row
        for j=1 : col
            if(j<=center_row && i<=center_col)
                out_r(i,j)=r_dasar(i,j);
                out_g(i,j)=g_dasar(i,j);
                out_b(i,j)=b_dasar(i,j);
            elseif(j>center_row && i<=center_col)
                out_r(i,j)=r_chan_c(i,j-center_col);
                out_g(i,j)=g_chan_c(i,j-center_col);
                out_b(i,j)=b_chan_c(i,j-center_col);
            elseif(j<=center_row && i>center_col)
                out_r(i,j)=r_dasar(i,j);
                out_g(i,j)=g_dasar(i,j);
                out_b(i,j)=b_dasar(i,j);
            elseif(j>center_row && i>center_col)
                out_r(i,j)=r_dasar(i,j);
                out_g(i,j)=g_dasar(i,j);
                out_b(i,j)=b_dasar(i,j);
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
                img_out(i,j)=dasar(i,j);
            elseif(j>center_row && i<=center_col)
                img_out(i,j)=img_c(i,j-center_col);
            elseif(j<=center_row && i>center_col)
                img_out(i,j)=dasar(i,j);
            elseif(j>center_row && i>center_col)
                img_out(i,j)=dasar(i,j);
            end
        end
    end
end

len_d_neg=img_out;