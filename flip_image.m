function img_out=flip_image(img_in,perintah)
[row,col,chan]=size(img_in);
img_out=uint8(zeros(size(img_in)));
if chan==3
    r_chan=pecah_rgb(img_in,'r');
    g_chan=pecah_rgb(img_in,'g');
    b_chan=pecah_rgb(img_in,'b');
    if perintah == 'H'
        for i = 1: row
            for j = 1: col
               img_out_r(i,j)=r_chan(i,(col+1)-j);
               img_out_g(i,j)=g_chan(i,(col+1)-j);
               img_out_b(i,j)=b_chan(i,(col+1)-j);
            end
        end
    elseif perintah == 'V'
        for i = 1: row
            for j = 1: col
               img_out_r(i,j)=r_chan((row+1)-i,j);
               img_out_g(i,j)=g_chan((row+1)-i,j);
               img_out_b(i,j)=b_chan((row+1)-i,j);
            end
        end
    elseif perintah == 'HV'
        for i = 1: row
            for j = 1: col
               img_out_r(i,j)=r_chan((row+1)-i,(col+1)-j);
               img_out_g(i,j)=g_chan((row+1)-i,(col+1)-j);
               img_out_b(i,j)=b_chan((row+1)-i,(col+1)-j);
            end
        end
    end
    img_out(:,:,1)=img_out_r;
    img_out(:,:,2)=img_out_g;
    img_out(:,:,3)=img_out_b;
else
    if perintah == 'H'
        for i = 1: row
            for j = 1: col
               img_out(i,j)=img_in(i,(col+1)-j);
            end
        end
    elseif perintah == 'V'
        for i = 1: row
            for j = 1: col
               img_out(i,j)=img_in((row+1)-i,j);
            end
        end
    elseif perintah == 'HV'
        for i = 1: row
            for j = 1: col
               img_out(i,j)=img_in((row+1)-i,(col+1)-j);
            end
        end
    end
end

flip_image=img_out;