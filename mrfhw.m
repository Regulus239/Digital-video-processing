sigma_s=200;% 50-2500 
T=1;
w=320;
l=240;
e_h_1=zeros(l,w,300);
e_h_1_f=zeros(l,w,300);
e_h_1_s=zeros(l,w,300);
f_nei=[0,1;0,-1;-1,0;1,0];
s_nei=[[1,1;1,-1;-1,1;-1,-1];f_nei];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
for i=1:300
    e_h_1(:,:,i)=((highway(:,:,i+1)-highway(:,:,i)).^2>2*0.2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_1_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_1_f(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*0.2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_1_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_1_s(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*0.2*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if highway_l(u,v,i+1)~=170
            TP=TP+double([e_h_1(u,v,i),e_h_1_f(u,v,i),e_h_1_s(u,v,i)]&highway_l(u,v,i+1)==255);
            FP=FP+double([e_h_1(u,v,i)==1,e_h_1_f(u,v,i)==1,e_h_1_s(u,v,i)==1]&highway_l(u,v,i+1)==0);
            FN=FN+double([e_h_1(u,v,i)==0,e_h_1_f(u,v,i)==0,e_h_1_s(u,v,i)==0]&highway_l(u,v,i+1)==255);
            end
        end
    end
end
pr_h=[TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_h_2=zeros(l,w,300);
e_h_2_f=zeros(l,w,300);
e_h_2_s=zeros(l,w,300);
for i=1:300
    e_h_2(:,:,i)=((highway(:,:,i+1)-highway(:,:,i)).^2>2*0.5*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_2_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_2_f(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*0.5*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_2_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_2_s(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*0.5*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if highway_l(u,v,i+1)~=170
            TP=TP+double([e_h_2(u,v,i),e_h_2_f(u,v,i),e_h_2_s(u,v,i)]&highway_l(u,v,i+1)==255);
            FP=FP+double([e_h_2(u,v,i)==1,e_h_2_f(u,v,i)==1,e_h_2_s(u,v,i)==1]&highway_l(u,v,i+1)==0);
            FN=FN+double([e_h_2(u,v,i)==0,e_h_2_f(u,v,i)==0,e_h_2_s(u,v,i)==0]&highway_l(u,v,i+1)==255);
            end
        end
    end
end
pr_h=[pr_h;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_h_3=zeros(l,w,300);
e_h_3_f=zeros(l,w,300);
e_h_3_s=zeros(l,w,300);
for i=1:300
    e_h_3(:,:,i)=((highway(:,:,i+1)-highway(:,:,i)).^2>2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_3_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_3_f(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_3_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_3_s(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if highway_l(u,v,i+1)~=170
            TP=TP+double([e_h_3(u,v,i),e_h_3_f(u,v,i),e_h_3_s(u,v,i)]&highway_l(u,v,i+1)==255);
            FP=FP+double([e_h_3(u,v,i)==1,e_h_3_f(u,v,i)==1,e_h_3_s(u,v,i)==1]&highway_l(u,v,i+1)==0);
            FN=FN+double([e_h_3(u,v,i)==0,e_h_3_f(u,v,i)==0,e_h_3_s(u,v,i)==0]&highway_l(u,v,i+1)==255);
            end
        end
    end
end
pr_h=[pr_h;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_h_4=zeros(l,w,300);
e_h_4_f=zeros(l,w,300);
e_h_4_s=zeros(l,w,300);
for i=1:300
    e_h_4(:,:,i)=((highway(:,:,i+1)-highway(:,:,i)).^2>2*2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_4_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_4_f(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_4_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_4_s(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*2*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if highway_l(u,v,i+1)~=170
            TP=TP+double([e_h_4(u,v,i),e_h_4_f(u,v,i),e_h_4_s(u,v,i)]&highway_l(u,v,i+1)==255);
            FP=FP+double([e_h_4(u,v,i)==1,e_h_4_f(u,v,i)==1,e_h_4_s(u,v,i)==1]&highway_l(u,v,i+1)==0);
            FN=FN+double([e_h_4(u,v,i)==0,e_h_4_f(u,v,i)==0,e_h_4_s(u,v,i)==0]&highway_l(u,v,i+1)==255);
            end
        end
    end
end
pr_h=[pr_h;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_h_5=zeros(l,w,300);
e_h_5_f=zeros(l,w,300);
e_h_5_s=zeros(l,w,300);
for i=1:300
    e_h_5(:,:,i)=((highway(:,:,i+1)-highway(:,:,i)).^2>2*5*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_5_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_5_f(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*5*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_h_5_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_h_5_s(u,v,i)=(highway(u,v,i+1)-highway(u,v,i)).^2>2*5*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if highway_l(u,v,i+1)~=170
            TP=TP+double([e_h_5(u,v,i),e_h_5_f(u,v,i),e_h_5_s(u,v,i)]&highway_l(u,v,i+1)==255);
            FP=FP+double([e_h_5(u,v,i)==1,e_h_5_f(u,v,i)==1,e_h_5_s(u,v,i)==1]&highway_l(u,v,i+1)==0);
            FN=FN+double([e_h_5(u,v,i)==0,e_h_5_f(u,v,i)==0,e_h_5_s(u,v,i)==0]&highway_l(u,v,i+1)==255);
            end
        end
    end
end
%implay([e_h_1,e_h_2,e_h_3,e_h_4,e_h_5;e_h_1_f,e_h_2_f,e_h_3_f,e_h_4_f,e_h_5_f],60)
pr_h=[pr_h;TP./(TP+FN),TP./(TP+FP)];
figure(1);
subplot(2,3,1);
imshow(highway(:,:,101)/255);
subplot(2,3,2);
imshow((highway(:,:,101)-highway(:,:,100))/255);
subplot(2,3,3);
imshow(highway_l(:,:,101));
subplot(2,3,4);
imshow(e_h_3(:,:,101));
subplot(2,3,5);
imshow(e_h_3_f(:,:,101));
subplot(2,3,6);
imshow(e_h_3_s(:,:,101));
figure(2);
plot(pr_h(:,1),pr_h(:,4));hold on;
plot(pr_h(:,2),pr_h(:,5));hold on;
plot(pr_h(:,3),pr_h(:,6));hold off;
legend('fixed threshold','mrf-1','mrf-2')
v=VideoWriter('highway_fixed_trs','MPEG-4');
open(v);
for i=1:300
    writeVideo(v,e_h_3(:,:,i));
end
close(v)
v=VideoWriter('highway_mrf_1','MPEG-4');
open(v);
for i=1:300
    writeVideo(v,e_h_3_f(:,:,i));
end
close(v)
v=VideoWriter('highway_mrf_2','MPEG-4');
open(v);
for i=1:300
    writeVideo(v,e_h_3_s(:,:,i));
end
close(v)