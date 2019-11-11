sigma_s=400;% 50-2500 
T=1.9;
w=540;
l=360;
e_s_1=zeros(l,w,150);
e_s_1_f=zeros(l,w,150);
e_s_1_s=zeros(l,w,150);
f_nei=[0,1;0,-1;-1,0;1,0];
s_nei=[[1,1;1,-1;-1,1;-1,-1];f_nei];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
for i=1:150
    e_s_1(:,:,i)=((skating(:,:,i+1)-skating(:,:,i)).^2>2*0.2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_1_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_1_f(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*0.2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_1_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_1_s(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*0.2*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if skating_l(u,v,i+1)~=170
            TP=TP+double([e_s_1(u,v,i),e_s_1_f(u,v,i),e_s_1_s(u,v,i)]&skating_l(u,v,i+1)==255);
            FP=FP+double([e_s_1(u,v,i)==1,e_s_1_f(u,v,i)==1,e_s_1_s(u,v,i)==1]&skating_l(u,v,i+1)==0);
            FN=FN+double([e_s_1(u,v,i)==0,e_s_1_f(u,v,i)==0,e_s_1_s(u,v,i)==0]&skating_l(u,v,i+1)==255);
            end
        end
    end
end
pr_s=[TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_s_2=zeros(l,w,150);
e_s_2_f=zeros(l,w,150);
e_s_2_s=zeros(l,w,150);
for i=1:150
    e_s_2(:,:,i)=((skating(:,:,i+1)-skating(:,:,i)).^2>2*0.5*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_2_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_2_f(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*0.5*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_2_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_2_s(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*0.5*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if skating_l(u,v,i+1)~=170
            TP=TP+double([e_s_2(u,v,i),e_s_2_f(u,v,i),e_s_2_s(u,v,i)]&skating_l(u,v,i+1)==255);
            FP=FP+double([e_s_2(u,v,i)==1,e_s_2_f(u,v,i)==1,e_s_2_s(u,v,i)==1]&skating_l(u,v,i+1)==0);
            FN=FN+double([e_s_2(u,v,i)==0,e_s_2_f(u,v,i)==0,e_s_2_s(u,v,i)==0]&skating_l(u,v,i+1)==255);
            end
        end
    end
end
pr_s=[pr_s;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_s_3=zeros(l,w,150);
e_s_3_f=zeros(l,w,150);
e_s_3_s=zeros(l,w,150);
for i=1:150
    e_s_3(:,:,i)=((skating(:,:,i+1)-skating(:,:,i)).^2>2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_3_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_3_f(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_3_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_3_s(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if skating_l(u,v,i+1)~=170
            TP=TP+double([e_s_3(u,v,i),e_s_3_f(u,v,i),e_s_3_s(u,v,i)]&skating_l(u,v,i+1)==255);
            FP=FP+double([e_s_3(u,v,i)==1,e_s_3_f(u,v,i)==1,e_s_3_s(u,v,i)==1]&skating_l(u,v,i+1)==0);
            FN=FN+double([e_s_3(u,v,i)==0,e_s_3_f(u,v,i)==0,e_s_3_s(u,v,i)==0]&skating_l(u,v,i+1)==255);
            end
        end
    end
end
pr_s=[pr_s;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_s_4=zeros(l,w,150);
e_s_4_f=zeros(l,w,150);
e_s_4_s=zeros(l,w,150);
for i=1:150
    e_s_4(:,:,i)=((skating(:,:,i+1)-skating(:,:,i)).^2>2*2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_4_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_4_f(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_4_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_4_s(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*2*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if skating_l(u,v,i+1)~=170
            TP=TP+double([e_s_4(u,v,i),e_s_4_f(u,v,i),e_s_4_s(u,v,i)]&skating_l(u,v,i+1)==255);
            FP=FP+double([e_s_4(u,v,i)==1,e_s_4_f(u,v,i)==1,e_s_4_s(u,v,i)==1]&skating_l(u,v,i+1)==0);
            FN=FN+double([e_s_4(u,v,i)==0,e_s_4_f(u,v,i)==0,e_s_4_s(u,v,i)==0]&skating_l(u,v,i+1)==255);
            end
        end
    end
end
pr_s=[pr_s;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_s_5=zeros(l,w,150);
e_s_5_f=zeros(l,w,150);
e_s_5_s=zeros(l,w,150);
for i=1:150
    e_s_5(:,:,i)=((skating(:,:,i+1)-skating(:,:,i)).^2>2*5*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_5_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_5_f(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*5*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_s_5_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_s_5_s(u,v,i)=(skating(u,v,i+1)-skating(u,v,i)).^2>2*5*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if skating_l(u,v,i+1)~=170
            TP=TP+double([e_s_5(u,v,i),e_s_5_f(u,v,i),e_s_5_s(u,v,i)]&skating_l(u,v,i+1)==255);
            FP=FP+double([e_s_5(u,v,i)==1,e_s_5_f(u,v,i)==1,e_s_5_s(u,v,i)==1]&skating_l(u,v,i+1)==0);
            FN=FN+double([e_s_5(u,v,i)==0,e_s_5_f(u,v,i)==0,e_s_5_s(u,v,i)==0]&skating_l(u,v,i+1)==255);
            end
        end
    end
end
%implay([e_s_1,e_s_2,e_s_3,e_s_4,e_s_5;e_s_1_f,e_s_2_f,e_s_3_f,e_s_4_f,e_s_5_f],60)
pr_s=[pr_s;TP./(TP+FN),TP./(TP+FP)];
figure(1);
subplot(2,3,1);
imshow(skating(:,:,51)/255);
subplot(2,3,2);
imshow((skating(:,:,51)-skating(:,:,50))/255);
subplot(2,3,3);
imshow(skating_l(:,:,51));
subplot(2,3,4);
imshow(e_s_3(:,:,51));
subplot(2,3,5);
imshow(e_s_3_f(:,:,51));
subplot(2,3,6);
imshow(e_s_3_s(:,:,51));
figure(2);
plot(pr_s(:,1),pr_s(:,4));hold on;
plot(pr_s(:,2),pr_s(:,5));hold on;
plot(pr_s(:,3),pr_s(:,6));hold off;
legend('fixed threshold','mrf-1','mrf-2')
v=VideoWriter('skating_fixed_trs','MPEG-4');
open(v);
for i=1:150
    writeVideo(v,e_s_3(:,:,i));
end
close(v)
v=VideoWriter('skating_mrf_1','MPEG-4');
open(v);
for i=1:150
    writeVideo(v,e_s_3_f(:,:,i));
end
close(v)
v=VideoWriter('skating_mrf_2','MPEG-4');
open(v);
for i=1:150
    writeVideo(v,e_s_3_s(:,:,i));
end
close(v)
