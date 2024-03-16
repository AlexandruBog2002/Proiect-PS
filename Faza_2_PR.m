clc
close all

%a

ng = 4; ns = 2;
% omega_c = PS_PRJ_1_Faza_2a(ng,ns) ; 
omega_c = 1.2702;
freq_c=omega_c/pi;          % am calculat care este frecventa de taiere

M = 24 ;                                               
r = 86.8108 ; r1 = r - 5 ; r2 = r + 5 ;
beta = 4.7243 ; beta1 = beta - 1 ; beta2 = beta + 1 ;
L = 2 ; L1 = L - 1 ; L2 = L + 1 ;
alfa = 40.4324 / 100 ; alfa1 = alfa - 15 / 100 ; alfa2 = alfa + 15 / 100 ;

spatiu=0:M-1;                        %durata de esantionare

figure(8)       %  Secventele pondere pentru cele 5 ferestre neparametrice
set(gcf,'units','pixels','position',[0,100,2048,512]);

w=boxcar(M);                                            
h = fir1(M-1,freq_c,w);
subplot(1,5,1)
stem(spatiu,h)                 
title('Secv. pondere Dreptunghiulara');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=blackman(M);                                            
h = fir1(M-1,freq_c,w);
subplot(1,5,2)
stem(spatiu,h);   
title('Secv. pondere Blackman');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=triang(M);                                           
h = fir1(M-1,freq_c,w);
subplot(1,5,3)
stem(spatiu,h);    
title('Secv. pondere Triunghiulara');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

h = fir1(M-1,freq_c);
subplot(1,5,4)
stem(spatiu,h);    
title('Secv. pondere Hamming');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=hanning(M);                                            
h = fir1(M-1,freq_c,w);
subplot(1,5,5)
stem(spatiu,h);    
title('Secv. pondere Hanning');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

figure(9)       % Secventele pondere pentru ferestrele Cebisev si Kaiser
set(gcf,'units','pixels','position',[0,100,2048,512]);

