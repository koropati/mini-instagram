function img_out=rotasi_cw(img_in,jml_putar)
img_out=img_in;
[row,col,chan]=size(img_in);
while (jml_putar >= 1) %memutar n kali searah jarum jam
if chan==3
    r_chan=img_in(:,:,1);
    g_chan=img_in(:,:,2);
    b_chan=img_in(:,:,3);
    for i=1 : row
        for j=1 : col
            img_out_r(j,col+1-i)=r_chan(i,j);
            img_out_g(j,col+1-i)=g_chan(i,j);
            img_out_b(j,col+1-i)=b_chan(i,j);
        end
    end
    img_out(:,:,1)=img_out_r;
    img_out(:,:,2)=img_out_g;
    img_out(:,:,3)=img_out_b;
else
    for i=1 : row
        for j=1 : col
            img_out(j,col+1-i)=img_in(i,j); 
        end
    end
    img_in=img_out;
end
jml_putar=jml_putar-1;
end

rotasi_cw=img_out;