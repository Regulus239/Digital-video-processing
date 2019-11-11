P=[1,0,0;0,1,0;0,0,1];
Li=[1,0,0;0,1,1/2;0,0,1];
Fq=[1,0,1/2;0,1,1/2;0,0,1];

figure(1);
for t = 1:10
    c=[1/9*(t-1) 1-1/9*(t-1) 0];
    for x = 1:10
        for y = 1:10
            p(x,y,t,:)=P*[x-1,y-1,t-1]';
            scatter3(p(x,y,t,1),p(x,y,t,2),p(x,y,t,3),25,c);hold on;
        end
    end
    
end
xlabel('x');
ylabel('y');
zlabel('t');
view(-45,85);
title('progressive sampling lattice');
hold off;

figure(2);
for t = 1:10
    c=[1/9*(t-1) 1-1/9*(t-1) 0];
    for x = 1:10
        for y = 1:10
            li(x,y,t,:)=Li*[x-1,y-1,t-1]';
            scatter3(li(x,y,t,1),li(x,y,t,2),li(x,y,t,3),25,c);hold on;
        end
    end
    
end
xlabel('x');
ylabel('y');
zlabel('t');
view(-45,85);
title('line-interlaced sampling lattice');
hold off;

figure(3);
for t = 1:10
    c=[1/9*(t-1) 1-1/9*(t-1) 0];
    for x = 1:10
        for y = 1:10
            fq(x,y,t,:)=Fq*[x-1,y-1,t-1]';
            scatter3(fq(x,y,t,1),fq(x,y,t,2),fq(x,y,t,3),25,c);hold on;
        end
    end
end
xlabel('x');
ylabel('y');
zlabel('t');
view(-45,85);
title('field-quincunx sampling lattice');
hold off;


figure(4);
for t = 1:10
    c=[1/9*(t-1) 1-1/9*(t-1) 0];
    for x = 1:10
        for y = 1:10
            p(x,y,t,:)=(P^(-1))'*[x-1,y-1,t-1]';
            scatter3(p(x,y,t,1),p(x,y,t,2),p(x,y,t,3),25,c);hold on;
        end
    end
    
end
xlabel('fx');
ylabel('fy');
zlabel('ft');
view(-47,2.5);
title('progressive sampling recicrocal lattice');
hold off;

figure(5);
for t = 1:10
    c=[1/9*(t-1) 1-1/9*(t-1) 0];
    for x = 1:10
        for y = 1:10
            li(x,y,t,:)=(Li^(-1))'*[x-1,y-1,t-1]';
            scatter3(li(x,y,t,1),li(x,y,t,2),li(x,y,t,3),25,c);hold on;
        end
    end
    
end
xlabel('fx');
ylabel('fy');
zlabel('ft');
view(-47,2.5);
title('line-interlaced sampling reciprocal lattice');
hold off;

figure(6);
for t = 1:10
    c=[1/9*(t-1) 1-1/9*(t-1) 0];
    for x = 1:10
        for y = 1:10
            fq(x,y,t,:)=(Fq^(-1))'*[x-1,y-1,t-1]';
            scatter3(fq(x,y,t,1),fq(x,y,t,2),fq(x,y,t,3),25,c);hold on;
        end
    end
end
xlabel('fx');
ylabel('fy');
zlabel('ft');
view(-47,2.5);
title('field-quincunx sampling reciprocal lattice');
hold off;
