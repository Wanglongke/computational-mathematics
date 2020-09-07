function [x0,k] = conjugate_gradient(A,b)
% conjugate_gradient ¹²éîÌİ¶È·¨
%   A  coefficient matrix
%   x  variable
%   b  Ax=b
x0=zeros(length(b),1);
r0=b-A*x0;rk=r0;k=0;p0=r0;
while k<1000
    if rk<1e-4
        break
    else
        k=k+1;
        if k==1
            pk=r0;
        else
            beta0=(rk'*rk)/(r0'*r0);
            pk=rk+beta0*p0;
            r0=rk;
            p0=pk;
        end
        alpk=(rk'*rk)/(pk'*A*pk);
        x0=x0+alpk*pk;
        rk=rk-alpk*A*pk;
    end
end
end

