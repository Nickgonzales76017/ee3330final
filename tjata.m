% 1) TRANSMMISION LINE A SINGLE LOAD

Zo=input('Enter line charactristic impedance :    ');
fprintf('\n');
ZM_real=input('Enter  ZM real part :    ');
fprintf('\n');
ZM_imaj=input('Enter  ZM imaj part :    ');
fprintf('\n');
ZM=ZM_real+1i*ZM_imaj;
% ZM=input('Enter ZM impedance :    ');
fprintf('\n');
Zg=input('Enter Zg impedance :    ');
fprintf('\n');
question1=input('is VL sin [y or n]:    ','s');
fprintf('\n');
if strcmpi(question1,'n')
    VL_Amplitude=input('Enter  Source Voltage VL amplitude:    ');
    fprintf('\n');
    VL_phase=input('Enter  Source Voltage phase VL :    ');
    fprintf('\n');
elseif strcmpi(question1,'y')
    VL_Amplitude=input('Enter  Source Voltage VL amplitude:    ');
    fprintf('\n');
    VL_phase=input('Enter  Source Voltage phase VL :    ')-(pi/2);
    fprintf('\n');
else
    question1=input('is VL sin=[y or n]:    ');
    fprintf('\n');
end
VL=VL_Amplitude*exp(VL_phase*1i);
ZL_real=input('Enter  Load real part :    ');
IL=VL/ZL;
fprintf('\n');
ZL_imaj=input('Enter  Load imaj part :    ');
fprintf('\n');
ZL=ZL_real+1i*ZL_imaj;
l=input('Enter  l (neg):    ');
fprintf('\n');
Bl=-2*l*pi;
fprintf('\n');
fprintf('The value of Bl  in radians:  %f\n ',Bl);
fprintf('\n');

ZinNumere=ZL +Zo*1i*tan(Bl);
ZinDenomi=Zo +ZL*1i*tan(Bl);
% ZinNumere=ZLcos(Bl) +Zo*1i*sin(Bl);
% ZinDenomi=Zocos(Bl) +ZL*1i*sinn(Bl);
Zinprime= (ZinNumere / ZinDenomi)*Zo;
fprintf('Zinprime:');
disp(Zinprime)
ZLprime= (((Zinprime)^(-1))+((ZM)^(-1)))^(-1);
fprintf('ZLprime:');
disp(ZLprime)

Blbig=input(' Enter dist frm load big (neg):  ');
ZinNumere1=ZLprime +Zo*1i*tan(-Blbig*2*pi);
ZinDenomi1=Zo +ZLprime*1i*tan(-Blbig*2*pi);
% ZinNumere1=ZLprimecos(-Blbig*2*pi)+Zo*1i*sin(-Blbig*2*pi);
% ZinDenomi1=Zocos(-Blbig*2*pi) +ZLprime*1i*sin(-Blbig*2*pi);
Zin= (ZinNumere1 / ZinDenomi1)*Zo;
fprintf('Zin:');
disp(Zin)
fprintf('\n');

disp((ZL -Zo))
disp((ZL +Zo))
ReCoeff =(ZL -Zo)/(ZL +Zo);
fprintf('ReCoeff_small:');
disp(ReCoeff)
fprintf('\n');
V0plus=VL/(1+ReCoeff);
fprintf('V0plus:');
disp(V0plus)
fprintf('\n');
V0minus=VL*ReCoeff;
fprintf('V0minus:');
disp(V0minus)
fprintf('\n');
Bdsmall=input(' Enter dist frm load small (neg):  ');
fprintf('\n');
Vin_small=V0plus*(exp(-Bdsmall*1i*2*pi)+ReCoeff*exp(Bdsmall*1i*2*pi));
fprintf('Vin_small:');
disp(Vin_small)
VLprime = Vin_small;
IM = VLprime/ZM;
ReCoeffprime =(ZLprime -Zo)/(ZLprime +Zo);
V0plusprime=VLprime/(1+ReCoeffprime);
disp(V0plusprime)
V0minusprime=VL*ReCoeffprime;
Bdbig=input(' Enter dist frm load big (neg):  ');
fprintf('\n');
Vin_big=V0plusprime*(exp(-Bdbig*1i*2*pi)+ReCoeffprime*exp(Bdbig*1i*2*pi));
fprintf('Vin_big:');
disp(Vin_big)
Vg = Vin_big*(Zin+Zg)/Zin;
Pg = 0.5*real(Vg*conj(Vin_big/Zin));
Pm = 0.5*real(VLprime*conj(IM));
Pl = 0.5*real(VL*(IL));
fprintf('vg :   ')
disp(Vg)
rho=abs(Vg);
theta=angle(Vg);
%-------------------
Vg_polar=rho*exp(1i*theta);
fprintf('vg polar :   ')
disp(Vg_polar)
fprintf('Pg :   ')
disp(Pg)
fprintf('\n');
disp(Pm)
fprintf('\n');
disp(Pl)
fprintf('\n');

