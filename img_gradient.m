function img_out=img_gradient(img)
[a, b]=size(img);

%penentuan nilai Kernel
gradienthor = [-1 1];
gradientver = [-1 1];

%deteksi kordinat x 
for i=2:a-1
    for j=2: b-1
        y=i-1;
        x=j-1;
        pim=double(img(y:y+1,x:x+1));
        Horizontal(i,j)=sum(sum(pim.*gradienthor));
        Vertikal(i,j)=sum(sum(pim.*gradientver));
    end
end
img_out=uint8(sqrt((Horizontal.^2)+(Vertikal.^2)));
img_gradient=img_out