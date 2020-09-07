function [u]=thomas(a,b,c,d)
l=length(b);
a=[0,a];c=[c,0];
e1=c(1)/b(1);f1=d(1)/b(1);
e=zeros(1,l);f=zeros(1,l);u=zeros(1,l);
e(1)=e1;f(1)=f1;

for i=2:l
    e(i)=c(i)/(b(i)-a(i)*e(i-1));
    f(i)=(d(i)+a(i)*f(i-1))/(b(i)-a(i)*e(i-1));
end
u(l)=f(l);
for i=l-1:-1:1
    u(i)=f(i)+e(i)*u(i+1);
end

end