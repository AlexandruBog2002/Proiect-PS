
omega_p = 1.2702;
omega_s = 1.6985;
Delta_p = 4.0432/100;
Delta_s = Delta_p;
omega_c = 0.5*omega_p + 0.5*omega_s ;
freq_c = omega_c/pi;
r=86.8108;
Delta_pr=100;
Delta_sr=Delta_pr;
bool=0;
amd=0;
dam=0;

% In urma testelor am ajuns la concluzia ca ordinea celor mai bune filtre
% sunt
% 1. Kaiser [M=23 beta=1.965]          GOLD   1       
% 2. Cebyshev [M=23 r=20.98]           SILVER 2        
% 3. Tuckey [M=32 alfa=86.5%]          BRONZE 3
% 4. Hanning [M=36]                   
% 5. Hamming [M=37]                  
% 6. Lanczos [M=40 L=1]              
% 7. Blackman [M=48]                 
% 8. Dreptunghiulara [M=66]           
% 9. Triunghiulara [M=76]    
%M 0.2 omega 0.3 Hid 0.5

%92-93

% figure(19)
% 
% set(gcf,'units','pixels','position',[0,0,768,768]);
% w=kaiser(23,1.965);
% w=w/sum(w);
% [Delta,Delta_pr,Delta_sr]=plotez_orice(23,w,freq_c,omega_p,omega_s,1.4972);
% title('Kaiser','[ M = 23 , beta = 1.89 , omega_c = 1.4972 ]');
% xlabel('Banda de frecventa normalizata');
% ylabel('Amplitudine GOLD dB');

