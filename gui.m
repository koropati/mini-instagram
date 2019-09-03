function varargout = gui(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end

% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
set(handles.img_tampil,'xtick',[],'ytick',[])
set(handles.filter_1,'xtick',[],'ytick',[])
set(handles.filter_2,'xtick',[],'ytick',[])
set(handles.filter_3,'xtick',[],'ytick',[])
set(handles.filter_4,'xtick',[],'ytick',[])
set(handles.background,'xtick',[],'ytick',[])
handles.output = hObject;
global next;
next = 0;
set(handles.pushbutton3,'BackgroundColor','0.8,0.8,0.8','Enable','off');
set(handles.pushbutton2,'BackgroundColor','0.8,0.8,0.8','Enable','off');
set(handles.batalEffect,'Visible','off');
set(handles.save,'Visible','off');
set(handles.terapkan1,'BackgroundColor','0.8,0.8,0.8','Enable','off');
set(handles.terapkan2,'BackgroundColor','0.8,0.8,0.8','Enable','off');
set(handles.terapkan3,'BackgroundColor','0.8,0.8,0.8','Enable','off');
set(handles.terapkan4,'BackgroundColor','0.8,0.8,0.8','Enable','off');
% Update handles structure
guidata(hObject, handles);
end
% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
end
% filter_batik1
% Tombol Masukan Gambar
function pushbutton1_Callback(hObject, eventdata, handles)
global selectedImage namafile next total_halaman;
global img_1 img_2 img_3 img_4 img_5 img_6 img_7 img_8 img_9 img_10 img_11 img_12 img_13 img_14 img_15 img_16 img_17 img_18 img_19 img_20 img_21 img_22 img_23 img_24 img_25;
global nama1 nama2 nama3 nama4 nama5 nama6 nama7 nama8 nama9 nama10 nama11 nama12 nama13 nama14 nama15 nama16 nama17 nama18 nama19 nama20 nama21 nama22 nama23 nama24 nama25;
global f e1 e2 e3 e4 n1 n2 n3 n4;
total_halaman=21;
next=0;
[filename,filepath] = uigetfile({'*.bmp';});
if isequal(filename,0)
    disp('User selected Cancel');
    f=msgbox('Pemilihan Image dibatalkan!','Info','help');
    delete(findobj(f,'string','OK'));
    delete(findobj(f,'style','frame'));
    pause(1.5)
    close(f)
else
    selectedImage = imread(strcat(filepath, filename));
    namafile=filename;
    %progress Bar Mulai Dari sini
    pesan_proses(handles,0);
    axes(handles.img_tampil);
    imshow(selectedImage);
    pesan_proses(handles,4);
    img_1=filter_negatif(selectedImage);
    nama1='Negatif';
    pesan_proses(handles,8);
    img_2=filter_grey(selectedImage);
    nama2='GreyScale';
    pesan_proses(handles,12);
    img_3=filter_emboss(selectedImage);
    nama3='Emboss';
    pesan_proses(handles,16);
    img_4=filter_freichen(selectedImage);
    nama4='Freichen';
    pesan_proses(handles,20);
    img_5=filter_brightness(selectedImage,60);
    nama5='Brightness';
    pesan_proses(handles,24);
    img_6=filter_roberts(selectedImage);
    nama6='Roberts';
    pesan_proses(handles,28);
    img_7=filter_median(selectedImage,5);
    nama7='Median';
    pesan_proses(handles,32);
    img_8=filter_contras(selectedImage,2,2);
    nama8='Contras';
    pesan_proses(handles,36);
    img_9=filter_laplacian(selectedImage);
    nama9='Laplacian';
    pesan_proses(handles,40);
    img_10=flip_lena(selectedImage);
    nama10='Kombinasi_Flip';
    pesan_proses(handles,44);
    img_11=filter_sobel(selectedImage);
    nama11='Sobel';
    pesan_proses(handles,48);
    img_12=filter_canny(selectedImage);
    nama12='Canny';
    pesan_proses(handles,52);
    img_13=filter_compass(selectedImage);
    nama13='Compass';
    pesan_proses(handles,56);
    img_14=filter_prewit(selectedImage);
    nama14='Prewit';
    pesan_proses(handles,60);
    img_15=filter_threshold(selectedImage,120);
    nama15='Treshold_120';
    pesan_proses(handles,64);
    img_16=filter_dilasi(selectedImage,3);
    nama16='Dilasi';
    pesan_proses(handles,68);
    img_17=filter_erosi(selectedImage,3);
    nama17='Erosi';
    pesan_proses(handles,72);
    img_18=bukaTutup(selectedImage,3,1);
    nama18='Opening';
    pesan_proses(handles,76);
    img_19=bukaTutup(selectedImage,3,0);
    nama19='Closing';
    pesan_proses(handles,80);
    img_20=filter_bottomhat(selectedImage,3);
    nama20='Bottom_Hat';
    pesan_proses(handles,84);
    img_21=filter_tophat(selectedImage,3);
    nama21='Top_Hat';
    pesan_proses(handles,88);
    img_22=filter_Lhsv(selectedImage);
    nama22='MyColor_LHSV';
    pesan_proses(handles,92);
    img_23=filter_batik1(selectedImage);
    nama23='My_Batik01';
    pesan_proses(handles,96);
    img_24=filter_batik2(selectedImage);
    nama24='My_Batik02';
    pesan_proses(handles,97);
    img_25=filter_batik11(selectedImage);
    nama25='My_Batik03';
    pesan_proses(handles,98);
    e1=img_1;
    e2=img_2;
    e3=img_3;
    e4=img_4;
    
    n1=nama1;
    n2=nama2;
    n3=nama3;
    n4=nama4;
    pesan_proses(handles,99);
    gantiHalaman(handles, next);
    cekTombol(handles, next);
    pesan_proses(handles,100);
end

end

function []=gantiHalaman(handles, halaman)
global img_1 img_2 img_3 img_4 img_5 img_6 img_7 img_8 img_9 img_10 img_11 img_12 img_13 img_14 img_15 img_16 img_17 img_18 img_19 img_20 img_21 img_22 img_23 img_24 img_25;
global nama1 nama2 nama3 nama4 nama5 nama6 nama7 nama8 nama9 nama10 nama11 nama12 nama13 nama14 nama15 nama16 nama17 nama18 nama19 nama20 nama21 nama22 nama23 nama24 nama25;
if halaman==0
    tampilImage(handles, img_1, img_2, img_3, img_4);
    gantiNamaEffect(handles, nama1, nama2, nama3, nama4);
elseif halaman==1
    tampilImage(handles, img_2, img_3, img_4, img_5);
    gantiNamaEffect(handles, nama2, nama3, nama4, nama5);
elseif halaman==2
    tampilImage(handles, img_3, img_4, img_5, img_6);
    gantiNamaEffect(handles, nama3, nama4, nama5, nama6);
elseif halaman==3
    tampilImage(handles, img_4, img_5, img_6, img_7);
    gantiNamaEffect(handles, nama4, nama5, nama6, nama7);
elseif halaman==4
    tampilImage(handles, img_5, img_6, img_7, img_8);
    gantiNamaEffect(handles, nama5, nama6, nama7, nama8);
elseif halaman==5
    tampilImage(handles, img_6, img_7, img_8, img_9);
    gantiNamaEffect(handles, nama6, nama7, nama8, nama9);
elseif halaman==6
    tampilImage(handles, img_7, img_8, img_9, img_10);
    gantiNamaEffect(handles, nama7, nama8, nama9, nama10);
elseif halaman==7
    tampilImage(handles, img_8, img_9, img_10, img_11);
    gantiNamaEffect(handles, nama8, nama9, nama10, nama11);
elseif halaman==8
    tampilImage(handles, img_9, img_10, img_11, img_12);
    gantiNamaEffect(handles, nama9, nama10, nama11, nama12);
elseif halaman==9
    tampilImage(handles, img_10, img_11, img_12, img_13);
    gantiNamaEffect(handles, nama10, nama11, nama12, nama13);
elseif halaman==10
    tampilImage(handles, img_11, img_12, img_13, img_14);
    gantiNamaEffect(handles, nama11, nama12, nama13, nama14);
elseif halaman==11
    tampilImage(handles, img_12, img_13, img_14, img_15);
    gantiNamaEffect(handles, nama12, nama13, nama14, nama15);
elseif halaman==12
    tampilImage(handles, img_13, img_14, img_15, img_16);
    gantiNamaEffect(handles, nama13, nama14, nama15, nama16);
elseif halaman==13
    tampilImage(handles, img_14, img_15, img_16, img_17);
    gantiNamaEffect(handles, nama14, nama15, nama16, nama17);
elseif halaman==14
    tampilImage(handles, img_15, img_16, img_17, img_18);
    gantiNamaEffect(handles, nama15, nama16, nama17, nama18);
elseif halaman==15
    tampilImage(handles, img_16, img_17, img_18, img_19);
    gantiNamaEffect(handles, nama16, nama17, nama18, nama19);
elseif halaman==16
    tampilImage(handles, img_17, img_18, img_19, img_20);
    gantiNamaEffect(handles, nama17, nama18, nama19, nama20);
elseif halaman==17
    tampilImage(handles, img_18, img_19, img_20, img_21);
    gantiNamaEffect(handles, nama18, nama19, nama20, nama21);
elseif halaman==18
    tampilImage(handles, img_19, img_20, img_21, img_22);
    gantiNamaEffect(handles, nama19, nama20, nama21, nama22);
elseif halaman==19
    tampilImage(handles, img_20, img_21, img_22, img_23);
    gantiNamaEffect(handles, nama20, nama21, nama22, nama23);
elseif halaman==20
    tampilImage(handles, img_21, img_22, img_23, img_24);
    gantiNamaEffect(handles, nama21, nama22, nama23, nama24);
elseif halaman==21
    tampilImage(handles, img_22, img_23, img_24, img_25);
    gantiNamaEffect(handles, nama22, nama23, nama24, nama25);
else 
    tampilImage(handles, img_1, img_2, img_3, img_4);
    gantiNamaEffect(handles, nama1, nama2, nama3, nama4);
end

end

function gantiNamaEffect(handles, effect1, effect2, effect3, effect4)
global n1 n2 n3 n4;
    set(handles.terapkan1,'string',effect1);
    n1=effect1;
    set(handles.terapkan2,'string',effect2);
    n2=effect2;
    set(handles.terapkan3,'string',effect3);
    n3=effect3;
    set(handles.terapkan4,'string',effect4);
    n4=effect4;
end

% Tombol Ke Kanan
function pushbutton2_Callback(hObject, eventdata, handles)
global next;
next=next+1;
gantiHalaman(handles, next);
cekTombol(handles, next);
end

% Tombol Ke Kiri
function pushbutton3_Callback(hObject, eventdata, handles)
global next;
next=next-1;
gantiHalaman(handles, next);
cekTombol(handles, next);
end

function []=cekTombol(handles, halaman)
global total_halaman;
if halaman == 0
    set(handles.pushbutton3,'BackgroundColor','0.8,0.8,0.8','Enable','off');
else
    set(handles.pushbutton3,'BackgroundColor','1,0.6,0.78','Enable','on');
end

if halaman == total_halaman
    set(handles.pushbutton2,'BackgroundColor','0.8,0.8,0.8','Enable','off');
else
    set(handles.pushbutton2,'BackgroundColor','1,0.6,0.78','Enable','on');
end
end

function []=terapkanEffect(handles, effect, namaEffect)
global currentEffect currentName;
currentEffect=effect;
currentName=namaEffect;
axes(handles.img_tampil);
imshow(effect);
set(handles.batalEffect,'Visible','on');
set(handles.save,'Visible','on');
end

function []=tampilImage(handles, a, b, c, d)
global e1 e2 e3 e4;
    axes(handles.filter_1);
    imshow(a);
    e1=a;
    
    axes(handles.filter_2);
    imshow(b);
    e2=b;

    axes(handles.filter_3);
    imshow(c);
    e3=c;

    axes(handles.filter_4);
    imshow(d);
    e4=d;
end

function [] =pesan_proses(handles, progress)
global h; 
perc=progress;
if progress==0
    h = waitbar(0,'Processing Image','Name','Memproses Gambar');
    set(handles.batalEffect,'Visible','off');
    set(handles.terapkan1,'BackgroundColor','0.8,0.8,0.8','Enable','off');
    set(handles.terapkan2,'BackgroundColor','0.8,0.8,0.8','Enable','off');
    set(handles.terapkan3,'BackgroundColor','0.8,0.8,0.8','Enable','off');
    set(handles.terapkan4,'BackgroundColor','0.8,0.8,0.8','Enable','off');
elseif progress==100
    waitbar(perc/100,h,sprintf('%d%% %s%',perc,'Selesai'))
    pause(.5)
    close(h)
    set(handles.terapkan1,'BackgroundColor','[1 0.43 0.91]','Enable','on');
    set(handles.terapkan2,'BackgroundColor','[1 0.43 0.91]','Enable','on');
    set(handles.terapkan3,'BackgroundColor','[1 0.43 0.91]','Enable','on');
    set(handles.terapkan4,'BackgroundColor','[1 0.43 0.91]','Enable','on');
else
    waitbar(perc/100,h,sprintf('%d%% %s%',perc,'Menyiapkan Filter'))
end
end


% --- Executes on button press in terapkan1.
function terapkan1_Callback(hObject, eventdata, handles)
global e1 n1;
terapkanEffect(handles, e1, n1);
end


% --- Executes on button press in terapkan2.
function terapkan2_Callback(hObject, eventdata, handles)
global e2 n2;
terapkanEffect(handles, e2, n2);
end


% --- Executes on button press in terapkan3.
function terapkan3_Callback(hObject, eventdata, handles)
global e3 n3;
terapkanEffect(handles, e3, n3);
end


% --- Executes on button press in terapkan4.
function terapkan4_Callback(hObject, eventdata, handles)
global e4 n4;
terapkanEffect(handles, e4, n4);
end


% --- Executes on button press in batalEffect.
function batalEffect_Callback(hObject, eventdata, handles)
global selectedImage;
terapkanEffect(handles, selectedImage, '');
set(handles.batalEffect,'Visible','off');
set(handles.save,'Visible','off');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
global f currentEffect currentName namafile;
imwrite(currentEffect, strcat(currentName,'_', namafile));
f=msgbox('Gambar Tersimpan!','Info','help');
delete(findobj(f,'string','OK'));
delete(findobj(f,'style','frame'));
pause(1.5)
close(f)
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

end
