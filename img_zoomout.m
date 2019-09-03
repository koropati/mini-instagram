function img_out=img_zoomout(img_in,pengecilan)
[row,col,chan]=size(img_in);
s=size(img_in);
s1=s/pengecilan;
k=1;
l=1;
if chan == 3
    r_chan=img_in(:,:,1);
    g_chan=img_in(:,:,2);
    b_chan=img_in(:,:,3);
    
    for i=1:s1
        for j=1:s1
%             img_out(i,j)=grey_img(k,l);
            img_out_r(i,j)=r_chan(k,l);
            img_out_g(i,j)=g_chan(k,l);
            img_out_b(i,j)=b_chan(k,l);
            
            l=l+pengecilan;
        end
        l=1;
        k=k+pengecilan;
    end
    img_out(:,:,1)=img_out_r;
    img_out(:,:,2)=img_out_g;
    img_out(:,:,3)=img_out_b;
else
    for i=1:s1
        for j=1:s1
            img_out(i,j)=img_in(k,l);
            l=l+pengecilan;
        end
        l=1;
        k=k+pengecilan;
    end
end

img_zoomout=img_out;
