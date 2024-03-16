function faza(M,freq_c,omega_p,omega_s,omega_c)

% aceasta rutina calculeaza faza pentru fereastra Cebyshev si ploteaza faza
% impreuna cu liniile verticale pe pozitiile omega_p , omega_s  si omega_c

% introducerea de parametrii anomalici aduce o plotare neanalizabila si
% incorecta

r2=91.8108;
n=0:M-1;
w=chebwin(M,r2);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);

 y1=zeros(1,M);
 y2=zeros(1,M);
 y3=zeros(1,M);
 m=linspace(-4,4,M);

for i=1:M
    y1(1,i)=omega_p/pi;
end
for i=1:M
    y2(1,i)=omega_s/pi;
end
for i=1:M
    y3(1,i)=omega_c/pi;
end

hold on
plot(omega/pi,angle(H));
plot(y1,m,'r--');
plot(y2,m,'r--');
plot(y3,m,'r--');
hold off

end