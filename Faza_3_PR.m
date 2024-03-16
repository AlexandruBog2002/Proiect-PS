function [Delta_pr,Delta_sr]=Faza_3_PR(h,omega_p,omega_s)

%aceasta rutina calculeaza tolerantele pe care le admite filtrul
%introdus

% introducerea de parametrii anomalici duce la o calculare incorecta a
% tolerantelor filtrului introdus
 spatiu_p = 0 :omega_p/5000 :omega_p ;         %grila de frecventa pentru intervalul [0,omega_p] cu o rezolutie de 5000 de puncte
 spatiu_s = omega_s :(pi-omega_s)/5000 :pi ;   %grila de frecventa pentru intervalul [omega_s,pi]  cu o rezolutie de 5000 de puncte
 
 [H_p,~]=freqz(h,1,spatiu_p);
 [H_s,~]=freqz(h,1,spatiu_s);
 
 Delta_pr = max(abs(1-abs(H_p)));
 Delta_sr = max(abs(H_s)); 

end