%BARIÞ KARDAÞ - 1160606802 - KARAKTER TANIMA

%Dosyasý her image (harf) için bir txt dosyasý oluþturur ve harfe ait örneði okuyup dosyaya yazar.

clc              %command window temizlenir
clear all;       %workspace temizlenir.
xpath=pwd;       %hangi dizinde (klasörde) olduðunuzu bulmak için kullandýk.
xpath=strcat(xpath,'/harfler'); %harfler dizini xpath dizinin sonuna ekledik.
klasorler = dir(xpath);         %Bellekte kayitli olan dosyalari listeler ve klasorler degiskenine aktarir. 
a=size(klasorler);              %klasorler degiskeninin boyutunu a deðiþkenine aktardik.
for i=3:a
  cfolder=strcat(xpath,'/');   %xpath sonuna / ekledik.
  lastfolder=strcat(cfolder,klasorler(i).name)  %for döngsüyle klasör adlarýný cfolder'ýn sonuna ekledik.
  xfiles=dir(lastfolder);      %Bellekte kayitli olan dosyalari listeler ve xfiles degiskenine aktarir.
  xsize=size(xfiles)           %klasorler degiskeninin boyutunu a deðiþkenine aktardik.
  filename1=strcat(klasorler(i).name,'.txt') %txt uzantýlý dosyaya çevir.
  for j=3:xsize                         
    xfile=xfiles(j).name;     %dosyanýn adýný aktar.
    disp(xfiles(j).name);     %dosyanýn adýný yazdýr.
    ximage=strcat(lastfolder,'/'); %sondosyanýn sonuna / ekler.
    ximage=strcat(ximage,xfile);   
    c=xfi(filename1,ximage)    %xfi yardýmcý dosyayý çalýþtýrýr.
  end
end