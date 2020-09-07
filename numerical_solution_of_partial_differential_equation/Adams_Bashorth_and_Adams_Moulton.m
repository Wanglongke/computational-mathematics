%% 参数
h=0.005; % 或者 h=0.05
t0=0;t1=1; % t的取值范围
u0=1; % 初值
t=0:h:1;
E=exp(-5*t); % 精确解
%% 求解方法
% Euler method
N=(t1-t0)/h;
U_euler=zeros(1,N+1);
U_euler(1)=1;
for n=1:1:N
    U_euler(n+1)=U_euler(n)+h*(-5*U_euler(n));
end
error_euler=abs(U_euler-E);
% third Adams 外插
U_out_adams=zeros(1,N+1);
U_out_adams(1:4)=E(1:4);
for n=4:1:N
    U_out_adams(n+1)=U_out_adams(n)+(h/24)*(55*(-5*U_out_adams(n))-59*(-5*U_out_adams(n-1))+37*(-5*U_out_adams(n-2))-9*(-5*U_out_adams(n-3)));
end
error_out_third_adams=abs(U_out_adams-E);
% third Adams 内插
U_in_adams=zeros(1,N+1);
U_in_adams(1:3)=E(1:3);
for n=3:1:N
    error_u=1;
    while error_u > 0.0000001
        uk=-5*U_in_adams(n+1);
        U_in_adams(n+1)=U_in_adams(n)+(h/24)*(9*(-5*U_in_adams(n+1))+19*(-5*U_in_adams(n))-5*(-5*U_in_adams(n-1))+(-5*U_in_adams(n-2)));
        uk1=-5*U_in_adams(n+1);
        error_u=abs(uk1-uk);
    end
end
error_in_third_adams=abs(U_in_adams-E);
%% 画图
figure(1)
plot(t,E,'r-*',t,U_euler,'g-o',t,U_out_adams,'b-x',t,U_in_adams,'y-+')
legend('Exact solution','Euler method','Adams Bashorth','Adams Moulton')
figure(2)
plot(t,error_euler,'g-o',t,error_out_third_adams,'b-x',t,error_in_third_adams,'y-+')
legend('error Euler','error Adams Bashorth','error Adams Moulton')
%% 误差表格
f=figure('Position',[100 100 400 150]);
error=[error_euler(N+1),error_out_third_adams(N+1),error_in_third_adams(N+1)];
cnames={'Euler Method','Adams Bashorth','Adams Moulton'};
rnames={'error'};
table=uitable(f,'Data',error,...
                'ColumnName',cnames,...
                'RowName',rnames);
table.Position(3)=table.Extent(3);
table.Position(4)=table.Extent(4);

