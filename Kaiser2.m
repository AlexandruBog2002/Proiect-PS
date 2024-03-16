function [y1,y2,y3,bool,coef,a,b]=Kaiser2(M,beta,omega_p,omega_s,omega_c)

% aceasta functie imi furnizeaza informatia care-mi spune daca s-au
% indeplinit tolerantele impuse pentru fereastra Kaiser si imi returneaza
% lungimea ferestei , steguletul boolean si tolerantele lui Delta_pr si
% Delta_Sr pentru a le utiliza in main

%introducerea de parametrii anomali furnizeaza o fereastra slaba sau o sa
%dea eroare de compilare

Delta_p = 4.0432/100;
Delta_s = Delta_p;
freq_c = omega_c/pi;
coef=0;
bool=0;
y1=0;
y2=0;
y3=0;

a=20;
b=20;
amogus=0;
w=kaiser(M,beta);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);

[Delta_pr,Delta_sr]=Faza_3_PR(h,omega_p,omega_s);

if(Delta_pr < Delta_p && Delta_sr < Delta_s)
 coef = M;
 bool = 1;
 omega_c
 a=Delta_pr;
 b=Delta_sr;
 amogus=a+b;
 if(amogus==0.0623)
     y1=M;
     y2=beta;
     y3=omega_c;
 end

end
     
end