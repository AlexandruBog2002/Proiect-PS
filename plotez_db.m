function [Delta,Delta_pr,Delta_sr]=plotez_db(M,freq_c,omega_p,omega_s,omega_c)

% aceasta rutina calculeaza spectrul in dB pentru fereastra Cebyshev si
% ploteaza spectrul impreuna cu liniile verticale pe pozitiile omega_p , omega_s  si omega_c
% si liniile orizontale pentru 1+-Delta_p si Delta_s si returneaza
% tolerantele Delta_pr si Delta_sr impreuna cu suma lor pentru a le utiliza
% in main

% introducerea de parametrii anomalici aduce o plotare neanalizabila si
% incorecta

r2=91.8108;

Delta_p = 4.0432/100;
Delta_s = Delta_p;

w=chebwin(M,r2);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);

[Delta_pr,Delta_sr]=Faza_3_PR(h,omega_p,omega_s);
Delta=Delta_pr+Delta_sr;

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
    y3(1,i)=db(1+Delta_p);
end
for i=1:M
    y4(1,i)=db(1-Delta_p);
end

for i=1:M
    y5(1,i)=omega_c/pi;
end

hold on
plot(omega/pi,db(abs(H)));
plot(n,y,'k--');
plot(y1,m,'r--');
plot(y2,m,'r--');
plot(y5,m,'r--');
plot(n1,y3,'g--');
plot(n1,y4,'g--');
xlim([0,1])

end