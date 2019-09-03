function img_out=filter_Lhsv(img_in)
[row,col,chan]=size(img_in);
if chan==3
   [H,S,V]=rgbToHSV(img_in);
   hue=H;
   saturnation=S;
   value=V;
   for i=1:row
       for j=1:col
           hue(i,j)=hue(i,j)*3;
           saturnation(i,j)=saturnation(i,j)*4;
           value(i,j)=value(i,j)*0.5;
       end
   end
   H=hue;
   S=saturnation;
   [R,G,B]=hsvToRGB(H,S,V);
   img_out=cat(3,R,G,B);
   img_out=uint8(img_out); 
else
    img_out=img_in;
end

filter_Lhsv=img_out;
