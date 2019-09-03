function img_out=img_posisi(img1,img2,pengecilan,posisi)
%Gambar dasar harus lebih besar, Img1 > img2
[row,col,chan]=size(img1);
img_out = img1;
if pengecilan == 0
    img_atas = img2;
else
    img_atas = img_zoomout(img2,pengecilan);
end

center_row=row/2;
center_col=col/2;
if chan==3
    r_img_atas=img_atas(:,:,1);
    g_img_atas=img_atas(:,:,2);
    b_img_atas=img_atas(:,:,3);
    
    r_img1=img1(:,:,1);
    g_img1=img1(:,:,2);
    b_img1=img1(:,:,3);
 for i = 1: row
   for j = 1: col
       
       if posisi==1
           if(j<=center_row && i<=center_col)
               img_out_r(i,j)=r_img_atas(i,j);
               img_out_g(i,j)=g_img_atas(i,j);
               img_out_b(i,j)=b_img_atas(i,j);
           else
               img_out_r(i,j)=r_img1(i,j);
               img_out_g(i,j)=g_img1(i,j);
               img_out_b(i,j)=b_img1(i,j);
           end
           
       elseif posisi==2
           if(j>center_row && i<=center_col)
               img_out_r(i,j)=r_img_atas(i,j-center_col);
               img_out_g(i,j)=g_img_atas(i,j-center_col);
               img_out_b(i,j)=b_img_atas(i,j-center_col);
           else
               img_out_r(i,j)=r_img1(i,j);
               img_out_g(i,j)=g_img1(i,j);
               img_out_b(i,j)=b_img1(i,j);
           end
       elseif posisi==3
           if(j<=center_row && i>center_col)
               img_out_r(i,j)=r_img_atas(i-center_row,j);
               img_out_g(i,j)=g_img_atas(i-center_row,j);
               img_out_b(i,j)=b_img_atas(i-center_row,j);
           else
               img_out_r(i,j)=r_img1(i,j);
               img_out_g(i,j)=g_img1(i,j);
               img_out_b(i,j)=b_img1(i,j);
           end
       elseif posisi==4
           if(j>center_row && i>center_col)
               img_out_r(i,j)=r_img_atas(i-center_row,j-center_col);
               img_out_g(i,j)=g_img_atas(i-center_row,j-center_col);
               img_out_b(i,j)=b_img_atas(i-center_row,j-center_col);
           else
               img_out_r(i,j)=r_img1(i,j);
               img_out_g(i,j)=g_img1(i,j);
               img_out_b(i,j)=b_img1(i,j);
           end
           
       elseif posisi==5
           center_w = center_row/2;
           center_h = center_col/2;
           if ( (j>center_w && j<=center_row+center_w) && (i>center_h && i<=center_col+center_h) )
               img_out_r(i,j)=r_img_atas(i-center_w,j-center_h);
               img_out_g(i,j)=g_img_atas(i-center_w,j-center_h);
               img_out_b(i,j)=b_img_atas(i-center_w,j-center_h);
           else
               img_out_r(i,j)=r_img1(i,j);
               img_out_g(i,j)=g_img1(i,j);
               img_out_b(i,j)=b_img1(i,j);
           end;
       end
    end
 end
    img_out(:,:,1)=img_out_r;
    img_out(:,:,2)=img_out_g;
    img_out(:,:,3)=img_out_b;  
else
for i = 1: row
   for j = 1: col
       
       if posisi==1
           if(j<=center_row && i<=center_col)
               img_out(i,j)=img_atas(i,j);
           else
               img_out(i,j)=img1(i,j);
           end
           
       elseif posisi==2
           if(j>center_row && i<=center_col)
               img_out(i,j)=img_atas(i,j-center_col);
           else
               img_out(i,j)=img1(i,j);
           end
       elseif posisi==3
           if(j<=center_row && i>center_col)
               img_out(i,j)=img_atas(i-center_row,j);
           else
               img_out(i,j)=img1(i,j);
           end
       elseif posisi==4
           if(j>center_row && i>center_col)
               img_out(i,j)=img_atas(i-center_row,j-center_col);
           else
               img_out(i,j)=img1(i,j);
           end
           
       elseif posisi==5
           center_w = center_row/2;
           center_h = center_col/2;
           if ( (j>center_w && j<=center_row+center_w) && (i>center_h && i<=center_col+center_h) )
               img_out(i,j)=img_atas(i-center_w,j-center_h);
           else
               img_out(i,j)=img1(i,j);
           end;
       end
    end
end
end

img_posisi=img_out;
