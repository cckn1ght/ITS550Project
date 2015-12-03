clear all; clc; addpath(genpath(pwd));

%% EXTRACT FEATURES FROM AN ARBITRARY FINGERPRINT
filename='H:\fall2015\550\lab2\New folder\test\Thumb23.jpg';
N='Thumb23';
img = imread(filename);
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features from ' filename ' ...']);
ffnew=ext_finger(img,1);

%% GET FEATURES OF AN ARBITRARY FINGERPRINT FROM THE TEMPLATE AND MATCH IT WITH FIRST ONE
S=zeros(2,1); W={'Thumb1';'Thumb2'};
for w=1:2;
    P=strcat('Thumb',num2str(w),'.jpg');
    Q=strcat('Thumb',num2str(w));
    dir='H:\fall2015\550\lab2\New folder\';
    %filename1='H:\fall2015\550\lab2\New folder\Thumb20.jpg';
    img1 = imread([dir,P]);
    if ndims(img1) == 3; img1 = rgb2gray(img1); end  % Color Images
    ffnew1=ext_finger(img1,1);
    S(w,1)=match(ffnew,ffnew1,1);
end   
Z=table(W,S);
disp(Z);
trainsort=sortrows(Z,'S','descend');
disp(trainsort);
    if trainsort.S<0.2,
        disp ('No Match');
     else
         disp (['The person should be ',N]);
        disp (['The person is',trainsort.W(1)]);
        
        tf=strcmp(N,trainsort.W(1));
       
        if(tf)
            disp('True');
            t=1;
        else 
            disp('False');
            f=1;t=0;
        end 
     end 
percentage=t*100/2;
fprintf('The accuracy is %.1f%%',percentage);

