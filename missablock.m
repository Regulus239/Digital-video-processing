mis_k=double(imread("/Users/valquiria/Desktop/EC720/ps3images/missa_80.tiff"));
mis_l=double(imread("/Users/valquiria/Desktop/EC720/ps3images/missa_84.tiff"));
comparedshift=2;
sum_mis=zeros(288,352);
sum_mis_2=zeros(288,352);
mis_abs_shift=zeros(288,352,2*comparedshift+1,2*comparedshift+1)-1;
mis_abs_shift_2=zeros(288,352,2*comparedshift+1,2*comparedshift+1)-1;
mis_shift=zeros(288,352,2);
mis_shift_2=zeros(288,352,2);
mis_e=zeros(288,352);
mis_e_2=zeros(288,352);
halfblocksize=8;
t1=cputime;
for i=-comparedshift:comparedshift
    for j=-comparedshift:comparedshift
        k=[max(1,1+i),min(288,288+i),max(1,1+j),min(352,352+j)];
        l=[max(1,1-i),min(288,288-i),max(1,1-j),min(352,352-j)];
        sum_mis(l(1):l(2),l(3):l(4))=abs(mis_l(l(1):l(2),l(3):l(4))-mis_k(k(1):k(2),k(3):k(4)));
        sum_mis_2(l(1):l(2),l(3):l(4))=(mis_l(l(1):l(2),l(3):l(4))-mis_k(k(1):k(2),k(3):k(4))).*(mis_l(l(1):l(2),l(3):l(4))-mis_k(k(1):k(2),k(3):k(4)));
        for u=l(1):l(2)
            for v=l(3):l(4)
                if u==l(1) && v==l(3)
                    continue
                elseif u==l(1)
                    sum_mis(u,v)=sum_mis(u,v)+sum_mis(u,v-1);
                    sum_mis_2(u,v)=sum_mis_2(u,v)+sum_mis_2(u,v-1);
                elseif v==l(3)
                    sum_mis(u,v)=sum_mis(u,v)+sum_mis(u-1,v);
                    sum_mis_2(u,v)=sum_mis_2(u,v)+sum_mis_2(u-1,v);
                else
                    sum_mis(u,v)=sum_mis(u,v)+sum_mis(u,v-1)+sum_mis(u-1,v)-sum_mis(u-1,v-1);
                    sum_mis_2(u,v)=sum_mis_2(u,v)+sum_mis_2(u,v-1)+sum_mis_2(u-1,v)-sum_mis_2(u-1,v-1);
                end
            end
        end
        mis_abs_shift(l(1):l(2),l(3):l(4),i+comparedshift+1,j+comparedshift+1)=sum_mis(l(1):l(2),l(3):l(4));
        mis_abs_shift_2(l(1):l(2),l(3):l(4),i+comparedshift+1,j+comparedshift+1)=sum_mis_2(l(1):l(2),l(3):l(4));
    end
end
for m=1:288
    for n=1:352
        b=[max(1,m-halfblocksize+1),min(288,m+halfblocksize),max(1,n-halfblocksize+1),min(352,n+halfblocksize)];
        va_min=Inf;
        vs_min=Inf;
        va=0;
        vs=0;
        dx=0;
        dy=0;
        dx2=0;
        dy2=0;
        for u=-comparedshift:comparedshift
            for v=-comparedshift:comparedshift
                if b(1)==1 || b(3)==1
                    A1=0;
                    A2=0;
                else
                    A1=mis_abs_shift(m-1,n-1,u+comparedshift+1,v+comparedshift+1);
                    A2=mis_abs_shift_2(m-1,n-1,u+comparedshift+1,v+comparedshift+1);
                end
                if b(1)==1
                    B1=0;
                    B2=0;
                else
                    B1=mis_abs_shift(m-1,n,u+comparedshift+1,v+comparedshift+1);
                    B2=mis_abs_shift_2(m-1,n,u+comparedshift+1,v+comparedshift+1);
                end
                if b(3)==1
                    C1=0;
                    C2=0;
                else
                    C1=mis_abs_shift(m,n-1,u+comparedshift+1,v+comparedshift+1);
                    C2=mis_abs_shift_2(m,n-1,u+comparedshift+1,v+comparedshift+1);
                end
                D1=mis_abs_shift(m,n,u+comparedshift+1,v+comparedshift+1);
                D2=mis_abs_shift_2(m,n,u+comparedshift+1,v+comparedshift+1);
                if A1<0 || B1<0 || C1<0|| D1<0
                    va=Inf;
                else
                    va=D1+A1-B1-C1;
                end
                
                if A2<0 || B2<0 || C2<0|| D2<0
                    vs=Inf;
                else
                    vs=D2+A2-B2-C2;
                end
                if va<va_min || (va==va_min && dx*dx+dy*dy>u*u+v*v)
                    va_min=va;
                    dx=u;
                    dy=v;
                end
                if vs<vs_min 
                    vs_min=vs;
                    dx2=u;
                    dy2=v;
                elseif (vs<vs_min+1 && dx2*dx2+dy2*dy2>u*u+v*v)
                    dx2=u;
                    dy2=v;
                end
            end
        end
        mis_shift(m,n,:)=[dx,dy];
        mis_shift_2(m,n,:)=[dx2,dy2];
        mis_e(m,n)=uint8(mis_l(m,n)-mis_k(m+dx,n+dy)+128);
        mis_e_2(m,n)=uint8(mis_l(m,n)-mis_k(m+dx2,n+dy2)+128);
    end
end


subplot(3,2,1);
imshow(mis_k/255);
title('Ik')
subplot(3,2,2);
imshow(mis_l/255);
title('Il')
subplot(3,2,3);
quiver(mis_shift(288:-1:1,:,1),mis_shift(288:-1:1,:,2));
title('MAE');
subplot(3,2,4);
quiver(mis_shift_2(288:-1:1,:,1),mis_shift_2(288:-1:1,:,2));
title('MSE');
subplot(3,2,5);
imshow(mis_e/255);
title(entropy(mis_e-128));
subplot(3,2,6);
imshow(mis_e_2/255)
title(entropy(mis_e_2-128));

t2=cputime;
t2-t1
