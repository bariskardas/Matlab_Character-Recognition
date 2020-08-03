%BARI� KARDA� - 1160606802 - KARAKTER TANIMA

%Dosyas� her image (harf) i�in bir txt dosyas� olu�turur ve harfe ait �rne�i okuyup dosyaya yazar.

clc              %command window temizlenir
clear all;       %workspace temizlenir.
xpath=pwd;       %hangi dizinde (klas�rde) oldu�unuzu bulmak i�in kulland�k.
xpath=strcat(xpath,'/harfler'); %harfler dizini xpath dizinin sonuna ekledik.
klasorler = dir(xpath);         %Bellekte kayitli olan dosyalari listeler ve klasorler degiskenine aktarir. 
a=size(klasorler);              %klasorler degiskeninin boyutunu a de�i�kenine aktardik.
for i=3:a
  cfolder=strcat(xpath,'/');   %xpath sonuna / ekledik.
  lastfolder=strcat(cfolder,klasorler(i).name)  %for d�ngs�yle klas�r adlar�n� cfolder'�n sonuna ekledik.
  xfiles=dir(lastfolder);      %Bellekte kayitli olan dosyalari listeler ve xfiles degiskenine aktarir.
  xsize=size(xfiles)           %klasorler degiskeninin boyutunu a de�i�kenine aktardik.
  filename1=strcat(klasorler(i).name,'.txt') %txt uzant�l� dosyaya �evir.
  for j=3:xsize                         
    xfile=xfiles(j).name;     %dosyan�n ad�n� aktar.
    disp(xfiles(j).name);     %dosyan�n ad�n� yazd�r.
    ximage=strcat(lastfolder,'/'); %sondosyan�n sonuna / ekler.
    ximage=strcat(ximage,xfile);   
    c=xfi(filename1,ximage)    %xfi yard�mc� dosyay� �al��t�r�r.
  end
end