% w=chebwin(23,20.98);
% w=w/sum(w);
% subplot(3,3,2)
% [Delta,Delta_pr,Delta_sr]=plotez_orice(23,w,freq_c,omega_p,omega_s, 1.4929);
% title('Cebyshev','[ M = 23 , r = 20.98 , omega_c = 1.4929 ]');
% xlabel('Banda de frecventa normalizata');
% ylabel('Amplitudine SILVER dB');
% 
% w=tukeywin(32,0.865);
% w=w/sum(w);
% subplot(3,3,3)
% [Delta,Delta_pr,Delta_sr]=plotez_orice(32,w,freq_c,omega_p,omega_s, 1.4844);
% title('Tuckey','[ M = 32 , alfa = 0.865 , omega_c = 1.4844 ]');
% xlabel('Banda de frecventa normalizata');
% ylabel('Amplitudine BRONZE dB');
% 
% w=kaiser(23,1.965);
% w=w/sum(w);
% subplot(3,3,4)
% faza_orice(23,w,omega_p,omega_s,1.4972);
% title('Kaiser','[ M = 23 , beta = 1.89 , omega_c = 1.4972 ]');
% xlabel('Banda de frecventa normalizata');
% ylabel('Amplitudine GOLD dB');
% 
% w=chebwin(23,21.98);
% w=w/sum(w);
% subplot(3,3,5)
% faza_orice(23,w,omega_p,omega_s,1.4929);
% title('Cebyshev','[ M = 23 , r = 20.98 , omega_c = 1.4929 ]');
% xlabel('Banda de frecventa normalizata');
% ylabel('Amplitudine SILVER dB');
% 
% w=tukeywin(32,0.865);
% w=w/sum(w);
% subplot(3,3,6)
% faza_orice(32,w,omega_p,omega_s,1.4844);
% title('Tuckey','[ M = 32 , alfa = 0.865 , omega_c = 1.4844 ]');
% xlabel('Banda de frecventa normalizata');
% ylabel('Amplitudine BRONZE dB');
% 
% w=kaiser(23,1.965);
% w=w/sum(w);
% subplot(3,3,7)
% pondere_orice(23,w,1.4972);
% title('Kaiser','[ M = 23 , beta = 1.89 , omega_c = 1.4972 ]');
% xlabel('Ordinul filtrului');
% ylabel('Amplitudine GOLD dB');
% 
% w=chebwin(23,21.98);
% w=w/sum(w);
% subplot(3,3,8)
% pondere_orice(23,w,1.4929);
% title('Cebyshev','[ M = 23 , r = 20.98 , omega_c = 1.4929 ]');
% xlabel('Ordinul filtrului');
% ylabel('Amplitudine SILVER dB');
% 
% w=tukeywin(32,0.865);
% w=w/sum(w);
% subplot(3,3,9)
% pondere_orice(32,w,1.4844);
% title('Tuckey','[ M = 32 , alfa = 0.865 , omega_c = 1.4844 ]');
% xlabel('Ordinul filtrului');
% ylabel('Amplitudine BRONZE dB');
% 
% 
% % w=hanning(36);
% % w=w/sum(w);
% % subplot(3,3,4)
% % [~,Delta_pr,Delta_sr]=plotez_orice(36,w,freq_c,omega_p,omega_s,omega_c);
% % 
% % w=hamming(37);
% % w=w/sum(w);
% % subplot(3,3,5)
% % [~,Delta_pr,Delta_sr]=plotez_orice(37,w,freq_c,omega_p,omega_s,omega_c);
% % 
% % [w]=Lanczos(40,1);
% % w=w/sum(w);
% % subplot(3,3,6)
% % [~,Delta_pr,Delta_sr]=plotez_orice(40,w,freq_c,omega_p,omega_s,omega_c);
% % 
% % w=blackman(48);
% % w=w/sum(w);
% % subplot(3,3,7)
% % [~,Delta_pr,Delta_sr]=plotez_orice(48,w,freq_c,omega_p,omega_s,omega_c);
% % 
% % w=boxcar(66);
% % w=w/sum(w);
% % subplot(3,3,8)
% % [~,Delta_pr,Delta_sr]=plotez_orice(66,w,freq_c,omega_p,omega_s,omega_c);
% % 
% % w=triang(76);
% % w=w/sum(w);
% % subplot(3,3,9)
% % [~,Delta_pr,Delta_sr]=plotez_orice(76,w,freq_c,omega_p,omega_s,omega_c);
% % 
% % for r= 20:0.005:22
% %   while (Delta_pr > Delta_p && Delta_sr > Delta_s) 
% % 
% %     for i=2:100
% %       k=i;
% %          for p=0.40:0.01:0.60
% %           omega_c = p*omega_p + (1-p)*omega_s;
% %          [bool,coef,Delta_pr,Delta_sr]=Cebasev(k,r,omega_p,omega_s,omega_c);
% %          Delta=Delta_pr+Delta_sr;
% %          if(bool==1)
% %              break
% %          end
% %          end
% %           if(bool==1)
% %              break
% %          end
% %     end
% %      if(bool==1)
% %              break
% %        end
% %   end
% %   disp('M');disp(coef);
% %   disp('r');disp(r);
% %   disp('Delta');disp(Delta);
% %   Delta_pr = 100;
% %   Delta_sr = 100;
% %   disp('s-a terminat r-ul');
% % end
% 
% Delta=zeros(1,10000);
% L=1;
% for r= 1.85:0.005:2.15
%   while (Delta_pr > Delta_p && Delta_sr > Delta_s) 
% 
%     for i=2:100
%       k=i;
%         for p=0.40:0.01:0.60
%           omega_c = p*omega_p + (1-p)*omega_s;
%          [y1,y2,y3,bool,coef,a,b]=Kaiser2(k,r,omega_p,omega_s,omega_c);
%          if(a~= 0 && b~=0)
%          Delta(1,L)=a+b;
%          L=L+1;
%          end
%          if(bool==1)
%          disp("y1");disp(y1);
%          disp("y2");disp(y2);
%          disp("y3");disp(y3);
%          end
%          if(bool==1)
%              break
%          end
%         end
%         if(bool==1)
%              break
%          end
%     end
%      if(bool==1)
%              break
%        end
%   end
  % disp('M');disp(coef);
  % disp('r');disp(r);
   % disp('Delta');disp(Delta);
