clc
close all

ng = 4; ns = 2;
   
M=24;
M2 = M + M/2;
M3 = 2*M;
M4 = 52;

r=86.8108  ; r2=r+5 ;
% [omega_p,omega_s,Delta_p] = PS_PRJ_1_Faza_3b(ng,ns) ; 

omega_p = 1.2702;
omega_s = 1.6985;
Delta_p = 4.0432/100;
Delta_s = Delta_p;
w1=0.25;    omega_c_1 = (1-w1)*omega_p+w1*omega_s;      freq_c_1 = omega_c_1/pi;
w2=0.5;     omega_c_2 = (1-w2)*omega_p+w2*omega_s;      freq_c_2 = omega_c_2/pi;
w3=0.75;    omega_c_3 = (1-w3)*omega_p+w3*omega_s;      freq_c_3 = omega_c_3/pi;

figure(16)
set(gcf,'units','pixels','position',[0,0,1024,1024]);

% Ca sa pot genera noul clasament de performanta am adunat urmatoarele date
% 
% M + Freq_c_1 => Delta(0.4606) M=24 2x
% M + Freq_c_2 => Delta(0.4266) M=24 2x
% M + Freq_c_3 => Delta(0.4606) M=24 2x
% M2 + Freq_c_1 => Delta(0.3108) M=36 xv
% M2 + Freq_c_2 => Delta(0.2319) M=36 2x
% M2 + Freq_c_3 => Delta(0.3108) M=36 xv
% M3 + Freq_c_1 => Delta(0.2205) M=48 xv
% M3 + Freq_c_2 => Delta(0.1062) M=48 xv
% M3 + Freq_c_3 => Delta(0.2205) M=48 xv
% 
% Dintre care Delta inseamna suma tolerantelor filtrului respectiv adica Delta_pr + Delta_sr
% M este ordinul filtrului
% 2x inseamna ca nu sunt indeplinite ambele tolerante impuse de ppfti
% xv inseamna ca indeplinita o singura toleranta impuse de ppfti
% vv inseamna sunt indeplinite ambele tolerante impuse de ppfti
% 
% => ajung la concluzia ca nu am niciun filtru valid => trebuie sa modific marimea lui 2*M sau M3 pana cand obtin unul valid => ajungem la M4
% M4 = 52 
% M4 + Freq_c_1 => Delta(0.1984) M=52 xv
% M4 + Freq_c_2 => Delta(0.0783) M=52 vv
% M4 + Freq_c_3 => Delta(0.1984) M=52 xv
% 
% Ca sa realizez noul clasament o sa le iau in ordinea incdeplinirii
% criteriilor: 
% a)indeplinirea tolerantelor impuse(cel mai important)
% b)Delta sa fie cat mai mic
% c)ordin filtrului sa fie cat mai mic
% 
% Astfel avem:
% 1.M4 Freq_c_2 (cel mai performant)
% 2.M4 Freq_c_1
% 3.M4 Freq_c_3
% 4.M2 Freq_c_2
% 5.M2 Freq_c_1
% 6.M2 Freq_c_3
% 7.M Freq_c_2
% 8.M Freq_c_1
% 9.M Freq_c_3  (cel mai prost)
% 
% Freq_c_1 si Freq_c_2 produc acelasi Delta asa ca pozitiile pe care se
% afla sunt interschimbabile
    
subplot(3,3,8)
pondere(M,freq_c_1);
title('Cebasev III','[ M = 24 , w1 = 0.25 ]');
xlabel('Ordin filtru 24');
ylabel('Amplitudine dB');

subplot(3,3,7)
pondere(M,freq_c_2);
title('Cebasev III','[ M = 24 , w2 = 0.50 ]');
xlabel('Ordin filtru 24');
ylabel('Amplitudine dB');

subplot(3,3,9)
pondere(M,freq_c_3);
title('Cebasev III','[ M = 24 , w3 = 0.75 ]');
xlabel('Ordin filtru 24');
ylabel('Amplitudine dB');

%

subplot(3,3,5)
pondere(M2,freq_c_1);
title('Cebasev III','[ M = 36 , w1 = 0.25 ]');
xlabel('Ordin filtru 36');
ylabel('Amplitudine dB');

subplot(3,3,4)
pondere(M2,freq_c_2);
title('Cebasev III','[ M = 36 , w2 = 0.50 ]');
xlabel('Ordin filtru 36');
ylabel('Amplitudine dB');

subplot(3,3,6)
pondere(M2,freq_c_3);
title('Cebasev III','[ M = 36 , w3 = 0.75 ]');
xlabel('Ordin filtru 36');
ylabel('Amplitudine dB');

%

subplot(3,3,2)
pondere(M4,freq_c_1);
title('Cebasev III','[ M = 52 , w1 = 0.25 ]');
xlabel('Ordin filtru 52');
ylabel('Amplitudine dB');

