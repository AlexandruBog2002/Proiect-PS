%Lucrarea de laborator cu numarul 4
% Bogdan Alexandru 332 AC
 ng = 4; ns = 2;
%[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1(ng,ns);

%a

M = 24 ;                                               
r = 86.8108 ; r1 = r - 5 ; r2 = r + 5 ;
beta = 4.7243 ; beta1 = beta - 1 ; beta2 = beta + 1 ;
L = 2 ; L1 = L - 1 ; L2 = L + 1 ;
alfa = 40.4324 / 100 ; alfa1 = alfa - 15 / 100 ; alfa2 = alfa + 15 / 100 ;

%am calculat parametrii secundari pentru folosirea functiilor ferestrelor

spatiu=0:M-1 ;   %durata de esantionare

figure(1)    %raspunsul la impuls pentru Blackman, Triunghiulara, Hanning si Hamming
set(gcf,'units','pixels','position',[0,100,1024,512]);    % mi-am setat o rezolutie de baza buna pentru analiza optima a raspunsului la impuls a ferestrelor urmatoare

w=blackman(M);
subplot(2,2,1)
stem(spatiu,w);
title('Fereastra Blackman');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=triang(M);
subplot(2,2,2)
stem(spatiu,w);
title('Fereastra Triunghiulara');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=hamming(M);                                  
subplot(2,2,3)
stem(spatiu,w);
title('Fereastra Hamming');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=hanning(M);                                   
subplot(2,2,4)
stem(spatiu,w);
title('Fereastra Hanning');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

figure(2)   %raspunsul la impuls pentru Cebasev si Kaiser
set(gcf,'units','pixels','position',[0,100,1024,512]);

w=chebwin(M,r1);                                                            
subplot(2,3,1)
hold on
stem(spatiu,w);
w=chebwin(M,r);
stem(spatiu,w,'r');
hold off
title('Fereastra Cebisev I', '[r1 = 81.8108 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=chebwin(M,r);
subplot(2,3,2)
stem(spatiu,w);
title('Fereastra Cebisev II', '[r = 86.8108 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=chebwin(M,r2);
subplot(2,3,3)
hold on
stem(spatiu,w);
w=chebwin(M,r);
stem(spatiu,w,'r--');
hold off
title('Fereastra Cebisev III', '[r2 = 91.8108 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=kaiser(M,beta1);                                                            
subplot(2,3,4)
hold on
stem(spatiu,w);
w=kaiser(M,beta);
stem(spatiu,w,'r--');
hold off
title('Fereastra Kaiser I', '[beta1 = 3.7243 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=kaiser(M,beta);
subplot(2,3,5)
stem(spatiu,w);
title('Fereastra Kaiser II', '[beta = 4.7243 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=kaiser(M,beta2);
subplot(2,3,6)
hold on
stem(spatiu,w);
w=kaiser(M,beta);
stem(spatiu,w,'r--');
hold off
title('Fereastra Kaiser III','[beta1 = 5.7243 dB]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

figure(3)    %raspunsul la impuls pentru Lanczos si Tuckey
set(gcf,'units','pixels','position',[0,100,1024,512]);

wLanczos1= (sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L1;   %nu exista functie aferenta ferestrei Lanczos asa ca am implementat-o folosind definitia din suportul de curs      
subplot(2,3,1)
hold on
stem(spatiu,wLanczos1);
wLanczos= (sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;
stem(spatiu,wLanczos,'r--');
hold off
title('Fereastra Lanczos I', '[L = 1 ordin]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

wLanczos= (sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;
subplot(2,3,2)
stem(spatiu,wLanczos);
title('Fereastra Lanczos II', '[L = 2 ordin]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

wLanczos2= (sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L2;
subplot(2,3,3)
hold on
stem(spatiu,wLanczos2);
wLanczos= (sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;
stem(spatiu,wLanczos,'r--');
hold off
title('Fereastra Lanczos III', '[L = 3 ordin]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=tukeywin(M,alfa1);                                                                    
subplot(2,3,4)
hold on
stem(spatiu,w);
w=tukeywin(M,alfa);
stem(spatiu,w,'r--');
hold off
title('Fereastra Tuckey I', '[alfa1 = 25.4324 %]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=tukeywin(M,alfa);
subplot(2,3,5)
stem(spatiu,w);
title('Fereastra Tuckey II', '[alfa = 40.4324 %]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');

w=tukeywin(M,alfa2);
subplot(2,3,6)
hold on
stem(spatiu,w);
w=tukeywin(M,alfa);
stem(spatiu,w,'r--');
hold off
title('Fereastra Tuckey III', '[alfa2 = 55.4324 %]');
xlabel('Spatiul de reprezentare');
ylabel('Amplitudine');


%b



figure(4)   %raspunsul in frecventa pentru Dreptunghiulara
set(gcf,'units','pixels','position',[0,100,1024,512]);

w=boxcar(M);
w=w/sum(w);                                         %normarea semnalului           
[H,spatiu2]=freqz(w,5000);                          %rezolutia de reprezentare de 5000 de puncte
plot(spatiu2/pi,db(abs(H)));                    %normarea bandei de frecventa si reprezentarea spectrului in decibeli
title('Fereastra Dreptunghiulara');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

figure(5)   %raspunsul in frecventa pentru Blackman, Triunghiulara, Hanning si Hamming
set(gcf,'units','pixels','position',[0,100,1024,512]);

w=blackman(M);
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,2,1)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Blackman');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=triang(M);
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,2,2)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Triunghiulara');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=hamming(M);
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,2,3)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Hamming');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=hanning(M);
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,2,4)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Hanning');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

figure(6)    %raspunsul in frecventa pentru Cebasev si Kaiser
set(gcf,'units','pixels','position',[0,100,1024,512]);

w=chebwin(M,r1);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,1)  
hold on
plot(spatiu2/pi,db(abs(H)));
w=chebwin(M,r);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
plot(spatiu2/pi,db(abs(H)),'r:');       %atenuarea pe spectrul ferestrei parametrice
hold off
title('Fereastra Cebisev I', '[r1 = 81.8108 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=chebwin(M,r);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,2)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Cebisev II', '[r = 86.8108 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=chebwin(M,r2);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,3)
hold on
plot(spatiu2/pi,db(abs(H)));
w=chebwin(M,r);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
plot(spatiu2/pi,db(abs(H)),'r:');
hold off
title('Fereastra Cebisev III', '[r2 = 91.8108 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=kaiser(M,beta1);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,4)
hold on
plot(spatiu2/pi,db(abs(H)));
w=kaiser(M,beta);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
plot(spatiu2/pi,db(abs(H)),'r:');
hold off
title('Fereastra Kaiser I', '[beta1 = 3.7243 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=kaiser(M,beta);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,5)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Kaiser II', '[beta = 4.7243 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=kaiser(M,beta2);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,6)
hold on
plot(spatiu2/pi,db(abs(H)));
w=kaiser(M,beta);                                                               
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
plot(spatiu2/pi,db(abs(H)),'r:');
hold off
title('Fereastra Kaiser III', '[beta1 = 5.7243 dB]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

figure(7)    %raspunsul in frecventa pentru Lanczos si Tuckey
set(gcf,'units','pixels','position',[0,100,1024,512]);

wLanczos1=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L1;       
wLanczos1=wLanczos1/sum(wLanczos1);
[H,spatiu2]=freqz(wLanczos1,5000);
subplot(2,3,1)
hold on
plot(spatiu2/pi,db(abs(H)));
wLanczos=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;       
wLanczos=wLanczos/sum(wLanczos);
[H,spatiu2]=freqz(wLanczos,5000);
plot(spatiu2/pi,db(abs(H)),'r:');
hold off
title('Fereastra Lanczos I', '[L = 1 ordin]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

wLanczos=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;       
wLanczos=wLanczos/sum(wLanczos);
[H,spatiu2]=freqz(wLanczos,5000);
subplot(2,3,2)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Lanczos II', '[L = 2 ordin]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

wLanczos2=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L2;       
wLanczos2=wLanczos2/sum(wLanczos2);
[H,spatiu2]=freqz(wLanczos2,5000);
subplot(2,3,3)
hold on
plot(spatiu2/pi,db(abs(H)));
wLanczos=(sin(2*pi*(2*spatiu-M+1)./(2*M-2))./(2*pi*(2*spatiu-M+1)/(2*M-2))).^L;       
wLanczos=wLanczos/sum(wLanczos);
[H,spatiu2]=freqz(wLanczos,5000);
plot(spatiu2/pi,db(abs(H)),'r:');
hold off
title('Fereastra Lanczos III', '[L = 3 ordin]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=tukeywin(M,alfa1);                                                                  
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,4)
hold on
plot(spatiu2/pi,db(abs(H)));
w=tukeywin(M,alfa);                                                                 
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
plot(spatiu2/pi,db(abs(H)),'r:');
hold off
title('Fereastra Tuckey I', '[alfa1 = 25.4324 %]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=tukeywin(M,alfa);                                                                 
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,5)
plot(spatiu2/pi,db(abs(H)));
title('Fereastra Tuckey II', '[alfa = 40.4324 %]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

w=tukeywin(M,alfa2);                                                          
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
subplot(2,3,6)
hold on
plot(spatiu2/pi,db(abs(H)));
w=tukeywin(M,alfa);                                                                 
w=w/sum(w);
[H,spatiu2]=freqz(w,5000);
plot(spatiu2/pi,db(abs(H)),'r:');
hold off
title('Fereastra Tuckey III', '[alfa2 = 55.4324 %]');
xlabel('Banda de frecventa normalizata');
ylabel('Amplitudine dB');

%c

% Dreptunghiulara : se poate observa ca este cea mai slaba dintre toate
% ferestrele propuse , deoarece lobii parazitii sunt de inaltimi foarte
% mari => ca nu avem atenuare foarte buna , plus raspunsul in frecventa nu
% este continuu , acesta este plin de deschizaturi (Bronz 3)
% 
% Triunghiularar : lobul principal si cei paraziti au aproximativ aceeasi
% dimensiune  , dar ne este incalcat faptul ca lobul principal trebuie sa
% fie cat mai inalt si cat mai ingust (acesta este lat si turtit) ; Are aceeasi atenuare ca la
% dreptunghiulara (Bronz 2)
% 
% Tuckey : lobul principal arata super bine (e inalt si ingust) , dar lobii
% pararaziti sunt luati dupa dimensiunea lobului principal si astfel sunt 
% foarte inalti ; Atenuarea pare sa fie proasta in zona de medie frecventa
% (Bronz 1)
% 
% Hamming : lobul principal este foarte mare si destul de turtit , iar lobii
% paraziti par sa fie mai mici si restransi , inafara de primul care este
% turtit si mai lat decat ceilalti ; Atenuarea pare sa fie foarte foarte
% mica  (Silver 3)
% 
% Hanning : lobul principal mai mic si turtit decat Hamming , iar lobii
% paraziti sunt mai scunzi mult mai bine atenuati in zona de mare frecventa
%  (Silver 2)
% 
% Lanczos : este un fel de Hanning doar ca e mult mai bun , lob principal
% mai scurt , dar la fel de turtit , lobi paraziti mai mici si mai restransi
% impreuna cu o atenuare mai buna in zona de mare frecventa  (Silver 1)
% 
% Cebyshev : cel mai mare lob principal dintre toate ferestrele , care este
% insotit de lobi paraziti foarte foarte mici si restransi ; Atenuarea pare
% sa fie foarte mica dar mult mai buna decat Hamming (Gold 3)
% 
% Blackman : reprezinta un compromis intre  latimea si marimea lobului
% principal , deoarece prezinta o atenuare destul de buna pe toata banda de
% frecventa impreuna cu lobi paraziti de marime mica , mult mai buni decat
% Hanning (Gold 2)
% 
% Kaiser : lob principal perfect impreuna cu cei paraziti de lungime mica
% plus foarter restransi cu atenuare foarte buna pe toata banda de frecventa
% normalizata (Gold 1)



