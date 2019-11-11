canoe=zeros(240,320,301);
canoe_l=zeros(240,320,301);
for i=800:1100
    canoe(:,:,i-799)=rgb2gray(imread(strcat("/Users/valquiria/Desktop/video_sequences/canoe/input/in00",num2str(i,'%04d'),".jpg")));
    canoe_l(:,:,i-799)=imread(strcat("/Users/valquiria/Desktop/video_sequences/canoe/groundtruth/gt00",num2str(i,'%04d'),".png"));
end
highway=zeros(240,320,301);
highway_l=zeros(240,320,301);
for i=1000:1300
    highway(:,:,i-999)=rgb2gray(imread(strcat("/Users/valquiria/Desktop/video_sequences/highway/input/in00",num2str(i,'%04d'),".jpg")));
    highway_l(:,:,i-999)=imread(strcat("/Users/valquiria/Desktop/video_sequences/highway/groundtruth/gt00",num2str(i,'%04d'),".png"));
end
skating=zeros(360,540,151);
skating_l=zeros(360,540,151);
for i=1350:1500
    skating(:,:,i-1349)=rgb2gray(imread(strcat("/Users/valquiria/Desktop/video_sequences/skating/input/in00",num2str(i,'%04d'),".jpg")));
    skating_l(:,:,i-1349)=imread(strcat("/Users/valquiria/Desktop/video_sequences/skating/groundtruth/gt00",num2str(i,'%04d'),".png"));
end