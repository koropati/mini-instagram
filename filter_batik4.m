function img_out=filter_batik4(img_in)
dasar=uint8(zeros(size(img_in)));
dasar1=flip_lena(img_in);
dasar1=filter_negatif(dasar1);
dasar2=img_posisi(dasar,dasar1,2,1);
dasar3=img_posisi(dasar2,dasar1,2,2);
dasar4=img_posisi(dasar3,dasar1,2,3);
dasar5=img_posisi(dasar4,dasar1,2,4);
dasar6=img_posisi(dasar5,dasar1,2,5);


img_out=dasar6;
filter_batik4=img_out;