%BARIÞ KARDAÞ - 1160606802 - KARAKTER TANIMA

function [yvector] = xfi(cfile,cimage)
clc;
%clear all;
filename=cfile;                    % Vektör dosyasi
filenameimage=cimage;              % Test dosyasi yolu
img=imread(filenameimage);         % Test dosyasini oku
class(img);                        % Test dosyasinin tipi
size(img);
myx=img(:,:,1);                    % x:y:1 matrisini aliyoruz.
global xoormax;
xoormax=size(myx,1);
global yoormax;
yoormax=size(myx,2);
density=90;
%disp('X1 UST SOL KOSE');
x1=calX1(myx,xoormax,density);
%disp('X2 UST ORTA');
x2=calX2(myx,xoormax,density);
%disp('X3 UST SAG KOSE');
x3=calX3(myx,xoormax,density);
%disp('X4 ORTA SOL ORTA');
x4=calX4(myx,xoormax,density);
%disp('X5 ORTA SAG ORTA');
x5=calX5(myx,xoormax,density);
%disp('X6 ALT SOL KOSE');
x6=calX6(myx,xoormax,density);
%disp('X7 ALT ORTA');
x7=calX7(myx,xoormax,density);
%disp('X8 ALT SAG KOSE');
x8=calX8(myx,xoormax,density);
xvector=[x1 x2 x3 x4 x5 x6 x7 x8];
% Dosyaya yazalÄ±m!
dlmwrite(filename, xvector,'-append');
function xy = calX1(myx,maxp,density)
    x=1;
    y=1;
    xlength=1;
    for i=1:maxp
        if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        x=x+1;
        y=y+1;
    end
    xlength=sqrt(2*xlength.^2);
    xy=xlength;
end

function xy = calX2(myx,maxp,density)
    x=1;
    y=ceil(maxp/2);
    xlength=1;
    for i=1:maxp
        if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        x=x+1;
    end
    xy=xlength;
end

function xy = calX3(myx,maxp,density)
    x=1;
    y=maxp;
    xlength=1;
    for i=1:maxp
        if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        x=x+1;
        y=y-1;
    end
    xlength=sqrt(2*xlength.^2);
    xy=xlength;
end

function xy = calX4(myx,maxp,density)
    x=ceil(maxp/2);
    y=1;
    xlength=1;
    for i=1:maxp
        if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        y=y+1;
    end
    xy=xlength;
end

function xy = calX5(myx,maxp,density)
    x=ceil(maxp/2);
    y=maxp;
    xlength=1;
    for i=1:maxp
        if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        y=y-1;
    end
    xy=xlength;
end

function xy = calX6(myx,maxp,density)
    x=maxp;
    y=1;
    xlength=1;
    for i=1:maxp
         if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        y=y+1;
    end
    xlength=sqrt(2*xlength.^2);
    xy=xlength;
end

function xy = calX7(myx,maxp,density)
    x=maxp;
    y=ceil(maxp/2);
    xlength=1;
    for i=1:maxp
        if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        x=x-1;
    end
    xy=xlength;
end

function xy = calX8(myx,maxp,density)
    x=maxp;
    y=maxp;
    xlength=1;
    for i=1:maxp
         if(myx(x,y)>density)
            xlength=xlength+1; 
        else
            break;
        end
        x=x-1;
        y=y-1;
    end
    xlength=sqrt(2*xlength.^2);
    xy=xlength;
end
%                  X2
% X1  105    95    95    95   105 X3
%      95    85    81    85    95
% X4   90    82    74    82    90 X5
%      96    84    80    84    96
% X6  102    94    89    94   102 X8
%                  X7

yvector = xvector;
end

