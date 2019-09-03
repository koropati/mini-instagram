function img_out=img_cliping(img_in)
if(img_in>255)
    img_out=255;
elseif((img_in<=255) && (img_in>=0))
    img_out=img_in;
else
   img_out=0;
end
img_cliping=img_out;