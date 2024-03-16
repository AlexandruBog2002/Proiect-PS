function pondere(M,freq_c)

 % aceasta rutina calculeaza raspunsul la impuls al filtrului cebisev si o
 % ploteaza

 % introducerea de parametri anomalici duce la eroare de calculare si
 % plotare
r2=91.8108;        
n=0:M-1;
w=chebwin(M,r2);                                                               
w=w/sum(w);
h = fir1(M-1,freq_c,w);
stem(n,h);

end