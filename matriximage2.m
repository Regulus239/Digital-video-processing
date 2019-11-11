l=imread("/Users/valquiria/Desktop/temp/Boxes_left.jpg");
r=imread("/Users/valquiria/Desktop/temp/Boxes_right.jpg");
ul=[0.0,0.0,0.0];
ur=[0.0,0.0,0.0];
val_l=[0.0,0.0,0.0];
val_r=[0.0,0.0,0.0];

for x=1:540
    for y=1:720
        ul=ul+double(reshape(l(x,y,:),1,3))/255.0;
        ur=ur+double(reshape(r(x,y,:),1,3))/255.0;
    end
end
ul=ul/540.0/720.0;
ur=ur/540.0/720.0;
%maximun likihood
for x=1:540
    for y=1:720
        val_l=val_l+(double(reshape(l(x,y,:),1,3))-ul).^2;
        val_r=val_r+(double(reshape(r(x,y,:),1,3))-ur).^2;
    end
end
val_l=val_l/540.0/720.0;
val_r=val_r/540.0/720.0;