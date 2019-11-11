sigma_s=300;% 50-2500 
T=0.9;
w=320;
l=240;
e_c_1=zeros(l,w,300);
e_c_1_f=zeros(l,w,300);
e_c_1_s=zeros(l,w,300);
f_nei=[0,1;0,-1;-1,0;1,0];
s_nei=[[1,1;1,-1;-1,1;-1,-1];f_nei];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
for i=1:300
    e_c_1(:,:,i)=((canoe(:,:,i+1)-canoe(:,:,i)).^2>2*0.2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_1_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_1_f(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_1_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_1_s(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.2*sigma_s*(log(5)+m/T);
            end
        end
    end
    for u=1:l
        for v=1:w
            if canoe_l(u,v,i+1)~=170
            TP=TP+double([e_c_1(u,v,i),e_c_1_f(u,v,i),e_c_1_s(u,v,i)]&canoe_l(u,v,i+1)==255);
            FP=FP+double([e_c_1(u,v,i)==1,e_c_1_f(u,v,i)==1,e_c_1_s(u,v,i)==1]&canoe_l(u,v,i+1)==0);
            FN=FN+double([e_c_1(u,v,i)==0,e_c_1_f(u,v,i)==0,e_c_1_s(u,v,i)==0]&canoe_l(u,v,i+1)==255);
            end
        end
    end
end
pr=[TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_c_2=zeros(l,w,300);
e_c_2_f=zeros(l,w,300);
e_c_2_s=zeros(l,w,300);
for i=1:300
    e_c_2(:,:,i)=((canoe(:,:,i+1)-canoe(:,:,i)).^2>2*0.4*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_2_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_2_f(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.4*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_2_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_2_s(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.4*sigma_s*(log(5)+m/T);
            end
        end
    end
    
    for u=1:l
        for v=1:w
            if canoe_l(u,v,i+1)~=170
            TP=TP+double([e_c_2(u,v,i),e_c_2_f(u,v,i),e_c_2_s(u,v,i)]&canoe_l(u,v,i+1)==255);
            FP=FP+double([e_c_2(u,v,i)==1,e_c_2_f(u,v,i)==1,e_c_2_s(u,v,i)==1]&canoe_l(u,v,i+1)==0);
            FN=FN+double([e_c_2(u,v,i)==0,e_c_2_f(u,v,i)==0,e_c_2_s(u,v,i)==0]&canoe_l(u,v,i+1)==255);
            end
        end
    end
end
pr=[pr;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_c_3=zeros(l,w,300);
e_c_3_f=zeros(l,w,300);
e_c_3_s=zeros(l,w,300);
for i=1:300
    e_c_3(:,:,i)=((canoe(:,:,i+1)-canoe(:,:,i)).^2>2*0.6*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_3_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_3_f(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.6*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_3_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_3_s(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.6*sigma_s*(log(5)+m/T);
            end
        end
    end
    
    for u=1:l
        for v=1:w
            if canoe_l(u,v,i+1)~=170
            TP=TP+double([e_c_3(u,v,i),e_c_3_f(u,v,i),e_c_3_s(u,v,i)]&canoe_l(u,v,i+1)==255);
            FP=FP+double([e_c_3(u,v,i)==1,e_c_3_f(u,v,i)==1,e_c_3_s(u,v,i)==1]&canoe_l(u,v,i+1)==0);
            FN=FN+double([e_c_3(u,v,i)==0,e_c_3_f(u,v,i)==0,e_c_3_s(u,v,i)==0]&canoe_l(u,v,i+1)==255);
            end
        end
    end
end
pr=[pr;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_c_4=zeros(l,w,300);
e_c_4_f=zeros(l,w,300);
e_c_4_s=zeros(l,w,300);
for i=1:300
    e_c_4(:,:,i)=((canoe(:,:,i+1)-canoe(:,:,i)).^2>2*0.8*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_4_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_4_f(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.8*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_4_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_4_s(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*0.8*sigma_s*(log(5)+m/T);
            end
        end
    end
    
    for u=1:l
        for v=1:w
            if canoe_l(u,v,i+1)~=170
            TP=TP+double([e_c_4(u,v,i),e_c_4_f(u,v,i),e_c_4_s(u,v,i)]&canoe_l(u,v,i+1)==255);
            FP=FP+double([e_c_4(u,v,i)==1,e_c_4_f(u,v,i)==1,e_c_4_s(u,v,i)==1]&canoe_l(u,v,i+1)==0);
            FN=FN+double([e_c_4(u,v,i)==0,e_c_4_f(u,v,i)==0,e_c_4_s(u,v,i)==0]&canoe_l(u,v,i+1)==255);
            end
        end
    end
end
pr=[pr;TP./(TP+FN),TP./(TP+FP)];
TP=[0,0,0];
FP=[0,0,0];
FN=[0,0,0];
e_c_5=zeros(l,w,300);
e_c_5_f=zeros(l,w,300);
e_c_5_s=zeros(l,w,300);
for i=1:300
    e_c_5(:,:,i)=((canoe(:,:,i+1)-canoe(:,:,i)).^2>2*sigma_s*log(5));
    %5iteration
    for iter=1:5
        for u=1:l
            for v=1:w
                m=4;
                for k=1:4
                    a=f_nei(k,1);
                    b=f_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_5_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_5_f(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*sigma_s*(log(5)+m/T);                
                m=8;
                for k=1:8
                    a=s_nei(k,1);
                    b=s_nei(k,2);
                    if 0<u+a && u+a<=l && 0<v+b && v+b<=w
                        if e_c_5_f(u+a,v+b,i)==1
                            m=m-2;
                        end
                    end 
                end
                e_c_5_s(u,v,i)=(canoe(u,v,i+1)-canoe(u,v,i)).^2>2*sigma_s*(log(5)+m/T);
            end
        end
    end
    
    for u=1:l
        for v=1:w
            if canoe_l(u,v,i+1)~=170
            TP=TP+double([e_c_5(u,v,i),e_c_5_f(u,v,i),e_c_5_s(u,v,i)]&canoe_l(u,v,i+1)==255);
            FP=FP+double([e_c_5(u,v,i)==1,e_c_5_f(u,v,i)==1,e_c_5_s(u,v,i)==1]&canoe_l(u,v,i+1)==0);
            FN=FN+double([e_c_5(u,v,i)==0,e_c_5_f(u,v,i)==0,e_c_5_s(u,v,i)==0]&canoe_l(u,v,i+1)==255);
            end
        end
    end
end
pr=[pr;TP./(TP+FN),TP./(TP+FP)];
figure(1);
subplot(2,3,1);
imshow(canoe(:,:,201)/255);
subplot(2,3,2);
imshow((canoe(:,:,201)-canoe(:,:,200))/255);
subplot(2,3,3);
imshow(canoe_l(:,:,201));
subplot(2,3,4);
imshow(e_c_3(:,:,201));
subplot(2,3,5);
imshow(e_c_3_f(:,:,201));
subplot(2,3,6);
imshow(e_c_3_s(:,:,201));
figure(2)
plot(pr(:,1),pr(:,4));hold on;
plot(pr(:,2),pr(:,5));hold on;
plot(pr(:,3),pr(:,6));hold off;
legend('fixed threshold','mrf-1','mrf-2')
v=VideoWriter('canoe_fixed_trs','MPEG-4');
open(v);
for i=1:300
    writeVideo(v,e_c_3(:,:,i));
end
close(v)
v=VideoWriter('canoe_mrf_1','MPEG-4');
open(v);
for i=1:300
    writeVideo(v,e_c_3_f(:,:,i));
end
close(v)
v=VideoWriter('canoe_mrf_2','MPEG-4');
open(v);
for i=1:300
    writeVideo(v,e_c_3_s(:,:,i));
end
close(v)

