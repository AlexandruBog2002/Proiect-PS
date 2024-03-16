ng = 4; ns = 2;
% omega_c = PS_PRJ_1_Faza_2a(ng,ns) ; 
omega_c = 1.2702;
freq_c=omega_c/pi;          % am calculat care este frecventa de taiere

M=24;                                               
r=86.8108 ; r1=r-5 ; r2=r+5 ;
beta=4.7243 ; beta1=beta-1 ; beta2=beta+1 ;
L=2 ; L1=L-1 ; L2=L+1 ;
% alfa=40.4324 ; alfa1=alfa-15 ; alfa2=alfa+15;
% n=0:M-1;
% spatiu=0:M-1;
% Delta_pr=0.3463;
% 
% for i=1:M
%     y(1,i)=Delta_pr;
% end
% for i=1:3
%     y1(1,i)=omega_p;
% end
% for i=1:3
%     y2(1,i)=omega_s;
% end
% for i=1:M
%     y3(1,i)=1+Delta_pr;
% end
% for i=1:M
%     y4(1,i)=1-Delta_pr;
% end
% m=[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2 2.1 2.2 2.3]
% 
% hold on
% plot(n,y,'r--');
% plot(n,y3,'b--');
% plot(n,y4,'b--');
% plot(y1,m,'k--');
% plot(y2,m,'g--');
% % plot(n,1-Delta_pr),'k';

for M=24:100
spatiu=0:M-1;
for L=1:1
wLanczos=(sin(2*pi*(2.*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;       
wLanczos=wLanczos/sum(wLanczos);
h = fir1(M-1,freq_c,wLanczos);
end
end