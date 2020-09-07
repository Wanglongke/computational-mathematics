% five point difference scheme
% delat u = 2*(pi^2)*exp(pi*(x+y))*(sin(pi*x)cos(pi*y)+cos(pi*x)sin(pi*y)),
% (x,y) in (0,1)*(0,1)
% u = 0, x==0 || x==1 || y==0 || y==1

% parameters
h=1/64; % step size, 1/128
N=1/h;
x=0:h:1;y=0:h:1; %gridding
u_precise=zeros((N-1)*(N-1),1);
%% bulid equation set Au=f
dxx=-2*eye(N-1,N-1);
for i=1:N-2
    dxx(i,i+1)=1;
    dxx(i+1,i)=1;
end
I_x=eye(N-1,N-1);
Dxx=kron(I_x,(1/h^2)*dxx);
dyy=(1/h^2)*dxx;
I_y=eye(N-1,N-1);
Dyy=kron(dyy,I_y);
L1=Dxx;L2=Dyy;
A=Dxx+Dyy;
f=zeros((N-1)*(N-1),1);
for j=1:N-1
    for i=1:N-1
        f((j-1)*(N-1)+i)=2*(pi^2)*(exp(pi*(x(i+1)+y(j+1))))*(sin(pi*(x(i+1)+y(j+1))));
        u_precise((j-1)*(N-1)+i)=exp(pi*(x(i+1)+y(j+1)))*sin(pi*x(i+1))*sin(pi*y(j+1));
    end
end
%% solve the equation set
[u_c_g,k_cg]=conjugate_gradient(A,f);
omega=2/(1+(1-cos(pi*h))^(1/2));
[u_sor,k_sor]=sor(A,f,omega);
[u_pr,k_pr]=pr_p(L1,L2,f,h);
[u_prs,k_prs]=pr_one(L1,L2,f,h);



% error_cg=max(abs(u_c_g-u_precise));
E1=zeros(N-1);U1=E1;U2=U1;U3=U1;U4=U1;U5=U1;
for i=1:N-1
    E1(1:N-1,i)=u_precise((N-1)*(i-1)+1:(N-1)*i);
    U1(1:N-1,i)=u_c_g((N-1)*(i-1)+1:(N-1)*i);
    U3(1:N-1,i)=u_sor((N-1)*(i-1)+1:(N-1)*i);
    U4(1:N-1,i)=u_pr((N-1)*(i-1)+1:(N-1)*i);
    U5(1:N-1,i)=u_prs((N-1)*(i-1)+1:(N-1)*i);
end
e1=E1-U1;
e3=E1-U3;
e4=E1-U4;
e5=E1-U5;
[X,Y]=meshgrid(x(2:end-1),y(2:end-1));
figure(1)
mesh(X,Y,e1)
title(sprintf('conjugate gradient: numIter %d',k_cg))
figure(3)
mesh(X,Y,e3)
title(sprintf('sor: numIter %d',k_sor))
figure(4)
mesh(X,Y,e4)
title(sprintf('pr p: numIter %d',k_pr))
figure(5)
mesh(X,Y,e5)
title(sprintf('pr one: numIter %d',k_prs))
str1=sprintf('           conjugate gradient |  sor  | pr p | pr one');
str2=sprintf('iteration          %d           %d     %d        %d',k_cg,k_sor,k_pr,k_prs);
str3=sprintf('max error       %.6f      %.6f   %.6f   %.6f',max(max(e1)),...
    max(max(e3)),max(max(e4)),max(max(e5)));
fprintf([str1,'\n'...
        str2,'\n'...
        str3,'\n'])