w=chebwin(M,r1);                                                               
h = fir1(M-1,freq_c,w);
subplot(2,3,1)
stem(spatiu,h); 
title('Secv. pondere Cebisev I', '[r1 = 81.8108 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=chebwin(M,r);                                                               
h = fir1(M-1,freq_c,w);
subplot(2,3,2)
stem(spatiu,h); 
title('Secv. pondere Cebisev II', '[r = 86.8108 dB]');
xlabel('Spatiul de reprezentarea');
ylabel('Amplitudine');

w=chebwin(M,r2);                                                               
h = fir1(M-1,freq_c,w);
subplot(2,3,3)
stem(spatiu,h); 
title('Secv. pondere Cebisev III', '[r2 = 91.8108 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=kaiser(M,beta1);                                                               
h = fir1(M-1,freq_c,w);
subplot(2,3,4)
stem(spatiu,h); 
title('Secv. pondere Kaiser I', '[beta1 = 3.7243 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=kaiser(M,beta);                                                               
h = fir1(M-1,freq_c,w);
subplot(2,3,5)
stem(spatiu,h); 
title('Secv. pondere Kaiser II', '[beta = 4.7243 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=kaiser(M,beta2);                                                               
h = fir1(M-1,freq_c,w);
subplot(2,3,6)
stem(spatiu,h); 
title('Secv. pondere Kaiser III', '[beta1 = 5.7243 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

figure(10)       % Secventele pondere pentru ferestrele Lanczos si Kaiser
set(gcf,'units','pixels','position',[0,100,2048,512]);

wLanczos1=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L1;       
h = fir1(M-1,freq_c,wLanczos1);
subplot(2,3,1)
stem(spatiu,h); 
title('Secv. pondere Lanczos I', '[L = 1 ordin]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

wLanczos=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;       
h = fir1(M-1,freq_c,wLanczos);
subplot(2,3,2)
stem(spatiu,h); 
title('Secv. pondere Lanczos II', '[L = 2 ordin]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

wLanczos2=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L2;       
h = fir1(M-1,freq_c,wLanczos2);
subplot(2,3,3)
stem(spatiu,h); 
title('Secv. pondere Lanczos III', '[L = 3 ordin]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=tukeywin(M,alfa1);                                                                  
h = fir1(M-1,freq_c,w);
subplot(2,3,4)
stem(spatiu,h); 
title('Secv. pondere Tuckey I', '[alfa1 = 25.4324 %]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=tukeywin(M,alfa);                                                                 
h = fir1(M-1,freq_c,w);
subplot(2,3,5)
stem(spatiu,h); 
title('Secv. pondere Tuckey II', '[alfa = 40.4324 %]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=tukeywin(M,alfa2);                                                          
h = fir1(M-1,freq_c,w);
subplot(2,3,6)
stem(spatiu,h); 
title('Secv. pondere Tuckey III', '[alfa2 = 55.4324 %]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');


figure(11)                      % raspunsul filtrelor ferestrelor respcetiv pentru primele 5 ferestre neparametrice
set(gcf,'units','pixels','position',[0,100,2048,768]);

w=boxcar(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H1,omega]=freqz(h,1,5000);
subplot(2,5,1)
plot(omega/pi,db(abs(H1)));   
ylim([-300 20])
title('Spectru Dreptunghiulara');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,5,6)
plot(omega/pi,angle(H1))
title('Faza Dreptunghiulara');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=blackman(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,5,2)
plot(omega/pi,db(abs(H)));
ylim([-300 20])
title('Spectru Blackman');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,5,7)
plot(omega/pi,angle(H))
title('Faza Blackman');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=triang(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,5,3)
plot(omega/pi,db(abs(H)));   
ylim([-300 20])
title('Spectru Triunghiulara');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,5,8)
plot(omega/pi,angle(H))
title('Faza Triunghiulara');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
                                          
h = fir1(M-1,freq_c);
[H,omega]=freqz(h,1,5000);
subplot(2,5,4)
plot(omega/pi,db(abs(H)));  
ylim([-300 20])
title('Spectru Hamming');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,5,9)
plot(omega/pi,angle(H))
title('Faza Hamming');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=hanning(M);
w=w/sum(w);                                             
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,5,5)
plot(omega/pi,db(abs(H))); 
ylim([-300 20])
title('Spectru Hanning');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,5,10)
plot(omega/pi,angle(H));
title('Faza Hanning');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

figure(12)         % Spectrele + fazele Cebisev + Kaiser
set(gcf,'units','pixels','position',[0,100,2048,768]);

w=chebwin(M,r1);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,1)
plot(omega/pi,db(abs(H)));   
ylim([-400 20])
title('Spectru Cebisev I','[r1 = 81.8108 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,2)
plot(omega/pi,angle(H))
title('Faza Cebisev I','[r1 = 81.8108 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

w=chebwin(M,r);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,5)
plot(omega/pi,db(abs(H)));  
ylim([-400 20])
title('Spectru Cebisev II','[r = 86.8108 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,6)
plot(omega/pi,angle(H))
title('Faza Cebisev II','[r = 86.8108 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

w=chebwin(M,r2);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,9)
plot(omega/pi,db(abs(H)));   
ylim([-400 20])
title('Spectru Cebisev III','[r2 = 91.8108 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
subplot(3,4,10)
plot(omega/pi,angle(H))
title('Faza Cebisev III','[r1 = 91.8108 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');


w=kaiser(M,beta1);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,3)
plot(omega/pi,db(abs(H)));   
ylim([-300 20])
title('Spectru Kaiser I','[beta1 = 3.7243 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,4)
plot(omega/pi,angle(H))
title('Faza Kaiser I','[beta1 = 3.7243 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');


w=kaiser(M,beta);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,7)
plot(omega/pi,db(abs(H)));    
ylim([-300 20])
title('Spectru Kaiser II','[beta = 4.7243 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,8)
plot(omega/pi,angle(H))
title('Faza Kaiser II','[beta = 4.7243 dB]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

w=kaiser(M,beta2);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,11)
plot(omega/pi,db(abs(H)));    
ylim([-300 20])
title('Spectru Kaiser III','[beta2 = 5.7243 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
subplot(3,4,12)
plot(omega/pi,angle(H))
title('Faza Kaiser III','[beta2 = 5.7243 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');


figure(13)      % Spectrele + fazele Lanczos + Tuckey
set(gcf,'units','pixels','position',[0,100,2048,768]);

wLanczos1=(sin(2*pi*(2.*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L1;       
wLanczos1=wLanczos1/sum(wLanczos1);
h = fir1(M-1,freq_c,wLanczos1);
[H,omega]=freqz(h,1,5000);
subplot(3,4,1)
plot(omega/pi,db(abs(H)));  
ylim([-300 20])
title('Spectru Lanczos I','[L1 = 1 ordin]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,2)
plot(omega/pi,angle(H))
title('Faza Lanczos I','[L1 = 1 ordin]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

wLanczos=(sin(2*pi*(2.*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;       
wLanczos=wLanczos/sum(wLanczos);
h = fir1(M-1,freq_c,wLanczos);
[H,omega]=freqz(h,1,5000);
subplot(3,4,5)
plot(omega/pi,db(abs(H)));   
ylim([-300 20])
title('Spectru Lanczos II','[L = 2 ordin]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,6)
plot(omega/pi,angle(H))
title('Faza Lanczos II','[L = 2 ordin]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

wLanczos2=(sin(2*pi*(2.*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L2;       
wLanczos2=wLanczos2/sum(wLanczos2);
h = fir1(M-1,freq_c,wLanczos2);
[H,omega]=freqz(h,1,5000);
subplot(3,4,9)
plot(omega/pi,db(abs(H)));   
ylim([-300 20])
title('Spectru Lanczos III','[L2 = 3 ordin]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
subplot(3,4,10)
plot(omega/pi,angle(H))
title('Faza Lanczos III','[L2 = 3 ordin]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=tukeywin(M,alfa1);                                                                  
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,3)
plot(omega/pi,db(abs(H)));   
ylim([-300 20])
title('Spectru Tuckey I','[alfa1 = 25.4324 %]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,4)
plot(omega/pi,angle(H))
title('Faza Tuckey I','[alfa1 = 25.4324 %]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

w=tukeywin(M,alfa);                                                                 
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,7)
plot(omega/pi,db(abs(H))); 
ylim([-300 20])
title('Spectru Tuckey II','[alfa = 40.4324 %]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(3,4,8)
plot(omega/pi,angle(H))
title('Faza Tuckey II','[alfa = 40.4324 %]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

w=tukeywin(M,alfa2);                                                          
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(3,4,11)
plot(omega/pi,db(abs(H)));  
ylim([-300 20])
title('Spectru Tuckey III','[alfa = 55.4324 %]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
subplot(3,4,12)
plot(omega/pi,angle(H))
title('Faza Tuckey III','[alfa = 55.4324 %]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');


% % b
% % 
% %     Modul de abordare a clasificarii pe care am folosit-o:
% % 
% %     -am grupat filtrele in grupuri de cate 3-4 pentru a putea face o clasificare cu nu prea multe elemente
% %     -dupa ce evaluam grupurile si le faceam un podium , incepeam sa compar cel mai prost filtru al unui grup
% %      cu cel mai bun filtru de la alt grup si daca se intampla sa fie mai bun/prost updatam clasificarea si 
% %      concatenam grupele si dupa reverificam clasificarea ca sa fiu sigur ca este buna
% %     -si repetam procesul pana cand imi terminam clasificarea
% % 
% %     Concret ce am facut , am grupat Cebyshev , Kaiser , Lanczos si Tuckey in grupe cu numai filtrele de genul lor
% % 
% %     Am determinat cele mai bune din fiecare grup ex : Cebyshev 3 Kaiser 2 Tuckey 3 Lanczos 3
% %     Dupa am incercat sa compar cele 9 ferestre incluzand cele de mai sus si aveam o clasificare provizorie pentru 9 filtre
% %     Dupa ce aveam clasificarea , am inceput sa pun un filtru cu cate un filtru in ordine si updatam podiumul pe parcurs
% % 
% %     Cum determinam care filtru era cel mai bun? Ma uitam in banda de
% %     trecere si stopare sa fie cat mai asemanator de filtru ideal plus sa
% %     nu fie influentat prea mult de fenomenul GIBBS , de exemplu pana la
% %     pozitia 10 inclusiv fenomenul GIBBS isi facea prezenta in special in
% %     banda de trecere , dar in consecinta banda de stopare era foarte buna
% % 
% %     Cand a trebuit sa compar filtrele cele mai bune m-am uitat foarte
% %     bine lat cat de mult atenuau banda de stopare(de la pozitia 9 in sus)
% % 
% % 
% % 
% %   Clasificarea celor 17 pozitii ale filtrelor cu care am avut de lucru
% %   1. Cebyshev 3 (Castigatoarea de pe locul intai Cebyshev [r=91.8108 dB])
% %   2. Cebyshev 2
% %   3. Lanczos 3
% %   4. Cebyshev 1
% %   5. Blackman
% %   6. Kaiser 2
% %   7. Lanczos 2   
% %   8. Kaiser 3
% %   9. Hanning  (A doua alegere )
% %   10.Kaiser 1 
% %   11.Hamming
% %   12.Triunghiulara
% %   13.Lanczos 1
% %   14.Dreptunghiulara
% %   15.Tuckey 3
% %   16.Tuckey 2
% %   17.Tuckey 1
% % 
% %   Clasamentul filtrelor ce folosesc cele 9 ferestre (Modul dupa care am facut clasificarea este simplu : Am pus in clasament pozitiile ferestrelor numai de ordin 2 
% %   deoarece am considerat aceastea ca sunt reprezentate de parametrul de baza nemodificat si astfel pentru datele mele am pus in concordanta cu pozitia ferestrelor 
% %   de la celalalta clasificare ) De ce am facut asa si nu am luat doar
% %   prima instanta de nume ale ferestrelor ? Fiindca daca ma duc pe acest
% %   criteriu atunci nu pot sa fac o aproximare buna a clasamentului.De ce?
% %   Fiindca pot modifica parametrul secundar pana cand iese el cel mai
% %   bun dintre ele (De exemplu sa iau filtrul Tuckey, ii modific procentajul de deschidere a ferestrei pana cand produce o performanta foarte buna care il ajuta sa se
% %   compare cu alte filtre din start mai bune decat el , exemplu kaiser, si mi se pare ok sa concep clasamentul asa)
% % 
% %   1. Cebyshev
% %   2. Blackman
% %   3. Kaiser 
% %   4. Lanczos  
% %   5. Hanning  
% %   6. Hamming
% %   7. Triunghiulara
% %   8. Dreptunghiulara
% %   9. Tuckey
% % 
% %   Clasamentul furnizat de la quizul de laborator  
% %   1. Kaiser
% %   2. Cebyshev
% %   3. Blackman 
% %   4. Lanczos  
% %   5. Hanning  
% %   6. Hamming
% %   7. Tuckey
% %   8. Triunghiulara
% %   9. Dreptunghiulara
% % 
% %   Pot observa ca numai 2 perechi de ferestre si-au schimbat pozitia ,
% %   perechea cu cele mai bune si perechea cu cele mai proaste. Dar chestia
% %   asta se intampla doar pentru cazul datelor mele si cum am considerat eu
% %   sa se faca clasamentul aproximativ corect
% % 
% % 
% % 
% % locul 1 este Cebyshev 3
% % locul 9 este Hanning

M2 = M + M/2;
M3 = 2*M;

n3=0:M2-1;
n4=0:M3-1;


figure(14)      % Spectrele + fazele Lanczos + Tuckey
set(gcf,'units','pixels','position',[0,100,2048,768]);

w=chebwin(M,r2);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,3,1)
plot(omega/pi,db(abs(H)));
ylim([-400 20])
title('Spectru Cebisev III','[r2 = 91.8108 dB] [ M = 24 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
subplot(2,3,4)
plot(omega/pi,angle(H))
title('Faza Cebisev III','[r1 = 91.8108 dB] [ M = 24 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=chebwin(M2,r2);                                                               
w=w/sum(w);
h = fir1(M2-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,3,2)
plot(omega/pi,db(abs(H)));  
ylim([-400 20])
title('Spectru Cebisev III','[r2 = 91.8108 dB] [ M = 36 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
subplot(2,3,5)
plot(omega/pi,angle(H))
title('Faza Cebisev III','[r1 = 91.8108 dB] [ M = 36 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=chebwin(M3,r2);                                                               
w=w/sum(w);
h = fir1(M3-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,3,3)
plot(omega/pi,db(abs(H)));   
ylim([-400 20])
title('Spectru Cebisev III','[r2 = 91.8108 dB] [ M = 48 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');
subplot(2,3,6)
plot(omega/pi,angle(H))
title('Faza Cebisev III','[r1 = 91.8108 dB] [ M = 48 ]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

figure(15)      % Spectrele + fazele Lanczos + Tuckey
set(gcf,'units','pixels','position',[0,100,2048,768]);


w=hanning(M);                                                                 
w=w/sum(w);
h = fir1(M-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,3,1)
plot(omega/pi,db(abs(H))); 
ylim([-300 20])
title('Spectru Hanning','[ M = 24 ]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,3,4)
plot(omega/pi,angle(H))
title('Faza Hanning','[ M = 24 ]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

w=hanning(M2);                                                                 
w=w/sum(w);
h = fir1(M2-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,3,2)
plot(omega/pi,db(abs(H))); 
ylim([-300 20])
title('Spectru Hanning','[ M = 36 ]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,3,5)
plot(omega/pi,angle(H))
title('Faza Hanning','[ M = 36 ]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

w=hanning(M3);                                                                 
w=w/sum(w);
h = fir1(M3-1,freq_c,w);
[H,omega]=freqz(h,1,5000);
subplot(2,3,3)
plot(omega/pi,db(abs(H))); 
ylim([-300 20])
title('Spectru Hanning','[ M = 48 ]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');
subplot(2,3,6)
plot(omega/pi,angle(H))
title('Faza Hanning','[ M = 48 ]');
ylabel('Amplitudine dB');
xlabel('Banda de frecventa normalizata');

% Putem observa ca filtru cel mai bun al lui Hanning este cel de ordinul
% 48 si este mult mai bun decat cel mai slab filtru al lui Cebyshev , cel de oridnul 24 , de unde tragem concluzia 
% ca ordinul filtrului joaca un rol important in performanta acestuia si ii
% influenteaza capacitatea de a fi evaluat optimal . Lobul principal al lui
% Hanning este mult mai bun decat cel al lui Cebyshev , lobii paraziti sunt
% mult mai ingusti dar sunt mai lungi decat cei al lui Cebyshev , iar
% atenuarea la Hanning e mult mai buna in zona de mare frecventa 