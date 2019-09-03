function img_out=filter_batik3(img_in)
dasar=uint8(zeros(size(img_in)));
dasar1=flip_lena(img_in);
dasar1=filter_negatif(dasar1);
dasar2=img_posisi(dasar,dasar1,2,1);
dasar3=img_posisi(dasar2,dasar1,2,2);
dasar4=img_posisi(dasar3,dasar1,2,3);
dasar5=img_posisi(dasar4,dasar1,2,4);
dasar6=img_posisi(dasar5,dasar1,2,5);

dasar7=img_posisi(dasar,dasar6,2,1);
dasar8=img_posisi(dasar7,dasar6,2,2);
dasar9=img_posisi(dasar8,dasar6,2,3);
dasar10=img_posisi(dasar9,dasar6,2,4);

img_out=dasar10;
filter_batik3=img_out;