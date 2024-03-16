function pondere_orice(M,w,omega_c)

% aceasta rutina calculeaza raspunsul la impuls al oricarui filtru  si o
 % ploteaza

 % introducerea de parametri anomalici duce la eroare de calculare si
 % plotare
 
n=0:M-1;

freq_c=omega_c/pi;
h = fir1(M-1,freq_c,w);
stem(n,h);

end