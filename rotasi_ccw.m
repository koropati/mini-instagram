function img_out=rotasi_ccw(img_in,jml_putar)
img_out=img_in;
[row,col,chan]=size(img_in);
while (jml_putar >= 1) %memutar n kali berlawanan arah jarum jam
if chan==3
    r_chan=img_in(:,:,1);
    g_chan=img_in(:,:,2);
    b_chan=img_in(:,:,3);
    for i=1 : row
        for j=1 : col
            img_out_r(col+1-j,i)=r_chan(i,j);
            img_out_g(col+1-j,i)=g_chan(i,j);
            img_out_b(col+1-j,i)=b_chan(i,j); 
        end
    end
    img_out(:,:,1)=r_img;
    img_out(:,:,2)=g_img;
    img_out(:,:,3)=b_img;
else
    for i=1 : row
        for j=1 : col
            img_out(col+1-j,i)=img_in(i,j); 
        end
    end
    img_in=img_out;
end
jml_putar=jml_putar-1;
end

rotasi_ccw=img_out;