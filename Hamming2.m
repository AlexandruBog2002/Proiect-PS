function [bool,coef,Delta_pr,Delta_sr]=Hamming2(M,omega_p,omega_s,omega_c)

% aceasta functie imi furnizeaza informatia care-mi spune daca s-au
% indeplinit tolerantele impuse pentru fereastra Hamming si imi returneaza
% lungimea ferestei , steguletul boolean si tolerantele lui Delta_pr si
% Delta_Sr pentru a le utiliza in main

%introducerea de parametrii anomali furnizeaza o fereastra slaba sau o sa
%dea eroare de compilare

Delta_p = 4.0432/100;
Delta_s = Delta_p;
freq_c = omega_c/pi;
coef=0;
bool=0;

h = fir1(M-1,freq_c);

[Delta_pr,Delta_sr]=Faza_3_PR(h,omega_p,omega_s);

if(Delta_pr < Delta_p && Delta_sr < Delta_s)
 coef = M;
 bool = 1;
     
end
     
end