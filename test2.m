%%%%%%% NICK MAKE SURE U SET ZT FOR THE CONNECTION TYPE and set the prefix
%%%%%%% for L and C
stubType=input('is stub open [Y] o [N] :    ','s');
Zo=input('Enter line charactristic impedance :    ');
% R=input('Enter Resistor value :    ');%Ohms
ZL_real=input('Enter  Load real part :    ');
ZL_imaj=input('Enter  Load imaj part :    ');%Ohms
R=ZL_real+1i*ZL_imaj;
L=input('Enter inductor value :    ');%E-6H
L =  L*1;
C=input('Enter Capacitor value :    ');%pF
C =  C*10^-12;
lambdag=input('Enter guide wavelength value :    ');%m
Er=input('Enter Er value :    ');
Up = (3*10^8)/sqrt(Er); %m/s
fprintf('Up = %s\n',Up);%------------------------------------------
f = Up/lambdag;%hz
fprintf('f = %s\n',f);%------------------------------------------
w =2*pi* f;
fprintf('w = %s\n',w);%------------------------------------------
if L == 0
    ZL = 0;
else
    ZL = 1i*w*L;
end

fprintf('ZL  = %f%+fj\n', real(ZL), imag(ZL));%------------------------------------------
if C == 0
    ZC = 0;
else
    ZC = 1/(1i*C*w);
end

fprintf('ZC = %f%+fj\n', real(ZC), imag(ZC));%------------------------------------------


% Zt = (((R)^-1) + ((ZL)^-1))^-1;% +ZC;
Zt = R;
fprintf('Zt = %f%+fj\n', real(Zt), imag(Zt));%------------------------------------------
reCo=(Zt-Zo)/(Zt+Zo);
fprintf('reCo = %s\n',reCo);%------------------------------------------
[ReCoAngle,ReCoMagni] = cart2pol(real(reCo),imag(reCo));
thetaPrimePlus = acos(-abs(reCo));
fprintf('thetaPrimePlus = %s\n',thetaPrimePlus);%------------------------------------------
thetaPrimeminuss = -1*acos(-abs(reCo));
fprintf('thetaPrimeminuss = %s\n',thetaPrimeminuss);%------------------------------------------
d1= (lambdag/(4*pi))*(ReCoAngle-thetaPrimePlus);
if d1<0
    d1=d1+(lambdag/2);
else
    d1=d1+0;
end
disp(d1)%------------------------------------------
d2= (lambdag/(4*pi))*(ReCoAngle-thetaPrimeminuss);
if d2<0
    d2=d2+(lambdag/2);
else
    d2=d2+0;
end
disp(d2)%------------------------------------------
if d2<d1
    disp('d2 is smaller')
    DDD=d2;
    bs =(2*abs(reCo)*sin(thetaPrimeminuss))/(1+abs(reCo)^2+2*abs(reCo)*cos(thetaPrimeminuss));
else
    disp('d1 is smaller')
    DDD=d1;
    bs =(2*abs(reCo)*sin(thetaPrimePlus))/(1+abs(reCo)^2+2*abs(reCo)*cos(thetaPrimePlus));
end

Zstub= Zo/(1i*bs);
fprintf('stub impedence = %f%+fj\n', real(Zstub), imag(Zstub));%------------------------------------------

if strcmpi(stubType,'Y')
    ls = (lambdag/(2*pi))*atan(Zo/(1i*Zstub));%*10^-3;%stub is open
    %in meters
else
    ls = ((lambdag/(2*pi))*atan(Zstub/(1i*Zo)));%*10^-3; %stub is closed 
    %in meters
end
fprintf('Length of stub = %s\n',ls);%------------------------------------------

%-------------------------------------------------------------------------------
% TRANSMISION LINE PART
%------------------------------------------------------------------------------
L=input('Enter line length :    ');
Vg=input('Enter Vg :    ');
Zg=input('Enter zg :    ');
Lx=L;
L=-L/lambdag;
Bl=-2*L*pi;
ZL = Zt;
ZinNumere=ZL +Zo*1i*tan(Bl);
ZinDenomi=Zo +ZL*1i*tan(Bl);
% ZinNumere=ZLcos(Bl) +Zo*1i*sin(Bl);
% ZinDenomi=Zocos(Bl) +ZL*1i*sin(Bl);
Zin= (ZinNumere / ZinDenomi)*Zo;
fprintf('Zin = %f%+fj\n', real(Zin), imag(Zin));%------------------------------------------
Vin=(Zin*Vg)/(Zin+Zg);
fprintf('Vin = %f%+fj\n', real(Vin), imag(Vin));%------------------------------------------
Vout= (Vin)/(exp(1i*Bl)+((reCo)*(exp(-1i*Bl))));
fprintf('Vout = %f%+fj\n', real(Vout), imag(Vout));%------------------------------------------
VL = Vout*(1+(reCo));
fprintf('VL = %f%+fj\n', real(VL), imag(VL));%------------------------------------------
Pavg=0.5*real(VL*conj(VL/ZL));
fprintf('Pavg no impedence matching = %f%+fj\n', real(Pavg), imag(Pavg));%------------------------------------------
Lnew=Lx-DDD;
Lnew=-1*Lnew/lambdag;
Blnew=2*Lnew*pi;
ZLprime = Zo;
Zinprime = Zo;
Vinprime=(Zinprime*Vg)/(Zinprime+Zg);
fprintf('Vinprime = %f%+fj\n', real(Vinprime), imag(Vinprime));%------------------------------------------
Vinprimecheck=Vg/2;
fprintf('Vinprimecheck = %f%+fj\n', real(Vinprimecheck), imag(Vinprimecheck));%------------------------------------------
Voutprime= (Vinprime)/(exp(-1i*Blnew));
fprintf('Voutprime = %f%+fj\n', real(Voutprime), imag(Voutprime));%------------------------------------------
VLprime = Voutprime;
fprintf('VLprime = %f%+fj\n', real(VLprime), imag(VLprime));%------------------------------------------
%NEEDS FIX 2:04:09
Blprimeprime=-(DDD/lambdag)*2*pi;
Voutprimeprime= (Vg)*(exp(-1i*Blprimeprime)+((reCo)*(exp(1i*Blprimeprime))));
fprintf('Vout = %f%+fj\n', real(Voutprimeprime), imag(Voutprimeprime));%------------------------------------------
VLprimeprime = Voutprimeprime*(1+(reCo)); 
fprintf('VLprime = %f%+fj\n', real(VLprimeprime), imag(VLprimeprime));%------------------------------------------
P=0.5*(VLprimeprime*conj((VLprimeprime/Zt)));
fprintf('power matched = %f%+fj\n', real(P), imag(P));%------------------------------------------

