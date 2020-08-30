clear
clc
%% 参数
U=[0,0,0,0,0.2,0.4,0.4,0.6,0.8,0.8,0.8,1,1,1,1];
num_node=length(U);    % 节点数
n=3;    % B样条次数
num_control_vt=num_node-n-1;    % 控制顶点数
control_vt2D=[0 0;1 2;2 1;3 2.5;5 -1;7 -1;7 1;9 1;9 -1;10 1;11 -1];    % 平面控制顶点
control_vt3D=[0 0 0;1 0 0.5;1 1 1;0 1 1.5;0 0 2;1 0 2.5;1 1 3;0 1 3.5;0 0 4;1 0 4.5;1 1 5];       % 空间控制顶点
color=colormap(jet(14));     % 颜色
%% 
% 构造B样条基函数
lins=1001;
t=linspace(0,1,1001);
U_index=U.*(lins-1)+1;
figure(1)
for i=1:1:(num_node-1)
    %u=0;
    N(i,1,:)=linspace(0,0,lins);
    N(i,1,U_index(i):U_index(i+1))=1;
    N(i,1,U_index(i+1))=0;
    u(:)=N(i,1,:);
    plot(t,u,'color',color(i,:))
    title('0次B样条基函数')
    pause(1)
    hold on
end
for p=2:(n+1)
    figure(p)
    for i=1:1:(num_node-1-(p-1))
        for t_index=1:1:lins
            if U(i+p-1)-U(i)==0
                coef(1)=0;
            else
                coef(1)=((t(t_index)-U(i))/(U(i+p-1)-U(i)));
            end
            if U(i+p)-U(i+1)==0
                coef(2)=0;
            else
                coef(2)=((U(i+p)-t(t_index))/(U(i+p)-U(i+1)));
            end
            N(i,p,t_index)=coef(1)*N(i,p-1,t_index)+coef(2)*N(i+1,p-1,t_index);
        end
        u(:)=N(i,p,:);
        plot(t,u,'color',color(i,:))
        title_name=strcat(num2str(p-1),'次B样条基函数');
        title(title_name)
        pause(1)
        hold on
    end
end
%% 平面B样条
% 画控制多边形
figure(p+1);
for i=1:1:num_control_vt
    plot(control_vt2D(i,1),control_vt2D(i,2),'r.')
    hold on
    if i>=2
        control_line_x=linspace(control_vt2D(i-1,1),control_vt2D(i,1),100);
        control_line_y=linspace(control_vt2D(i-1,2),control_vt2D(i,2),100);
        plot(control_line_x,control_line_y,'c')
        pause(1)
        hold on
    end
end
% 画B样条曲线
p_x=0;
p_y=0;
for i=1:num_control_vt
    N_i(:)=N(i,n+1,U_index(n+1):U_index(num_node-n)-1);
    p_x=p_x+control_vt2D(i,1).*N_i;
    p_y=p_y+control_vt2D(i,2).*N_i;
end
plot(p_x,p_y,'y')
pause(1)
%% 空间B样条
% 画控制多边形
figure(p+2);
for i=1:1:num_control_vt
    plot3(control_vt3D(i,1),control_vt3D(i,2),control_vt3D(i,3),'r.')
    hold on
    if i>=2
        control_line_x=linspace(control_vt3D(i-1,1),control_vt3D(i,1),100);
        control_line_y=linspace(control_vt3D(i-1,2),control_vt3D(i,2),100);
        control_line_z=linspace(control_vt3D(i-1,3),control_vt3D(i,3),100);
        plot3(control_line_x,control_line_y,control_line_z,'c')
        pause(1)
        hold on
    end
end
% 画B样条曲线
p_x=0;
p_y=0;
p_z=0;
for i=1:num_control_vt
    N_i(:)=N(i,n+1,U_index(n+1):U_index(num_node-n)-1);
    p_x=p_x+control_vt3D(i,1).*N_i;
    p_y=p_y+control_vt3D(i,2).*N_i;
    p_z=p_z+control_vt3D(i,3).*N_i;
end
plot3(p_x,p_y,p_z,'y')
