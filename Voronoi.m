P=[1,0,0;0,1,0;0,0,1];
Li=[1,0,0;0,1,1/2;0,0,1];
Fq=[1,0,1/2;0,1,1/2;0,0,1];
P=(P^(-1))';
Li=(Li^(-1))';
Fq=(Fq^(-1))';
n=10;
for i=1:2*n
    for j=1:2*n
        for k=1:2*n
            v_p(i,j,k,:)=P*([-1,-1,-1]+[i-1,j-1,k-1]/n)';
            v_li(i,j,k,:)=Li*([-1,-1,-1]+[i-1,j-1,k-1]/n)';
            v_fq(i,j,k,:)=Fq*([-1,-1,-1]+[i-1,j-1,k-1]/n)';
        end
    end
end
background=[[1 1 1 1 -1 -1 -1 -1;1 1 -1 -1 1 1 -1 -1;1 -1 1 -1 1 -1 1 -1],[1 0 0 -1 0 0;0 1 0 0 -1 0;0 0 1 0 0 -1],[1 1 0 -1 -1 0 1 1 0 -1 -1 0;1 0 1 1 0 -1 -1 0 1 -1 0 -1;0 1 1 0 1 1 0 -1 -1 0 -1 -1]];
figure(7);
scatter3(background(1,:),background(2,:),background(3,:),'blue');hold on;
scatter3(0,0,0,40,'red','filled');hold on;
for i=1:2*n
    for j=1:2*n
        for k=1:2*n
            f=0;
            for t=1:26
                d0=v_p(i,j,k,1)^2+v_p(i,j,k,2)^2+v_p(i,j,k,3)^2;
                d1=(background(1,t)-v_p(i,j,k,1))^2+(background(2,t)-v_p(i,j,k,2))^2+(background(3,t)-v_p(i,j,k,3))^2;
                if d0<=d1
                    f=f+1;
                end 
            end
            if f==26
                scatter3(v_p(i,j,k,1),v_p(i,j,k,2),v_p(i,j,k,3),20,'green');hold on;
            end
        end
    end
end

xlabel('fx');
ylabel('fy');
zlabel('ft');
hold off;
figure(8);
bg_li=Li*background;
scatter3(bg_li(1,:),bg_li(2,:),bg_li(3,:),'blue');hold on;
scatter3(0,0,0,40,'red','filled');hold on;
for i=1:2*n
    for j=1:2*n
        for k=1:2*n
            f=0;
            for t=1:26
                d0=v_li(i,j,k,1)^2+v_li(i,j,k,2)^2+v_li(i,j,k,3)^2;
                d1=(bg_li(1,t)-v_li(i,j,k,1))^2+(bg_li(2,t)-v_li(i,j,k,2))^2+(bg_li(3,t)-v_li(i,j,k,3))^2;
                if d0<=d1
                    f=f+1;
                end 
            end
            if f==26
                scatter3(v_li(i,j,k,1),v_li(i,j,k,2),v_li(i,j,k,3),20,'green');hold on;
            end
        end
    end
end

xlabel('fx');
ylabel('fy');
zlabel('ft');
hold off;
figure(9);
bg_fq=Fq*background;
scatter3(bg_fq(1,:),bg_fq(2,:),bg_fq(3,:),'blue');hold on;
scatter3(0,0,0,40,'red','filled');hold on;
for i=1:2*n
    for j=1:2*n
        for k=1:2*n
            f=0;
            for t=1:26
                d0=v_fq(i,j,k,1)^2+v_fq(i,j,k,2)^2+v_fq(i,j,k,3)^2;
                d1=(bg_fq(1,t)-v_fq(i,j,k,1))^2+(bg_fq(2,t)-v_fq(i,j,k,2))^2+(bg_fq(3,t)-v_fq(i,j,k,3))^2;
                if d0<=d1
                    f=f+1;
                end 
            end
            if f==26
                scatter3(v_fq(i,j,k,1),v_fq(i,j,k,2),v_fq(i,j,k,3),20,'green');hold on;
            end
        end
    end
end

xlabel('fx');
ylabel('fy');
zlabel('ft');
hold off;