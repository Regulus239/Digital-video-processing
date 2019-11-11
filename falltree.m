fall_k=double(imread("/Users/valquiria/Desktop/EC720/ps3images/Fall_trees_0.tiff"));
fall_l=double(imread("/Users/valquiria/Desktop/EC720/ps3images/Fall_trees_2.tiff"));
var=2;
Ix=zeros(72,88);
Iy=zeros(72,88);
It=double(fall_l-fall_k);
t1=cputime;

for i=1:72
    for j=1:88
        if i~=72
            Ix(i,j)=fall_k(i+1,j)-fall_k(i,j);
        end
        if j~=88
            Iy(i,j)=fall_k(i,j+1)-fall_k(i,j);
        end
    end
end
iter=200;
val_f=zeros(1,iter);
l=100;
u=zeros(72,88);
u_bar=zeros(72,88);
v=zeros(72,88);
v_bar=zeros(72,88);
nei=[1,0;0,1;-1,0;0,-1];
error=zeros(1,iter);
figure(1);
for k=1:iter
    e=0.0;
    for i=1:72
        for j=1:88
            u(i,j)=u_bar(i,j)-((Ix(i,j)*u_bar(i,j)+Iy(i,j)*v_bar(i,j)+It(i,j))/(8*l+Ix(i,j)^2+Iy(i,j)^2))*Ix(i,j);
            v(i,j)=v_bar(i,j)-((Ix(i,j)*u_bar(i,j)+Iy(i,j)*v_bar(i,j)+It(i,j))/(8*l+Ix(i,j)^2+Iy(i,j)^2))*Iy(i,j);
            e=e+(Ix(i,j)*u(i,j)+Iy(i,j)*v(i,j)+It(i,j))^2;
            if i~=1
                e=e+l*((u(i,j)-u(i-1,j))^2+(v(i,j)-v(i-1,j))^2);
            end
            if j~=1
                e=e+l*((u(i,j)-u(i,j-1))^2+(v(i,j)-v(i,j-1))^2);
            end
        end
    end
    error(k)=e;
    for i=1:72
        for j=1:88
            valid=0;
            sum_u=0.0;
            sum_v=0.0;
            for q=1:4
                if 1<=i+nei(q,1) && i+nei(q,1)<=72 && 1<=j+nei(q,2) && j+nei(q,2)<=88
                    valid=valid+1;
                    sum_u=sum_u+u(i+nei(q,1),j+nei(q,2));
                    sum_v=sum_v+v(i+nei(q,1),j+nei(q,2));
                end
            end
            u_bar(i,j)=sum_u/valid;
            v_bar(i,j)=sum_v/valid;
        end
    end
    va=0;
    for i=1:72
        for j=1:88
            va=va+(u(i,j)-var)*(u(i,j)-var)+(v(i,j)-var)*(v(i,j)-var);
        end
    end
    val_f(k)=va;
    if k==50
        subplot(2,2,1);
        quiver(u(72:-1:1,:),v(72:-1:1,:));
        title(k);
    end
    if k==100
        subplot(2,2,2);
        quiver(u(72:-1:1,:),v(72:-1:1,:));
        title(k);
    end
    if k==150
        subplot(2,2,3);
        quiver(u(72:-1:1,:),v(72:-1:1,:));
        title(k);
    end
    if k==200
        subplot(2,2,4);
        quiver(u(72:-1:1,:),v(72:-1:1,:));
        title(k);
    end
end
fall=zeros(72,88);
for i=1:72
    for j=1:88
        z=[min(72,max(1,floor(i-u(i,j)))),max(1,min(72,ceil(i-u(i,j)))),min(88,max(1,floor(j-v(i,j)))),max(1,min(88,ceil(j-v(i,j))))];     
        du=mod(i-u(i,j),1);
        dv=mod(j-v(i,j),1);
        fall(i,j)=fall_l(i,j)-(fall_k(z(1),z(3))*(1-du)*(1-dv)+fall_k(z(1),z(4))*(1-du)*dv+fall_k(z(2),z(3))*du*(1-dv)+fall_k(z(2),z(4))*du*dv);
    end
end

figure(2);
subplot(2,2,1);
imshow(uint8(abs(fall_l-fall_k)));
title('initial error');
subplot(2,2,2);
imshow(uint8(abs(fall)));
title('final error');
subplot(2,2,3);
plot(1:iter,error,'o');
title('energy');
subplot(2,2,4);
plot(1:iter,val_f,'o');
title('mse error')

%quiver(u,v);
t2=cputime;
t2-t1


