%处理FDTD仿真目标点附近二维平面电场数据

load Ez_2D
%%
[Lx_1,Ly_1,Lz_1,n_1] = size(Ez_2D_1);
[Lx_2,Ly_2,Lz_2,n_2] = size(Ez_2D_2);

x_1 = Ez_2D_1(:,1,1,1)';
y_1 = Ez_2D_1(1,:,1,1)';

x_2 = Ez_2D_2(:,1,1,1)';
y_2 = Ez_2D_2(1,:,1,1)';

%M_1,M_2为采样点（x，y）对于的Ez（整个仿真时间）最大值
for i=1:Lx_1
    for k = 1:Ly_1
        M_1(i,k) = max(Ez_2D_1(i,k,1,:));
    end
end

for i=1:Lx_2
    for k = 1:Ly_2
        M_2(i,k) = max(Ez_2D_2(i,k,1,:));
    end
end

%绘制场强图

[X_1,Y_1] = meshgrid(x_1,y_1);
[X_2,Y_2] = meshgrid(x_2,y_2);

M_1 = M_1';
figure(1)
contourf(X_1,Y_1,M_1)

M_2 = M_2';
figure(2)
contourf(X_2,Y_2,M_2)

%% 绘制目标点场强最大值t时参考平面的场强
load Ez_tr_1.mat
[Max,t] = max(Ez_tr_1); 
D_1 = Ez_2D_1(:,:,1,t)';
figure(3)
contourf(X_1,Y_1,D_1)

load Ez_tr_2.mat
[Max,t] = max(Ez_tr_1); 
D_2 = Ez_2D_2(:,:,1,t)';
figure(4)
contourf(X_2,Y_2,D_2)

