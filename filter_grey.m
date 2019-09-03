function img_out = filter_grey(image)
[row, col, chan]=size(image);
i = image;
if chan==3
        R = i(:, :, 1);
        G = i(:, :, 2);
        B = i(:, :, 3);
        img_out = zeros(row, col, 'uint8');
        
        for x=1:row
           for y=1:col
               img_out(x,y) = (R(x,y)*.3)+(G(x,y)*.6)+(B(x,y)*.1);
           end
        end
else
    img_out=i;
end
filter_grey = img_out;