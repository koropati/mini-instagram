function img_out=Gradient(img)
[a,b]=size(img);

%penentuan nilai Kernel
gradienthor = [-1 1];
gradientver = [-1 1];

%deteksi kordinat x 
for i=2:a-1
    for j=2: b-1
        y=i-1;
        x=j-1;
        pim=double(img(y:y+2,x:x+2));
        Horizontal(i,j)=sum(sum(pim.*gradienthor));
        Vertikal(i,j)=sum(sum(pim.*gradientver));
    end
end
img_out=uint8(sqrt((Horizontal.^2)+(Vertikal.^2)));
Gradient=img_out