%   Delta_pr = 100;
%   Delta_sr = 100;
%   disp('s-a terminat r-ul');
% end

% % for r= 0.70:0.005:1
% %   while (Delta_pr > Delta_p && Delta_sr > Delta_s) 
% % 
% %     for i=3:100
% %       k=i;
% %       for p=0.40:0.01:0.60
% %           omega_c = p*omega_p + (1-p)*omega_s;
% %          [bool,coef,Delta_pr,Delta_sr]=Tuckey2(k,r,omega_p,omega_s,omega_c);
% %          Delta=Delta_sr+Delta_pr;
% %          if(bool==1)
% %              break
% %          end
% %       end
% %        if(bool==1)
% %              break
% %          end
% %     end
% %      if(bool==1)
% %              break
% %        end
% %   end
% %   disp('M');disp(coef);
% %   disp('r');disp(r);
% %   disp('Delta');disp(Delta);
% %   Delta_pr = 100;
% %   Delta_sr = 100;
% %   disp('s-a terminat r-ul');
% % end
% 
% % for r= 1:0.05:4
% %   while (Delta_pr > Delta_p && Delta_sr > Delta_s) 
% % 
% %     for i=40:100
% %       k=i;
% %          [bool,coef,Delta_pr,Delta_sr]=Lanczos2(k,r,omega_p,omega_s,omega_c);
% %          if(bool==1)
% %              break
% %          end
% %     end
% %      if(bool==1)
% %              break
% %        end
% %   end
% %   disp('M');disp(coef);
% %   disp('r');disp(r);
% %   Delta_pr = 100;
% %   Delta_sr = 100;
% %   disp('s-a terminat r-ul');
% % end
% 
%   %   for i=3:100
%   %     k=i;
%   %        [bool,coef,Delta_pr,Delta_sr]=Blackman2(k,omega_p,omega_s,omega_c);
%   %        if(bool==1)
%   %            break
%   %        end
%   %   end
%   % disp('M');disp(coef);
%   % disp('s-a terminat r-ul');
% 
%   % for i=3:100
%   %     k=i;
%   %        [bool,coef,Delta_pr,Delta_sr]=Hanning2(k,omega_p,omega_s,omega_c);
%   %        if(bool==1)
%   %            break
%   %        end
%   %   end
%   % disp('M');disp(coef);
%   % disp('s-a terminat r-ul');
% 
%   %   for i=3:100
%   %     k=i;
%   %        [bool,coef,Delta_pr,Delta_sr]=Boxcar2(k,omega_p,omega_s,omega_c);
%   %        if(bool==1)
%   %            break
%   %        end
%   %   end
%   % disp('M');disp(coef);
%   % disp('s-a terminat r-ul');
% 
%   %   for i=3:100
%   %     k=i;
%   %        [bool,coef,Delta_pr,Delta_sr]=Triang2(k,omega_p,omega_s,omega_c);
%   %        if(bool==1)
%   %            break
%   %        end
%   %   end
%   % disp('M');disp(coef);
%   % disp('s-a terminat r-ul');
% 
% 
%   %   for i=3:100
%   %     k=i;
%   %        [bool,coef,Delta_pr,Delta_sr]=Hamming2(k,omega_p,omega_s,omega_c);
%   %        if(bool==1)
%   %            break
%   %        end
%   %   end
%   % disp('M');disp(coef);
%   % disp('s-a terminat r-ul');
% 
% % w=chebwin(M,20.62);                                                               
% % w=w/sum(w);
% % h = fir1(M-1,freq_c,w);
% % [Delta_pr,Delta_sr]=Faza_3_PR(h,omega_p,omega_s);
% % Delta=Delta_pr+Delta_sr;
% % 
% % w=kaiser(M,1.8900);                                                               
% % w=w/sum(w);
% % h = fir1(M-1,freq_c,w);
% % [Delta_pr,Delta_sr]=Faza_3_PR(h,omega_p,omega_s);
% % Delta=Delta_pr+Delta_sr;
% 
% 
