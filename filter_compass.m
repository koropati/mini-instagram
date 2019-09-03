function img_out=filter_compass(img)
[a,b,chan]=size(img);
if chan==3
   img=rgbTogrey(img); 
end
%penentuan nilai Kernel
utara = [1 1 1; 1 -2 1; -1 -1 -1];
selatan = [-1 -1 -1; 1 -2 1; 1 1 1];
timur = [-1 1 1; -1 -2 1; -1 1 1];
barat = [1 1 -1; 1 -2 -1; 1 1 -1];
 
for i=2:a-1
    for j=2: b-1
        y=i-1;
        x=j-1;
        pim=double(img(y:y+2,x:x+2));
        Barat(i,j)=sum(sum(pim.*barat));
        Utara(i,j)=sum(sum(pim.*utara));
        Timur(i,j)=sum(sum(pim.*timur));
        Selatan(i,j)=sum(sum(pim.*selatan));
    end
end
img_out=uint8(sqrt((Utara.^2)+(Timur.^2)+(Barat.^2)+(Selatan.^2)));
filter_compass = img_out;