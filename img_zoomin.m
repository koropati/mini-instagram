function image_output=img_zoomin(img_input,pembesaran)
[row,col,chan]=size(img_input);    
image_output=uint8(zeros(row*pembesaran,col*pembesaran));
if chan == 3
    r_chan=img_input(:,:,1);
    g_chan=img_input(:,:,2);
    b_chan=img_input(:,:,3);
    
    for i=1:row
        for j=1:col
            for k=i*pembesaran-1:i*pembesaran
                for l=j*pembesaran-1:j*pembesaran
                    image_output_r(k,l)=r_chan(i,j);
                    image_output_g(k,l)=g_chan(i,j);
                    image_output_b(k,l)=b_chan(i,j);
                end
            end
        end
    end
    image_output(:,:,1)=image_output_r;
    image_output(:,:,2)=image_output_g;
    image_output(:,:,3)=image_output_b;
else
    for i=1:row
        for j=1:col
            for k=i*pembesaran-1:i*pembesaran
                for l=j*pembesaran-1:j*pembesaran
                    image_output(k,l)=img_input(i,j);
                end
            end
        end
    end
end
img_zoomin=image_output;