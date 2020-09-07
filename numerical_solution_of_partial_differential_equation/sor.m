function [x0,k]=sor(A,f,omega)
n=length(A);
D=diag(diag(A));
R=-triu(A,1);
L=-tril(A,-1);
u0=zeros(n,1);
tau1=1;tau2=1;
dlw=D-omega*L;
Aw=dlw\(omega*R+(1-omega)*D);
dlwf=dlw\f;
k=0;
while tau1>10^(-4)
    uk=Aw*u0+omega*dlwf;
    tau1=max(abs(A*uk-f));
    if tau2<10^(-4)
        break
    end
    tau2=max(abs(uk-u0));
    u0=uk;
    k=k+1;
end
x0=uk;
end