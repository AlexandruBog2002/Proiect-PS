function [w]=Lanczos(M,L)

wLanczos=zeros(1,M);

for k=1:M
    wLanczos(1,k)=(sin(2*pi*(2*(k-1)-M+1)/(2*M-2))/(2*pi*(2*(k-1)-M+1)/(2*M-2)))^L;       
end

w=wLanczos/sum(wLanczos);

end