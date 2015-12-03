filename = 'Trainset.txt';
mtrain = dlmread(filename,'',0,1);
filename1 = 'Testset.txt';
mtest = dlmread(filename1,'',0,1);

fid = fopen('Trainset.txt');
train=textscan(fid,'%s %*[^\n]');
trainlable=train{:};
fclose(fid);
disp(trainlable);

fid1 = fopen('Testset.txt');
test=textscan(fid1,'%s %*[^\n]');
testlable=test{:};
fclose(fid1);

% disp(trainlable);
% disp(testlable);
KNN_function(mtest,mtrain,trainlable,testlable)