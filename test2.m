
ng = 4; ns = 2;
% omega_c = PS_PRJ_1_Faza_2a(ng,ns) ; 
omega_c = 1.2702;
freq_c=omega_c/pi;          % am calculat care este frecventa de taiere

M=24;                                               
r=86.8108 ; r1=r-5 ; r2=r+5 ;
beta=4.7243 ; beta1=beta-1 ; beta2=beta+1 ;
L=2 ; L1=L-1 ; L2=L+1 ;
alfa=40.4324/100 ; alfa1=alfa-15/100 ; alfa2=alfa+15/100;

spatiu=0:M-1;
spatiu2=linspace(0,M-1,5000);

% % set(gcf,'units','pixels','position',[0,100,2048,512]);
% hold on
% for i=1:M-1
% f(1,i)=omega_c*sin(omega_c*i)/omega_c*i*pi;
% end
%  f=f/sum(f);
%  figure(1)
%  plot(spatiu,f)
% h = fir1(M-1,freq_c,f);
% [H,spatiu2]=freqz(f,spatiu2);
% figure(2)
% plot(spatiu2/pi,db(abs(H))));    
% title('FIltru ideal');

figure(1)
set(gcf,'units','pixels','position',[0,0,768,768]);
hold on
legend('1');
w=boxcar(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H,spatiu2]=freqz(h,1,5000);
plot(spatiu2/pi,db(abs(H)));    
title('Spectru Dreptunghiulara');
% sugoma=['Box' ,'tring', 'HamHam', 'han' ,'t1' ,'t2' ,'t3']
%  legend(sugoma);
% % 
% % figure(2)
% % set(gcf,'units','pixels','position',[0,0,768,768]);
w=blackman(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H,spatiu2]=freqz(h,1,5000);
plot(spatiu2/pi,db(abs(H)));
% % title('Spectru Blackman');
% % 
% % figure(3)
% % set(gcf,'units','pixels','position',[0,0,768,768]);
w=triang(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H,spatiu2]=freqz(h,1,5000);
plot(spatiu2/pi,db(abs(H)));    
% title('Spectru Triunghiulara');
% 
% figure(4)
% set(gcf,'units','pixels','position',[0,0,768,768]);
h = fir1(M-1,freq_c);
[H,spatiu2]=freqz(h,1,5000);
plot(spatiu2/pi,db(abs(H)));   
% title('Spectru Hamming');

% 
% figure(5)
% set(gcf,'units','pixels','position',[0,0,768,768]);
w=hanning(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H,spatiu2]=freqz(h,1,5000);
plot(spatiu2/pi,db(abs(H)));     
% title('Spectru Hanning');

% figure(6)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=chebwin(M,r2);                                                               
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))));     
% title('Spectru Cebisev III','[r2 = 91.8108 dB]');
% 
% figure(7)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=chebwin(M,r1);                                                               
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))));     
% title('Spectru Cebisev I','[r1 = 81.8108 dB]');
% 
% figure(8)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=chebwin(M,r);                                                               
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))));     
% title('Spectru Cebisev II','[r = 86.8108 dB]');

% figure(9)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=kaiser(M,beta);                                                                
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))),'m');     
% title('Spectru Kaiser II','[beta = 4.7243 dB]');
% 
% figure(10)
% set(gcf,'units','pixels','position',[0,0,768,768]);
w=kaiser(M,beta1);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,spatiu2]=freqz(h,1,5000);
plot(spatiu2/pi,db(abs(H)));     
title('Spectru Kaiser I','[beta1 = 3.7243 dB]');
% 
% 
% figure(11)
% set(gcf,'units','pixels','position',[0,0,768,768]);
w=kaiser(M,beta2);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,spatiu2]=freqz(h,1,5000);
plot(spatiu2/pi,db(abs(H)));     
% title('Spectru Kaiser III','[beta2 = 5.7243 dB]');
% 
% figure(12)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% wLanczos=(sin(2*pi*(2.*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;       
% wLanczos=wLanczos/sum(wLanczos);
% h = fir1(M-1,freq_c,wLanczos);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))),'r');  
% title('Spectru Lanczos II','[L = 2 ordin]');
% 
% figure(13)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% wLanczos1=(sin(2*pi*(2.*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L1;       
% wLanczos1=wLanczos1/sum(wLanczos1);
% h = fir1(M-1,freq_c,wLanczos1);
% [H,spatiu2]=freqz(h,1,5000);
% plot(spatiu2/pi,db(abs(H)),'m');     
% title('Spectru Lanczos I','[L1 = 1 ordin]');
% 
% 
% 
% 
% figure(14)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% wLanczos2=(sin(2*pi*(2.*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L2;       
% wLanczos2=wLanczos2/sum(wLanczos2);
% h = fir1(M-1,freq_c,wLanczos2);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))),'r');     
% title('Spectru Lanczos III','[L2 = 3 ordin]');
% 
% figure(15)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=tukeywin(M,alfa2);                                                          
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))),'k');     
% title('Spectru Tuckey III','[alfa = 55.4324 %]');
% 
% figure(16)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=tukeywin(M,alfa1);                                                                  
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))),'k');     
% title('Spectru Tuckey I','[alfa1 = 25.4324 %]');
% 
% figure(17)
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=tukeywin(M,alfa);                                                                 
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,spatiu2]=freqz(h,spatiu2);
% plot(spatiu2/pi,db(abs(H))),'r');     
% title('Spectru Tuckey II','[alfa = 40.4324 %]');
% 
% 
% 
% 
% 
% 
% 
% 




% w=tukeywin(M,alfa1);                                                                  
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,omega]=freqz(h,1,5000);
% plot(omega/pi,db(abs(H)),'g');   
% title('Spectru Tuckey I','[alfa1 = 25.4324 %]');
% 
% 
% w=tukeywin(M,alfa);                                                                 
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,omega]=freqz(h,1,5000);
% plot(omega/pi,db(abs(H)),'r'); 
% title('Spectru Tuckey II','[alfa = 40.4324 %]');
% 
% 
% w=tukeywin(M,alfa2);                                                          
% w=w/sum(w);
% h = fir1(M-1,freq_c,w);
% [H,omega]=freqz(h,1,5000);
% plot(omega/pi,db(abs(H)),'k');  
% title('Spectru Tuckey III','[alfa = 55.4324 %]');



