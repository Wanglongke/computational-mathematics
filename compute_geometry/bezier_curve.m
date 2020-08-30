% 参数
% Bezier_point=[0,0;1,3;5,3;6,0];   %控制顶点(0,0),（1,3), (5,3), (6,0)
Bezier_point=[0,0;1,3;5,3;6,0;10,1;8,2]; 
n=size(Bezier_point);
n=n(1,1)-1;   %次数
t=0:0.01:1;
t_tatget=0.3;
% color=['g','c'];   % de Castelijau 过程添加的新的控制多边形的颜色,n-1种颜色
color=['g','c','k','y'];
%% 上方为参数，改变参数可以实现不同次数的BEZIER曲线
% 构造基函数,离散;和Bezier曲线
Bn_i=zeros(n+1,length(t));
px_p=zeros(1,length(t));py_p=zeros(1,length(t));
for i=0:1:n
    Bn_i(i+1,:)=nchoosek(n,i).*(t.^i).*((1-t).^(n-i));
    px_p(1,:)=px_p(1,:)+Bezier_point(i+1,1)*Bn_i(i+1,:);
    py_p(1,:)=py_p(1,:)+Bezier_point(i+1,2)*Bn_i(i+1,:);
end
% 构造基函数，符号;和Bezier曲线
syms x
Bn_j=[];
px=0;py=0;
for i=0:1:n
    Bn_j=[Bn_j;nchoosek(n,i)*(x^i)*((1-x)^(n-i))];
    px=px+Bezier_point(i+1,1)*Bn_j(i+1);
    py=py+Bezier_point(i+1,2)*Bn_j(i+1);
end
% Bezier曲线上的目标点
target=zeros(1,2);
target(1,1)=subs(px,x,t_tatget);
target(1,2)=subs(py,x,t_tatget);
%画图
fig = figure(1);
% 建立坐标系
for i=1:n+1
    plot(Bezier_point(i,1),Bezier_point(i,2),'w*')
    hold on
end
pause(1)
% 画出控制顶点
for i=1:n+1
    plot(Bezier_point(i,1),Bezier_point(i,2),'r*')
    hold on
    pause(1)
end
% 画出控制多边形
for i=1:n
    line_i_x=linspace(Bezier_point(i,1),Bezier_point(i+1,1),100);
    line_i_y=linspace(Bezier_point(i,2),Bezier_point(i+1,2),100);
    plot(line_i_x,line_i_y,'r')
    hold on
    pause(1)
end
% 画出Bezier曲线
plot(px_p,py_p,'b')
hold on
pause(1)
% de Casteljau 过程
de_point=Bezier_point;
for i=0:1:(n-1)
    for j=1:1:(n-i)
        de_point(j,:)=(1-t_tatget)*de_point(j,:)+t_tatget*de_point(j+1,:);
        plot(de_point(j,1),de_point(j,2),'r*')
        hold on
        pause(1)
        if j>1
            de_line_i_x=linspace(de_point(j-1,1),de_point(j,1),100);
            de_line_i_y=linspace(de_point(j-1,2),de_point(j,2),100);
            plot(de_line_i_x,de_line_i_y,color(i+1))
            hold on 
            pause(1)
        end
    end
end
% 画出Bezier曲线上的目标点
plot(target(1,1),target(1,2),'bo')