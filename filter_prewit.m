function img_out=filter_prewit(img)
[a,b,chan]=size(img);
if chan==3 
   img=rgbTogrey(img); 
end
%penentuan nilai Kernel
prewitthor = [-1 0 1; -1 0 1; -1 0 1];
prewittver = [-1 -1 -1; 0 0 0; 1 1 1];
 
for i=2:a-1
    for j=2: b-1
        y=i-1;
        x=j-1;
        pim=double(img(y:y+2,x:x+2));
        Horizontal(i,j)=sum(sum(pim.*prewitthor));
        Vertikal(i,j)=sum(sum(pim.*prewittver));
    end
end
img_out=uint8(sqrt((Horizontal.^2)+(Vertikal.^2)));
filter_prewit=img_out;