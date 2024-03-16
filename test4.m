omega_p = 1.2702;
omega_s = 1.6985;
Delta_p = 4.0432/100;
Delta_s = Delta_p;
% omega_c = 0.5*omega_p + 0.5*omega_s ;
for i=40:51
    
    omega_c= (i/100)*omega_p + (1-i/100)*omega_s 
    k=i
    
    
    % [bool,coef,Delta_pr,Delta_sr]=Kaiser2(23,1.89,omega_p,omega_s,omega_c);
    % if(Delta_pr < Delta_p && Delta_sr < Delta_s)
    % i
    % omega_c
    % Delta_sr
    % Delta_pr
    % end
end
