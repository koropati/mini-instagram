function img_out=filter_sobel(img)
[a,b,chan]=size(img);
if chan==3
   img=rgbTogrey(img); 
end

%penentuan nilai Kernel
sobelhor = [-1 0 1; -2 0 2; -1 0 1];
sobelver = [-1 -2 -1; 0 0 0; 1 2 1];

%deteksi kordinat x 
for i=2:a-1
    for j=2: b-1
        y=i-1;
        x=j-1;
        pim=double(img(y:y+2,x:x+2));
        Horizontal(i,j)=sum(sum(pim.*sobelhor));
        Vertikal(i,j)=sum(sum(pim.*sobelver));
    end
end
img_out=uint8(sqrt((Horizontal.^2)+(Vertikal.^2)));
filter_sobel=img_out;