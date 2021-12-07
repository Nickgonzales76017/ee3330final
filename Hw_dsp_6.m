% 1) TRANSMMISION LINE A SINGLE LOAD
Zo=input('Enter line charactristic impedance :    ');
ZL_real=input('Enter  Load real part :    ');
ZL_imaj=input('Enter  Load imaj part :    ');
ZL=ZL_real+1i*ZL_imaj;
l=input('Enter  l :    ');
Bl=2*l*pi;
fprintf('\n');
fprintf('The value of Bl  in radians:  %f\n ',Bl);

ZinNumere=ZL +Zo*1i*tan(Bl);
ZinDenomi=Zo +ZL*1i*tan(Bl);
% ZinNumere=ZLcos(Bl) +Zo*1i*sin(Bl);
% ZinDenomi=Zocos(Bl) +ZL*1i*sin(Bl);
Zin= (ZinNumere / ZinDenomi)*Zo;
fprintf('\n');
fprintf('The imput impedance Zin(dist):  ')
disp(Zin);

ReCoeff =(ZL -Zo)/(ZL +Zo);
fprintf('The Reflective Coefficient :   ')
disp(ReCoeff);
 [ReCoAngle,ReCoMagni] = cart2pol(real(ReCoeff),imag(ReCoeff));
 fprintf('The ReflecCoeffi(polar form)  Magnitd:  %g  Angle:  %g \n ',ReCoMagni,ReCoAngle);
 fprintf('\n');
  
%2) UNcoment/COMMENT  which Formular to use
%Vin, Iin, AND Pavg of Generator
Zg=input('Enter  Impedance Zg :    ');
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
Vg=Vg_Amplitude*exp(Vg_phase*1i);

Vin=(Zin*Vg)/(Zin+Zg);
fprintf('\n');
fprintf('The input voltage Vin is:  ')
disp(Vin);
 [VinAngle,VinMagni] = cart2pol(real(Vin),imag(Vin));
 fprintf('The Vin(polar form)  Magnitd:  %g    Angle:  %g \n ',VinMagni,VinAngle);
 fprintf('\n');
 
 Iin=Vin/Zin;
fprintf('The input Current (Iin) is:  ')
disp(Iin);
 [IinAngle,IinMagni] = cart2pol(real(Iin),imag(Iin));
 fprintf('The Iin(polar form)  Magnitd:  %g    Angle:  %g \n ',IinMagni,IinAngle);
fprintf('\n');

CplexConju_Iin=conj(Iin);
Pavg=0.5*Vg*CplexConju_Iin;
fprintf('\n')
fprintf('The average Power of Source(Vg) is: %g WATS\n ',Pavg)
fprintf('\n');
Voplus=Vin/(exp(Bl*1i)+ReCoeff*exp(-Bl*1i));
fprintf('The incident voltage Vo+:   ')
disp(Voplus);
VoRefle=Voplus*ReCoeff;
fprintf('The reflected voltage Vo-:   ')
disp(VoRefle);


% 3) LOAD VOLTAGE AND CURRENT
Vload=Voplus*(1+ReCoeff);
fprintf('The load voltage :   ')
disp(Vload);
 [VloadAngle,VloadMagni] = cart2pol(real(Vload),imag(Vload));
 fprintf('The Vload(polar form)  Magnitd:  %g,  Angle:  %g\n ',VloadMagni,VloadAngle);
fprintf('\n');

Loadcurnt=Vload/ZL;
fprintf('The load Current :   ')
disp(Loadcurnt);
[LoadcurntAngle,LoadcurntMagni] = cart2pol(real(Loadcurnt),imag(Loadcurnt));
 fprintf('The Loadcurnt(polar form)  Magnitd:  %g    Angle:  %g \n ',LoadcurntMagni,LoadcurntAngle);
fprintf('\n');

CplexConju_Ioadcrnt=conj(Loadcurnt);
Pwrload=0.5*Vload*CplexConju_Ioadcrnt;
Pwrgen=0.5*Vg*CplexConju_Iin;
fprintf('\n');

fprintf('The load voltage :   ')
disp(Vload);
fprintf('\n');
fprintf('The  Power deliverd to Load is: %g  WATS\n ',Pwrload)
fprintf('\n');
fprintf('The  Power deliverd to gen is: %g  WATS\n ',Pwrgen)
fprintf('\n');
%4) ENTER ANY PT TO DISPLAY VOLTAGE
Bd=input(' Enter dist frm load to get Voltage( at pt) Do Not include -ve sign:  ');
fprintf('\n');
gamma_ang = angle(ReCoeff);
%d is distance from the load in wavelengths
d = 0:0.01:1; %d goes from zero to 1, with steps of 0.01
Vd = abs(Voplus)*sqrt(1+abs(ReCoeff)^2+2*abs(ReCoeff)*cos(2*pi*d - gamma_ang)); % equation from book
plot(d, Vd);

% %  5) THE VOLTAGE AT A GIVEN POINT
%   VoltageAtpt=Voplus*(exp(Bd*1i)+ReCoeff*exp(-Bd*1i)) ;
%   for Bd = 0:1:Bd
%   VoltageAtpt1=abs(Voplus*(1+abs(ReCoeff)^(2)+2*(ReCoeff)*cos(2*Bd-ReCoAngle))^(1/2));
%   end
%  
%   fprintf('The Voltage at the given pt in phasor domain is :   ')
%   disp(VoltageAtpt);
%    [VoltageAtptAngle,VoltageAtptMagni] = cart2pol(real(VoltageAtpt),imag(VoltageAtpt));
%   fprintf('The Voltage At pt(polar form)  Magnitd:  %g    Angle:  %g \n ',VoltageAtptMagni,VoltageAtptAngle);
%  fprintf('\n');