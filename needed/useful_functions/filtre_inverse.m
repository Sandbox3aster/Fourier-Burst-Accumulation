function out=filtre_inverse(im,K)
%function out=filtre_inverse(im,K)
%
% Applique le filtre inverse correspondant � K sans aucune r�gularisation

[y,x]=size(im);
KK=zeros(y,x);
[yK,xK]=size(K);
KK(1:yK,1:xK)=K;


out=real(ifft2(fft2(im)./fft2(KK)));

%on fait une translation pour ne pas avoir de d�calage de l'image de
%sortie
y2=round((yK-1)/2);
x2=round((xK-1)/2);


mm=zeros(y,x);
mm(y2+1,x2+1)=1;
out=real(ifft2(fft2(out).*(fft2(mm))));


