% -u'' + xu = (x-1)exp(x)
% u(0)=1, u(1)=exp(1)
%%
% paramete
h=0.01;
x=0:h:1;
u0=1;u_end=exp(1);

q_x=x;
f_x=(x-1).*exp(x);
u_precise=exp(x);               % exact solution
u_infer=zeros(1,length(x));     % numerical solution
u_infer(1)=u0;u_infer(length(x))=u_end;
% tridiagonal matrix
a=1/(h^2)*ones(1,length(x)-3);
c=a;
b=2/(h^2)*ones(1,length(x)-2)+q_x(2:end-1);
d=f_x(2:end-1);d(1)=d(1)+u0/(h^2);d(end)=d(end)+u_end/(h^2);
% thomas solution
u_infer(2:end-1)=thomas(a,b,c,d);
% figure
figure(1)
plot(x,u_precise,'r-o',x,u_infer,'g-*')
legend('Exact solution','Numerical solution')
figure(2)
plot(x,abs(u_precise - u_infer), 'r-.')
legend('Error')

