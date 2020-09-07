function [x0,k] = pr_one(L1,L2,f,h)
A=L1+L2;
f=-f;
tau_opt=(1/2)*(h^2)*(1/sin(pi*h));
u0=ones(length(f),1);
t1=1;t2=1;
k=0;
I=eye(length(f));
l1=(I-tau_opt*L1)\(I+tau_opt*L2);
l11=tau_opt*((I-tau_opt*L1)\f);
l3=(I-tau_opt*L2)\(I+tau_opt*L1);
l33=tau_opt*((I-tau_opt*L2)\f);
while k<1000
    k=k+1;
    u1=l1*u0+l11;
    u2=l3*u1+l33;
    if t2<10^(-6)
        break
    end
    if t1<10^(-4)
        break
    end
    t1=max(abs(A*u2+f));
    t2=max(abs(u2-u0));
    u0=u2;
end
x0=u0;
end

