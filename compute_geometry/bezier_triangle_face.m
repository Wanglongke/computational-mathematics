% 参数
n=4;        % 次数
Bezier_point1=[0,0,0;1,1,1;-1,1,1;1.5,1.5,3;0,1.5,3;
    -1.5,1.5,3;2.5,2.5,3.5;1.5,2.5,3.5;-1.5,2.5,3.5;-2.5,2.5,3.5;
    5,5,3.5;3,5,7;0,5,8;-3,5,7;-5,5,3.5];
Bezier_point2=[0,10,0;1,9,1;-1,9,1;1.5,8.5,3;0,8.5,3;
    -1.5,8.5,3;5.5,7.5,7;1.5,7.5,11.5;-1.5,7.5,11.5;-5.5,7.5,7;
    5,5,3.5;3,5,7;0,5,8;-3,5,7;-5,5,3.5];
size_B=size(Bezier_point1);
color=['r' 'k';'b' 'g'];
%%
%控制多边形
for b_p=1:2
    if b_p==1
        Bezier_point=Bezier_point1;
    else
        Bezier_point=Bezier_point2;
    end
iter=0;
domain_point=zeros(size_B);
for i=n:-1:0
    for j=(n-i):-1:0
        k=n-i-j;
        iter=iter+1;
        plot3(Bezier_point(iter,1),Bezier_point(iter,2),Bezier_point(iter,3),strcat(color(b_p,2),'*'))
        hold on
        domain_point(iter,:)=[i,j,k];
        if iter>=2
            for line=1:iter-1
                point_sub=domain_point(iter,:)-domain_point(line,:);
                count=0;
                for p=1:3
                    if abs(point_sub(p))<=1
                       count=count+1;
                    end
                end
                if count==3 
                    line_x=linspace(Bezier_point(line,1),Bezier_point(iter,1));
                    line_y=linspace(Bezier_point(line,2),Bezier_point(iter,2));
                    line_z=linspace(Bezier_point(line,3),Bezier_point(iter,3));
                    plot3(line_x,line_y,line_z,color(b_p,2))
                    hold on
                end
            end
        end
    end
end
%Bezier 曲面
%Bn_i_j=[];
point_x=0;
point_y=0;
point_z=0;
iter=0;
uu=linspace(0,1,101);
vv=linspace(0,1,101);
[u,v]=meshgrid(uu,vv);
w=1-u-v;
w(u+v>1)=nan;
% syms u v w
for i=n:-1:0
    for j=(n-i):-1:0
        k=n-i-j;
        iter=iter+1;
        %Bn_i_j=[Bn_i_j;(factorial(n)/(factorial(i)*factorial(j)*factorial(k))).*(u.^i)*(v.^j)*(w.^k)];
        Bn_i_j=(factorial(n)/(factorial(i)*factorial(j)*factorial(k))).*(u.^i).*(v.^j).*(w.^k);
        % Bn_i_j
        point_x=point_x+Bezier_point(iter,1).*Bn_i_j;
        point_y=point_y+Bezier_point(iter,2).*Bn_i_j;
        point_z=point_z+Bezier_point(iter,3).*Bn_i_j;
        %point_x
    end
end
surface(point_x,point_y,point_z,'FaceColor',color(b_p,1),'EdgeColor','none');
view(100,10)
end
% view(90,10)