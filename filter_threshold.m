function img_out = filter_threshold(img_in, T)
[row, col, chan] =size(img_in);
    %perulangan untuk mencari nilai pixel tiap baris dan kolom citra
    if chan==3
       img_in=rgbTogrey(img_in); 
    end
    for i=1 :row
        for j=1 :col
            %jika nilai pixel dari citra lebih besar sama dengan nilai T
            %maka tentukan nilai array a menjadi 255;
            if (img_in(i,j) >= T)
                img_out(i,j)=255;
            %jika nilai pixel dari citra lebih kecil nilai T
            %maka tentukan nilai array a menjadi 0;
            else   
                img_out(i,j)=0;
            end
        end
    end
filter_threshold = img_out;