function img_out=filter_median(img_in,window_size)
%window_size=ganjil;
[row, col, chan]=size(img_in);
border_size=(window_size-1)/2;
img_out=uint8(zeros(row-(2*border_size),col-(2*border_size)));
img_filter=uint8(zeros(window_size,window_size));
if chan==3
    r_chan=img_in(:,:,1);
    g_chan=img_in(:,:,2);
    b_chan=img_in(:,:,3);
    for i=border_size+1:row-border_size
    for j=border_size+1:col-border_size
        for i_img_filter=1:window_size
            for j_img_filter=1:window_size
                img_filter_r(i_img_filter,j_img_filter)=r_chan(i-border_size+i_img_filter-1,j-border_size+j_img_filter-1);
                img_filter_g(i_img_filter,j_img_filter)=g_chan(i-border_size+i_img_filter-1,j-border_size+j_img_filter-1);
                img_filter_b(i_img_filter,j_img_filter)=b_chan(i-border_size+i_img_filter-1,j-border_size+j_img_filter-1);
            end
        end
        img_out_r(i-border_size,j-border_size)=mean(img_filter_r(:));
        img_out_g(i-border_size,j-border_size)=mean(img_filter_g(:));
        img_out_b(i-border_size,j-border_size)=mean(img_filter_b(:));
    end
    end
    img_out(:,:,1)=img_out_r;
    img_out(:,:,2)=img_out_g;
    img_out(:,:,3)=img_out_b;
else
    for i=border_size+1:row-border_size
    for j=border_size+1:col-border_size
        for i_img_filter=1:window_size
            for j_img_filter=1:window_size
                img_filter(i_img_filter,j_img_filter)=img_in(i-border_size+i_img_filter-1,j-border_size+j_img_filter-1);
            end
        end
        img_out(i-border_size,j-border_size)=mean(img_filter(:));
    end
    end
end
    
filter_median=img_out;