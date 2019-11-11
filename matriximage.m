l=imread("/Users/valquiria/Desktop/temp/Boxes_left.jpg");
r=imread("/Users/valquiria/Desktop/temp/Boxes_right.jpg");
ul_r=0.0;
ur_r=0.0;

ul_g=0.0;
ur_g=0.0;

ul_b=0.0;
ur_b=0.0;

val_l_r=0.0;
val_r_r=0.0;

val_l_g=0.0;
val_r_g=0.0;

val_l_b=0.0;
val_r_b=0.0;

for x=1:540
    for y=1:720
        ul_r=ul_r+double(l(x,y,1));
        ur_r=ur_r+double(r(x,y,1));
        ul_g=ul_g+double(l(x,y,2));
        ur_g=ur_g+double(r(x,y,2));
        ul_b=ul_b+double(l(x,y,3));
        ur_b=ur_b+double(r(x,y,3));
    end
end

ul_r=ul_r/(540.0*720.0);
ur_r=ur_r/(540.0*720.0);
ul_g=ul_g/(540.0*720.0);
ur_g=ur_g/(540.0*720.0);
ul_b=ul_b/(540.0*720.0);
ur_b=ur_b/(540.0*720.0);
%maximum likihood

for x=1:540
    for y=1:720
        val_l_r=val_l_r+(double(l(x,y,1))-ul_r)^2;
        val_r_r=val_r_r+(double(r(x,y,1))-ur_r)^2;
        val_l_g=val_l_g+(double(l(x,y,2))-ul_g)^2;
        val_r_g=val_r_g+(double(r(x,y,2))-ur_g)^2;
        val_l_b=val_l_b+(double(l(x,y,3))-ul_b)^2;
        val_r_b=val_r_b+(double(r(x,y,3))-ur_b)^2;
        
    end
end
val_l_r=val_l_r/(540.0*720.0);
val_r_r=val_r_r/(540.0*720.0);
val_l_g=val_l_g/(540.0*720.0);
val_r_g=val_r_g/(540.0*720.0);
val_l_b=val_l_b/(540.0*720.0);
val_r_b=val_r_b/(540.0*720.0);
a_r=sqrt(val_r_r/val_l_r);
a_g=sqrt(val_r_g/val_l_g);
a_b=sqrt(val_r_b/val_l_b);
b_r=-ul_r*a_r+ur_r;
b_g=-ul_g*a_g+ur_g;
b_b=-ul_b*a_b+ur_b;
for x=1:540
    for y=1:720
        l2(x,y,1)=l(x,y,1)*a_r+b_r;
        l2(x,y,2)=l(x,y,2)*a_g+b_r;
        l2(x,y,3)=l(x,y,3)*a_b+b_b;
    end
end

figure(10)
imshow(l);

title('l')
figure(11);
imshow(l2);

title('compensated l')

figure(12);
imshow(r);

title('r');