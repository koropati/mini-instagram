function img_out=flip_lena3(img_in)
[row,col,chan]=size(img_in);
img_out=uint8(zeros(size(img_in))); %error when proceesing binary image
% img_out=img_in;
center_row=row/2;
center_col=col/2;

img_a=img_zoomout(len_a(img_in));
img_b=flip_image(img_resize,'H');
img_c=flip_image(img_resize, 'V');
img_d=flip_image(img_resize, 'HV');
if chan == 3
    r_chan_a=img_a(:,:,1);
    r_chan_b=img_b(:,:,1);
    r_chan_c=img_c(:,:,1);
    r_chan_d=img_d(:,:,1);
    
    g_chan_a=img_a(:,:,2);
    g_chan_b=img_b(:,:,2);
    g_chan_c=img_c(:,:,2);
    g_chan_d=img_d(:,:,2);
    
    b_chan_a=img_a(:,:,3);
    b_chan_b=img_b(:,:,3);
    b_chan_c=img_c(:,:,3);
    b_chan_d=img_d(:,:,3);
    
    for i=1 : row
        for j=1 : col
            if(j<=center_row && i<=center_col)
                out_r(i,j)=r_chan_a(i,j);
                out_g(i,j)=g_chan_a(i,j);
                out_b(i,j)=b_chan_a(i,j);
            elseif(j>center_row && i<=center_col)
                out_r(i,j)=r_chan_b(i,j-center_col);
                out_g(i,j)=g_chan_b(i,j-center_col);
                out_b(i,j)=b_chan_b(i,j-center_col);
            elseif(j<=center_row && i>center_col)
                out_r(i,j)=r_chan_c(i-center_row,j);
                out_g(i,j)=g_chan_c(i-center_row,j);
                out_b(i,j)=b_chan_c(i-center_row,j);
            elseif(j>center_row && i>center_col)
                out_r(i,j)=r_chan_d(i-center_row,j-center_col);
                out_g(i,j)=g_chan_d(i-center_row,j-center_col);
                out_b(i,j)=b_chan_d(i-center_row,j-center_col);
            end
        end
    end
    r_tengah=img_zoomout(out_r,2);
    g_tengah=img_zoomout(out_g,2);
    b_tengah=img_zoomout(out_b,2);
    
    img1_r=img_zoomout(r_chan_a,2);
    img1_g=img_zoomout(g_chan_a,2);
    img1_b=img_zoomout(b_chan_a,2);
    
    img2_r=img_zoomout(r_chan_b,2);
    img2_g=img_zoomout(g_chan_b,2);
    img2_b=img_zoomout(b_chan_b,2);
    
    img3_r=img_zoomout(r_chan_c,2);
    img3_g=img_zoomout(g_chan_c,2);
    img3_b=img_zoomout(b_chan_c,2);
    
    img4_r=img_zoomout(r_chan_d,2);
    img4_g=img_zoomout(g_chan_d,2);
    img4_b=img_zoomout(b_chan_d,2);
    for i=1 : row
        for j=1 : col
            if (j<=(center_row/2) && i<=(center_col/2))
                %img1
                r_image(i,j)=img1_r(i,j);
                g_image(i,j)=img1_g(i,j);
                b_image(i,j)=img1_b(i,j);
            elseif (j>(center_row+(center_row/2)) && i<=(center_col/2))
                %img2
                r_image(i,j)=img2_r(i,j-(center_row+(center_row/2)));
                g_image(i,j)=img2_g(i,j-(center_row+(center_row/2)));
                b_image(i,j)=img2_b(i,j-(center_row+(center_row/2)));
            elseif ( (j>(center_row/2) && j<=(center_row+(center_row/2))) && ( (i>(center_col/2)) && (i<=(center_col+(center_col/2))) ))
                %imgcenter
                r_image(i,j)=r_tengah(i-(center_col/2),j-(center_row/2));
                g_image(i,j)=g_tengah(i-(center_col/2),j-(center_row/2));
                b_image(i,j)=b_tengah(i-(center_col/2),j-(center_row/2));
                
            elseif (j<=(center_row/2) && i>(center_col+(center_col/2)))
                %img3
                r_image(i,j)=img3_r(i-(center_col+(center_col/2)),j);
                g_image(i,j)=img3_g(i-(center_col+(center_col/2)),j);
                b_image(i,j)=img3_b(i-(center_col+(center_col/2)),j);
                
            elseif (j>(center_row+(center_row/2)) && i>(center_col+(center_col/2)))
                %img4
                r_image(i,j)=img4_r(i-(center_col+(center_col/2)),j-(center_row+(center_row/2)));
                g_image(i,j)=img4_g(i-(center_col+(center_col/2)),j-(center_row+(center_row/2)));
                b_image(i,j)=img4_b(i-(center_col+(center_col/2)),j-(center_row+(center_row/2)));
            end
        end
    end
    
    img_out(:,:,1)=r_image;
    img_out(:,:,2)=g_image;
    img_out(:,:,3)=b_image;
    
else
    for i=1 : row
        for j=1 : col
            if(j<=center_row && i<=center_col)
                img_out(i,j)=img_a(i,j);
            elseif(j>center_row && i<=center_col)
                img_out(i,j)=img_b(i,j-center_col);
            elseif(j<=center_row && i>center_col)
                img_out(i,j)=img_c(i-center_row,j);
            elseif(j>center_row && i>center_col)
                img_out(i,j)=img_d(i-center_row,j-center_col);
            end
        end
    end
end

flip_lena3=img_out;