%BARI� KARDA� - 1160606802 - KARAKTER TANIMA

%Test verisi olarak verdi�iniz image matrisini �rnek matrislerle kar��la�t�r�p hangisine yak�n oldu�unu 
% mahalanobis y�ntemi ile bulur. 

clc              %command window temizlenir
clear all;       %workspace temizlenir.

A=getMatris('a.txt');   % a harfi matrisi al�n�r
K=getMatris('k.txt');   % k harfi matrisi al�n�r.
L=getMatris('l.txt');   % l harfi matrisi al�n�r
O=getMatris('o.txt');   % o harfi matrisi al�n�r
V=getMatris('v.txt');   % v harfi matrisi al�n�r
delete test.txt         %test dosyas�n� sil

%test etmek istedi�imiz harfi buradan de�i�tirebiliyoruz.
MTEST=getMatrisTest('test.txt','test/testk.png');   %test edilmek istenen harfin yolunu g�sterip matrisini al.

MA=calMX(A);  %A resminin matris de�erleri hesaplan�r.
MK=calMX(K);  %K resminin matris de�erleri hesaplan�r. 
ML=calMX(L);  %L resminin matris de�erleri hesaplan�r.
MO=calMX(O);  %O resminin matris de�erleri hesaplan�r.
MV=calMX(V);  %V resminin matris de�erleri hesaplan�r.
size(MTEST);   %test olan resmin boyutu hesaplan�r.
size(MA);      %a resminin boyutu hesaplan�r.
zxa=mahaDistance2(MTEST,MA);  % Test resmi ile A resminin aras�ndaki Mesafesini bul
zxk=mahaDistance2(MTEST,MK);  % Test resmi ile K resminin aras�ndaki Mesafesini bul
zxl=mahaDistance2(MTEST,ML);  % Test resmi ile L resminin aras�ndaki Mesafesini bul
zxo=mahaDistance2(MTEST,MO);  % Test resmi ile O resminin aras�ndaki Mesafesini bul
zxv=mahaDistance2(MTEST,MV);  % Test resmi ile V resminin aras�ndaki Mesafesini bul
%zxam=fitcnb(MTEST,A,'normal')
%zxkm=fitcnb(MTEST,MK)
%zxlm=fitcnb(MTEST,ML)
%zxom=fitcnb(MTEST,MO)
%zxvm=fitcnb(MTEST,MV)
estimates=[zxa zxk zxl zxo zxv]; %tahmin ve degerlendirme olusturma islemi yapilir.
xes=min(estimates); %minimum deger tahmini
if sum(MTEST)<1000  %test edilen harf 1000'den k�c�kse harf olarak algilanir.
    if xes==zxa
        disp('Test karakteri A olarak algilandi!');
    elseif xes==zxk
        disp('Test karakteri K olarak algilandi!')
    elseif xes==zxl
        disp('Test karakteri L olarak algilandi!')
    elseif xes==zxo
        disp('Test karakteri O olarak algilandi!')
    elseif xes==zxv
        disp('Test karakteri V olarak algilandi!')
    else
        disp('Test karakteri bir sinifa dahil edilemedi!')
    end
else
    disp('Karakter okunamayacak kadar karisiktir.')  %degilse harfi tanimaz.
end

function[C] = getMatris(matrisfile)  %matris alma fonk.
C=dlmread(matrisfile);   %olu�turulan txt dosyas�ndaki verileri aktarir.
end

function[C] = getMatrisTest(matrisfile,ximage) %matris alma test fonk.
 C=xfi(matrisfile,ximage)    % xfi ile matris dosyasini ve harfi parametre olarak alir.
end

function[XVec] = calMX(MX)   %hesaplama fonk.
XVec=mean(MX);               % Kolonlarin ortalamasini alir.
end

function[mahalanobisdistance]=mahaDistance2(X,Y)   %mahalanobis y�ntemini kullanan fonk.
S = cov(X);
mu = mean(X,1);
d = (Y-mu)*inv(S)*(Y-mu)';
mahalanobisdistance=d;
end