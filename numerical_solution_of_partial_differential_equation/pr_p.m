function [x0,k] = pr_p(L1,L2,f,h)
A=L1+L2;
f=-f;
p=5;
a=sin(pi*h/2)^2;b=cos(pi*h/2)^2;
rho=(2^(1/2))-1;
tau_k=zeros(p,1);
for i=1:p
    tau_k(i)=((h^2)/(4*a))*(((1-rho)/(1+rho))^(2*i-1));
end
u0=ones(length(f),1);
t1=1;t2=1;
k=0;
I=eye(length(f));
while k<1000
    k=k+1;
    if mod(k,p)==0
        continue
    end
    i=mod(k,p);
    u1=((I-tau_k(i)*L1)\(I+tau_k(i)*L2))*u0+tau_k(i)*((I-tau_k(i)*L1)\f);    
    u2=((I-tau_k(i)*L2)\(I+tau_k(i)*L1))*u1+tau_k(i)*((I-tau_k(i)*L2)\f);
    %if t2<10^(-8)
    %    break
    %end
    if t1<10^(-4)
        break
    end
    t1=max(abs(A*u2+f));
    %t2=max(abs(u2-u0));
    u0=u2;
end
x0=u0;
end