%small part of the transmission line
figure;
gammab_ang = angle(ReCoeff);
db = 0:0.01:0.207;
Vdb = abs(V0plus)*sqrt(1+abs(ReCoeff)^2+2*abs(ReCoeff)*cos(2*pi*db - gammab_ang));
plot(db, Vdb);
%bigger part of the transmission line
figure;
gammaa_ang = angle(ReCoeffprime);
da = .207:0.01:0.5;
Vda = abs(V0plusprime)*sqrt(1+abs(ReCoeffprime)^2+2*abs(ReCoeffprime)*cos(2*pi*da - gammaa_ang));
plot(da, Vda);
ylim([6 20]); %just matching the y-axis of the plot of the small part of the transmission line
%   
% %2) UNcoment/COMMENT  which Formular to use
% %Vin, Iin, AND Pavg of Generator
% Zg=input('Enter  Impedance Zg :    ');
% question=input('is Vg sin [y or n]:    ','s');
% y = 'y';
% n ='n';
% if strcmpi(question,'n')
%     Vg_Amplitude=input('Enter  Source Voltage Vg amplitude:    ');
%     Vg_phase=input('Enter  Source Voltage Vg :    ');
% elseif strcmpi(question,'y')
%     Vg_Amplitude=input('Enter  Source Voltage Vg amplitude:    ');
%     Vg_phase=input('Enter  Source Voltage Vg :    ')-(pi/2);
% else
%     question=input('is Vg sin=[y or n]:    ');
% end
% Vg=Vg_Amplitude*exp(Vg_phase*1i);
% 
% Vin=(Zin*Vg)/(Zin+Zg);
% fprintf('\n');
% fprintf('The input voltage Vin is:  ')
% disp(Vin);
%  [VinAngle,VinMagni] = cart2pol(real(Vin),imag(Vin));
%  fprintf('The Vin(polar form)  Magnitd:  %g    Angle:  %g \n ',VinMagni,VinAngle);
%  fprintf('\n');
%  
%  Iin=Vin/Zin;
% fprintf('The input Current (Iin) is:  ')
% disp(Iin);
%  [IinAngle,IinMagni] = cart2pol(real(Iin),imag(Iin));
%  fprintf('The Iin(polar form)  Magnitd:  %g    Angle:  %g \n ',IinMagni,IinAngle);
% fprintf('\n');
% 
% CplexConju_Iin=conj(Iin);
% Pavg=0.5*Vg*CplexConju_Iin;
% fprintf('\n')
% fprintf('The average Power of Source(Vg) is: %g WATS\n ',Pavg)
% fprintf('\n');
% Voplus=Vin/(exp(Bl*1i)+ReCoeff*exp(-Bl*1i));
% fprintf('The incident voltage Vo+:   ')
% disp(Voplus);
% VoRefle=Voplus*ReCoeff;
% fprintf('The reflected voltage Vo-:   ')
% disp(VoRefle);
% 
% 
% % 3) LOAD VOLTAGE AND CURRENT
% Vload=Voplus*(1+ReCoeff);
% fprintf('The load voltage :   ')
% disp(Vload);
%  [VloadAngle,VloadMagni] = cart2pol(real(Vload),imag(Vload));
%  fprintf('The Vload(polar form)  Magnitd:  %g,  Angle:  %g\n ',VloadMagni,VloadAngle);
% fprintf('\n');
% 
% Loadcurnt=Vload/ZL;
% fprintf('The load Current :   ')
% disp(Loadcurnt);
% [LoadcurntAngle,LoadcurntMagni] = cart2pol(real(Loadcurnt),imag(Loadcurnt));
%  fprintf('The Loadcurnt(polar form)  Magnitd:  %g    Angle:  %g \n ',LoadcurntMagni,LoadcurntAngle);
% fprintf('\n');
% 
% CplexConju_Ioadcrnt=conj(Loadcurnt);
% Pwrload=0.5*Vload*CplexConju_Ioadcrnt;
% Pwrgen=0.5*Vg*CplexConju_Iin;
% fprintf('\n');
% 
% fprintf('The  Power deliverd to Load is: %g  WATS\n ',Pwrload)
% fprintf('\n');
% fprintf('The  Power deliverd to gen is: %g  WATS\n ',Pwrgen)
% fprintf('\n');
% %4) ENTER ANY PT TO DISPLAY VOLTAGE
% Bd=input(' Enter dist frm load to get Voltage( at pt) Do Not include -ve sign:  ');
% fprintf('\n');
% 
% %  5) THE VOLTAGE AT A GIVEN POINT
%   VoltageAtpt=V0plus*(exp(-Bd*1i)+ReCoeff*exp(Bd*1i)) ;
%   for Bd = 0:1:Bd
%   VoltageAtpt1=abs(Voplus*(1+abs(ReCoeff)^(2)+2*(ReCoeff)*cos(2*Bd-ReCoAngle))^(1/2));
%   end
%   plot(0:1:Bd,VoltageAtpt1)
%   fprintf('The Voltage at the given pt in phasor domain is :   ')
%   disp(VoltageAtpt);
%    [VoltageAtptAngle,VoltageAtptMagni] = cart2pol(real(VoltageAtpt),imag(VoltageAtpt));
%   fprintf('The Voltage At pt(polar form)  Magnitd:  %g    Angle:  %g \n ',VoltageAtptMagni,VoltageAtptAngle);
%  fprintf('\n');