subplot(3,3,1)
pondere(M4,freq_c_2);
title('Cebasev III','[ M = 52 , w2 = 0.50 ]');
xlabel('Ordin filtru 52');
ylabel('Amplitudine dB');

subplot(3,3,3)
pondere(M4,freq_c_3);
title('Cebasev III','[ M = 52 , w3 = 0.75 ]');
xlabel('Ordin filtru 52');
ylabel('Amplitudine dB');

figure(17)
set(gcf,'units','pixels','position',[0,0,1024,1024]);

subplot(3,3,8)
disp('1')
[Delta,Delta_pr,Delta_sr]=plotez_db(M,freq_c_1,omega_p,omega_s,omega_c_1);
title('Cebasev III','[ M = 24 , w1 = 0.25 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p)
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end

subplot(3,3,7)
disp('2')
[Delta,Delta_pr,Delta_sr]=plotez_db(M,freq_c_2,omega_p,omega_s,omega_c_2);
title('Cebasev III','[ M = 24 , w2 = 0.50 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p)
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end

subplot(3,3,9)
disp('3')
[Delta,Delta_pr,Delta_sr]=plotez_db(M,freq_c_3,omega_p,omega_s,omega_c_3);
title('Cebasev III','[ M = 24 , w3 = 0.75 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p) 
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end



subplot(3,3,5)
disp('4')
[Delta,Delta_pr,Delta_sr]=plotez_db(M2,freq_c_1,omega_p,omega_s,omega_c_1);
title('Cebasev III','[ M = 36 , w1 = 0.25 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p)
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end

subplot(3,3,4)
disp('5')
[Delta,Delta_pr,Delta_sr]=plotez_db(M2,freq_c_2,omega_p,omega_s,omega_c_2);
title('Cebasev III','[ M = 36 , w2 = 0.50 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p)
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end

subplot(3,3,6)
disp('6')
[Delta,Delta_pr,Delta_sr]=plotez_db(M2,freq_c_3,omega_p,omega_s,omega_c_3);
title('Cebasev III','[ M = 36 , w3 = 0.75 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p) 
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end



subplot(3,3,2)
disp('7')
[Delta,Delta_pr,Delta_sr]=plotez_db(52,freq_c_1,omega_p,omega_s,omega_c_1);
title('Cebasev III','[ M = 52 , w1 = 0.25 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p)
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end

subplot(3,3,1)
disp('8')
[Delta,Delta_pr,Delta_sr]=plotez_db(52,freq_c_2,omega_p,omega_s,omega_c_2);
title('Cebasev III','[ M = 52 , w2 = 0.50 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p)
    disp('nu e bun');
else 
    disp('e bun');
end
if(Delta_sr > Delta_s)
    disp('nu e bun');
else 
    disp('e bun');
end

subplot(3,3,3)
disp('9')
[Delta,Delta_pr,Delta_sr]=plotez_db(52,freq_c_3,omega_p,omega_s,omega_c_3);
title('Cebasev III','[ M = 52 , w3 = 0.75 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
disp(Delta);
if(Delta_pr > Delta_p)
    disp('nu e bun');
else
    disp('e bun');
end
if(Delta_sr > Delta_s) 
    disp('nu e bun');
else 
    disp('e bun');
end

figure(18)
set(gcf,'units','pixels','position',[0,0,1024,1024]);

subplot(3,3,8)
faza(M,freq_c_1,omega_p,omega_s,omega_c_1);
title('Cebasev III','[ M = 24 , w1 = 0.25 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

subplot(3,3,7)
faza(M,freq_c_2,omega_p,omega_s,omega_c_2);
title('Cebasev III','[ M = 24 , w2 = 0.50 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

subplot(3,3,9)
faza(M,freq_c_3,omega_p,omega_s,omega_c_3);
title('Cebasev III','[ M = 24 , w3 = 0.75 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

%

subplot(3,3,5)
faza(M2,freq_c_1,omega_p,omega_s,omega_c_1);
title('Cebasev III','[ M = 36 , w1 = 0.25 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

subplot(3,3,4)
faza(M2,freq_c_2,omega_p,omega_s,omega_c_2);
title('Cebasev III','[ M = 36 , w2 = 0.50 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

subplot(3,3,6)
faza(M2,freq_c_3,omega_p,omega_s,omega_c_3);
title('Cebasev III','[ M = 36 , w3 = 0.75 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

%

subplot(3,3,2)
faza(52,freq_c_1,omega_p,omega_s,omega_c_1);
title('Cebasev III','[ M = 52 , w1 = 0.25 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

subplot(3,3,1)
faza(52,freq_c_2,omega_p,omega_s,omega_c_2);
title('Cebasev III','[ M = 52 , w2 = 0.50 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

subplot(3,3,3)
faza(52,freq_c_3,omega_p,omega_s,omega_c_3);
title('Cebasev III','[ M = 52 , w3 = 0.75 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

