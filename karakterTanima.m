%BARIÞ KARDAÞ - 1160606802 - KARAKTER TANIMA

%Test verisi olarak verdiðiniz image matrisini örnek matrislerle karþýlaþtýrýp hangisine yakýn olduðunu 
% mahalanobis yöntemi ile bulur. 

clc              %command window temizlenir
clear all;       %workspace temizlenir.

A=getMatris('a.txt');   % a harfi matrisi alýnýr
K=getMatris('k.txt');   % k harfi matrisi alýnýr.
L=getMatris('l.txt');   % l harfi matrisi alýnýr
O=getMatris('o.txt');   % o harfi matrisi alýnýr
V=getMatris('v.txt');   % v harfi matrisi alýnýr
delete test.txt         %test dosyasýný sil

%test etmek istediðimiz harfi buradan deðiþtirebiliyoruz.
MTEST=getMatrisTest('test.txt','test/testk.png');   %test edilmek istenen harfin yolunu gösterip matrisini al.

MA=calMX(A);  %A resminin matris deðerleri hesaplanýr.
MK=calMX(K);  %K resminin matris deðerleri hesaplanýr. 
ML=calMX(L);  %L resminin matris deðerleri hesaplanýr.
MO=calMX(O);  %O resminin matris deðerleri hesaplanýr.
MV=calMX(V);  %V resminin matris deðerleri hesaplanýr.
size(MTEST);   %test olan resmin boyutu hesaplanýr.
size(MA);      %a resminin boyutu hesaplanýr.
zxa=mahaDistance2(MTEST,MA);  % Test resmi ile A resminin arasýndaki Mesafesini bul
zxk=mahaDistance2(MTEST,MK);  % Test resmi ile K resminin arasýndaki Mesafesini bul
zxl=mahaDistance2(MTEST,ML);  % Test resmi ile L resminin arasýndaki Mesafesini bul
zxo=mahaDistance2(MTEST,MO);  % Test resmi ile O resminin arasýndaki Mesafesini bul
zxv=mahaDistance2(MTEST,MV);  % Test resmi ile V resminin arasýndaki Mesafesini bul
%zxam=fitcnb(MTEST,A,'normal')
%zxkm=fitcnb(MTEST,MK)
%zxlm=fitcnb(MTEST,ML)
%zxom=fitcnb(MTEST,MO)
%zxvm=fitcnb(MTEST,MV)
estimates=[zxa zxk zxl zxo zxv]; %tahmin ve degerlendirme olusturma islemi yapilir.
xes=min(estimates); %minimum deger tahmini
if sum(MTEST)<1000  %test edilen harf 1000'den kücükse harf olarak algilanir.
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
C=dlmread(matrisfile);   %oluþturulan txt dosyasýndaki verileri aktarir.
end

function[C] = getMatrisTest(matrisfile,ximage) %matris alma test fonk.
 C=xfi(matrisfile,ximage)    % xfi ile matris dosyasini ve harfi parametre olarak alir.
end

function[XVec] = calMX(MX)   %hesaplama fonk.
XVec=mean(MX);               % Kolonlarin ortalamasini alir.
end

function[mahalanobisdistance]=mahaDistance2(X,Y)   %mahalanobis yöntemini kullanan fonk.
S = cov(X);
mu = mean(X,1);
d = (Y-mu)*inv(S)*(Y-mu)';
mahalanobisdistance=d;
end