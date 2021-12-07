figure(1)
subplot(2,2,1);
pic1=imread('1.jpg');
imshow(pic1)
greypic1=rgb2gray(pic1);
title('pic 1')
subplot(2,2,2);
pic2=imread('2.jpg');
imshow(pic2)
greypic2=rgb2gray(pic2);
title('pic 2')
subplot(2,2,3);
pic3=imread('3.jpg');
imshow(pic3)
greypic3=rgb2gray(pic3);
title('pic 3')
subplot(2,2,4);
pic4=imread('4.jpg');
imshow(pic4)
greypic4=rgb2gray(pic4);
title('pic 4')
figure(2)
subplot(2,2,1)
imshow(greypic1)
subplot(2,2,2)
imshow(greypic2)
subplot(2,2,3)
imshow(greypic3)
subplot(2,2,4)
imshow(greypic4)
figure(3)
subplot(2,2,1)
title('histogram for greypic1')
imhist(greypic1)
subplot(2,2,2)
title('histogram for greypic2')
imhist(greypic2)
subplot(2,2,3)
title('histogram for greypic3')
imhist(greypic3)
subplot(2,2,4)
title('histogram for greypic4')
imhist(greypic4)
pic1=imresize(pic1, [240 240]);
pic2=imresize(pic2 ,[240 240]);
pic3=imresize(pic3, [240 240]);
pic4=imresize(pic4, [240 240]);
x=[pic1,pic2,pic3,pic4];
xVect=[pic1;pic2;pic3;pic4];
figure(4)
subplot(2,1,1)
imhist(x)
title('histogram for x as a matrix')
subplot(2,1,2)
imhist(xVect)
title('histogram for x as a vector')
dImage = imfilter(double(x), [1, -1]);
figure(5)
subplot(2,2,1)
imshow(x)
title('appended image as a matrix')
subplot(2,2,2)
imshow(xVect)
title('appended image as a vector')
figure(6)
imshow(dImage, [])
figure(7)
histogram(dImage)