function img_out=filter_batik1(img_in)
dasar=uint8(zeros(size(img_in)));

dasar1=flip_lena(img_in);
dasar2=img_posisi(dasar,dasar1,2,1);
dasar3=img_posisi(dasar2,dasar1,2,2);
dasar4=img_posisi(dasar3,dasar1,2,3);
dasar5=img_posisi(dasar4,dasar1,2,4);
dasar6=img_posisi(dasar5,dasar1,2,5);

dasar7=img_posisi(dasar,dasar6,2,1);
dasar8=img_posisi(dasar7,dasar6,2,2);
dasar9=img_posisi(dasar8,dasar6,2,3);
dasar10=img_posisi(dasar9,dasar6,2,4);

dasar11=img_posisi(dasar,dasar10,2,1);
dasar12=img_posisi(dasar11,dasar10,2,2);
dasar13=img_posisi(dasar12,dasar10,2,3);
dasar14=img_posisi(dasar13,dasar10,2,4);

b=len_d(img_in);
a=flip_image(b,'H');
d=len_a(img_in);
c=flip_image(d,'H');
tengah=flip_lena(img_in);
tengah2=rotasi_cw(tengah,1);
tengah3=img_posisi(tengah2,tengah,2,5);
tengah=img_posisi(tengah,tengah3,2,5);

d1=img_posisi(dasar14,a,2,1);
d2=img_posisi(d1,b,2,2);
d3=img_posisi(d2,c,2,3);
d4=img_posisi(d3,d,2,4);
d5=img_posisi(d4,tengah,2,5);
h=img_posisi(dasar,d5,2,1);
h=img_posisi(h,d5,2,2);
h=img_posisi(h,d5,2,3);
img_out=img_posisi(h,d5,2,4);

filter_batik1=img_out;