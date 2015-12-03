
% Create an array to save all feature vectors for 20 images
Set=[];
% Create a text file to save training set
fileID = fopen('testset.txt','at');
% Using a for loop to save feature vectors automatically
for w='a':'h';
    P=strcat(w,'.pgm');
    Q=imread(P);
    
    fun=@minutie;
    L = nlfilter(K,[3 3],fun);
    % Termination
    LTerm=(L==1);
    imshow(LTerm)
    LTermLab=bwlabel(LTerm);
    propTerm=regionprops(LTermLab,'Centroid');
    CentroidTerm=round(cat(1,propTerm(:).Centroid));
    imshow(~K)
    set(gcf,'position',[1 1 600 600]);
    hold on
    plot(CentroidTerm(:,1),CentroidTerm(:,2),'ro')
    
    
    % change image type to double in order to fit 'sqrt' function
    Z=im2double(Q);
    % get average pixel each row as a feature vector
    X=mean(Z.');
    % using (:) to save pixels in one line 112*1
    W=X(:);
    Set=W';
    % print file name as the trainlable
    fprintf(fileID,'%s \t',w);
    fmt=[repmat('%f\t',1,111),'%f\n'];
    % print feature vectors for each face following the file name 
    fprintf(fileID,fmt,Set);
end
fclose(fileID);

