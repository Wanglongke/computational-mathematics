% 参数
h=0.1;  % 0.5, 1
t_max=2;t_min=0;
t=t_min:h:t_max;
u0=1;
% 精确解
u_precise=(1+t.^2).^2;
u_numerical=zeros(1,size(t,2));
u_numerical(1)=u0;
% Runge_Kutta
for i=2:1:size(t,2)
    k1=4*t(i-1)*(u_numerical(i-1)^(1/2));
    k2=4*(t(i-1)+0.5*h)*((u_numerical(i-1)+0.5*h*k1)^(1/2));
    k3=4*(t(i-1)+0.5*h)*((u_numerical(i-1)+0.5*h*k2)^(1/2));
    k4=4*(t(i-1)+h)*((u_numerical(i-1)+h*k3)^(1/2));
    u_numerical(i)=u_numerical(i-1)+((h/6)*(k1+2*k2+2*k3+k4));
end
% 画图
figure(1)
plot(t,u_precise,'r-*',t,u_numerical,'k-o')
legend('precise value','numerical value')
figure(2)
plot(t,abs(u_precise-u_numerical),'r-.')
legend('error')

