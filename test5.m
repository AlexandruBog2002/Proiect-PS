omega_p = 1.2702;
omega_s = 1.6985;
Delta_p = 4.0432;
Delta_s = Delta_p;
omega_c = 1.4972 ;



w=kaiser(23,1.965);
w=w/sum(w);

[h,Delta,Delta_pr,Delta_sr]=plotez_orice(23,w,omega_c/pi,omega_p,omega_s,1.4972);
h