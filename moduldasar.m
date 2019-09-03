clc;
clear all;
close all;
warning('off', 'Images:initSize:adjustingMag');
camera='cam.bmp';
lena='lena.bmp';
citraBiner='CitraBiner.bmp';

info =imfinfo(camera);
% imageinfo(h,info);
color_depth=info.BitDepth;
% width=info.Width;
% height=info.Height;
img = imread(camera);%256
img2 = imread(lena); %512
img3 = imread(citraBiner); %200
% img_posisi itu ngeBlending & memposisikan gambar
% img_posisi(gambar_dasar, gambar_atas,pengecilan_gambar_atas, Posisi, power)
% 0 untuk tidak mengecilkan gambar
% 1 untuk tidak memberikan efek power ranger
% [ START YOUR CODE HERE ]

%imgout=filter_batik1(img2);
%img2=rgbTogrey(img2);
%imgout=filter_sobel(img2)

imgout=filter_contras(img,5,1);
%imgout1=filter_batik3(img);
% img3=im2bw(img2);
%FILTER KEREN
% imgEnhanced = entropyfilt(img2,getnhood(strel('Disk',4)));
% imgEnhanced = imgEnhanced/max(imgEnhanced(:));
% imgEnhanced = imadjust(imgEnhanced,[0.30; 0.85],[0.90; 0.00], 0.90);
%imshow(imgEnhanced)
%END FILTER
% a=bukaTutup(img3,3,1);
% wth1=wth(img3,3);
% b=roberts2(img);
% figure, imshow(a);
% figure, imshow(b);
%[COPYRIGHT DEWOK_SATRIA]

% figure, imshow(img);
figure('name','HASIL PENGOLAHAN CITRA','Color','white', 'Menu','none')
subplot(1,2,1); imshow(img);title('CITRA ASLI');
subplot(1,2,2);imshow(imgout);title('Citra OUtput ');
%imwrite(lena2,'img_image_kuis.png');