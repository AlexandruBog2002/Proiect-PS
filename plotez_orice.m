function [h,Delta,Delta_pr,Delta_sr]=plotez_orice(M,w,freq_c,omega_p,omega_s,omega_c)

% aceasta rutina calculeaza spectrul in dB pentru orice fereastra si
% ploteaza spectrul impreuna cu liniile verticale pe pozitiile omega_p , omega_s  si omega_c
% si liniile orizontale pentru 1+-Delta_p si Delta_s si returneaza
% tolerantele Delta_pr si Delta_sr impreuna cu suma lor pentru a le utiliza
% in main

% introducerea de parametrii anomalici aduce o plotare neanalizabila si
% incorecta

Delta_p = 4.0432/100;
Delta_s = Delta_p;

h = fir1(M-1,freq_c,w);
[Delta_pr,Delta_sr]=Faza_3_PR(h,omega_p,omega_s);
Delta=Delta_sr+Delta_pr;
%disp(Delta);
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

[H,omega]=freqz(h,1,5000);

n=omega_s/pi:(pi/pi-omega_s/pi)/(M-1):pi/pi;
n1=0:(omega_p/pi)/(M-1):omega_p/pi;
m=linspace(-400,db(1+Delta_p),M);

 y=zeros(1,M);
 y1=zeros(1,M);
 y2=zeros(1,M);
 y3=zeros(1,M);
 y4=zeros(1,M);
 y5=zeros(1,M);


for i=1:M
    y(1,i)=db(Delta_s);
end
for i=1:M
    y1(1,i)=omega_p/pi;
end
for i=1:M
    y2(1,i)=omega_s/pi;
end
for i=1:M
    y3(1,i)=omega_c/pi;
end
for i=1:M
    y4(1,i)=db(1+Delta_p);
end
for i=1:M
    y5(1,i)=db(1-Delta_p);
end



hold on
plot(omega/pi,db(abs(H)));

plot(n,y,'k--');

plot(y1,m,'r--');
plot(y2,m,'r--');
plot(y3,m,'r--');

plot(n1,y4,'g--');
plot(n1,y5,'g--');

xlim([0,1])
ylim([-100,20])
hold off


n=0:M-1;
K=(M-1)/2;

omega_c = 1.4972;
freq_c =omega_c/pi;

Hid=sin(omega_c.*(n-K))./pi.*(n-K);

h = fir1(M-1,freq_c,Hid);

[Hamster,w]=freqz(h,1,5000);

norm(Hid-Hamster,2);



end