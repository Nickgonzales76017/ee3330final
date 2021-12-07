Xl=input('Enter Xl :    ');
Xm=input('Enter Xm :    ');
Zo=input('Enter Zo :    ');
Zg=input('Enter Zg :    ');
question=input('is Vg sin [y or n]:    ','s');
y = 'y';
n ='n';
if strcmpi(question,'n')
    Vg_Amplitude=input('Enter  Source Voltage Vg amplitude:    ');
    Vg_phase=input('Enter  Source Voltage phase Vg :    ');
elseif strcmpi(question,'y')
    Vg_Amplitude=input('Enter  Source Voltage Vg amplitude:    ');
    Vg_phase=input('Enter  Source Voltage phase Vg :    ')-(pi/2);
else
    question=input('is Vg sin=[y or n]:    ');
end
Vi=Vg_Amplitude*exp(Vg_phase*1i);
ZL_real=input('Enter  ZL real part :    ');
fprintf('\n');
ZL_imaj=input('Enter  ZL imaj part :    ');
fprintf('\n');
ZL=ZL_real+1i*ZL_imaj;

ZM_real=input('Enter  ZM real part :    ');
fprintf('\n');
ZM_imaj=input('Enter  ZM imaj part :    ');
fprintf('\n');
Zm=ZM_real+1i*ZM_imaj;
L=Xl-Xm;
Bl=2*pi*L;
Bl1=Bl*1;
ZinNumere=ZL +Zo*1i*tan(Bl);
ZinDenomi=Zo +ZL*1i*tan(Bl);
% ZinNumere=ZLcos(Bl) +Zo*1i*sin(Bl);
% ZinDenomi=Zocos(Bl) +ZL*1i*sin(Bl);
Zin= (ZinNumere / ZinDenomi)*Zo;
ZLprime=((Zin)^(-1)+(Zm)^(-1))^-1;
L=Xm;
Bl=2*pi*L;
ZinNumere=ZLprime +Zo*1i*tan(Bl);
ZinDenomi=Zo +ZLprime*1i*tan(Bl);
% ZinNumere=ZLcos(Bl) +Zo*1i*sin(Bl);
% ZinDenomi=Zocos(Bl) +ZL*1i*sin(Bl);
Zinprime= (ZinNumere / ZinDenomi)*Zo;
disp(Zinprime)
Ii=Vi/(Zinprime);
disp(Ii)
Vg=(Vi/(Zinprime))*((Zinprime)+(Zg));
disp(Vg)
pg=0.5*real(Vg*(Ii));
disp(pg)% just barley off need to recheck
ReCoeff =(ZL -Zo)/(ZL +Zo);
fprintf('The Reflective Coefficient :   ')
disp(ReCoeff);
 [ReCoAngle,ReCoMagni] = cart2pol(real(ReCoeff),imag(ReCoeff));
 fprintf('The ReflecCoeffi(polar form)  Magnitd:  %g  Angle:  %g \n ',ReCoMagni,ReCoAngle);
 fprintf('\n');
Voplus=Vi/(exp(Bl1*1i)+ReCoeff*exp(-Bl1*1i));
Vload=Voplus*(1+ReCoeff);
Iload=conj((Voplus/Zo)*(1-ReCoeff));
pL=0.5*real(Vload*(Iload));
disp(pL)