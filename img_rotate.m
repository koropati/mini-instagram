function img_out=img_rotate(img_in, a)
[row,col,chan]=size(img_in);
img_out=zeros(size(img_in));
midx=ceil((row+1)/2);
midy=ceil((col+1)/2);

degree=a*pi/180;

for i=1 : row
    for j=1 : col
        x= (i-midx)*cos(degree)+(j-midy)*sin(degree);
        y=-(i-midx)*sin(degree)+(j-midy)*cos(degree);
        x=round(x)+midx;
        y=round(y)+midy;
        
        if (x>=1 && y>=1 && x<=col && y<=row)
            img_out(i,j)=img_in(x,y); % k degrees rotated image         
        end
    end
end

img_rotate=img_out;