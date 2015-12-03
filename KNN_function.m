function KNN_function(mtest,mtrain,trainlable,testlable)
ntrain=size(mtrain,1);
ntest=size(mtest,1);
ctrain=size(mtrain,2);

Eucdistance=zeros(ntrain,1);
t=0; f=0;
for i=1:ntest,
    a=mtest(i,:);
    for mm=1:ntrain,
        b=mtrain(mm,:);
        Distance=0;
        for k=1:ctrain,
        Distance=Distance+(b(:,k)-a(:,k)).^2; 
        end  
        Eucdistance(mm,1)=sqrt(Distance);

        TestTable=table(Eucdistance,trainlable);
    end

     testsort=sortrows(TestTable);
     disp(testsort);
    
     threshold=10;
     if testsort.Eucdistance>100,
        disp ('No Match');
     else
         disp (['The person should be',testsort.trainlable(1)]);
        disp (['The person is',testlable(i,1)]);
        
        tf=strcmp(testsort.trainlable(1),testlable(i,1));
       
        if(tf)
            disp('True');
            t=t+1;
        else 
            disp('False');
            f=f+1;
        end 
     end 
  
                
end 

percentage=t*100/ntest;
fprintf('The accuracy is %.1f%%',percentage);


    