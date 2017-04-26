function [ max_corr ] = match_img( tested_img,train_data)
%this function gets the most matched image of each image in training
%set(get best match image in zeros photo and in one's photo and so on)
% by using Correlation and then return this array at the end of this
% function. we get the max correlation in this array and this will be the
% best matched digit for our unknown digit so it will be the same digit.

max_corr(1:10)=-100; %the array of max correlations of best matched img for each digit
imgs_matched (1:10,1:2)=-100; %array stores the index of best matched img for each digit to show it later in this funxtion
for img=int8(1) : int8(10) %iterates on the imgs of training(0's photo,1's photo...etc) 
    
    for i=1: 28: size(train_data{img},1) 
        
        for j=1: 28: size(train_data{img},2) 
            curr_corr=corr2(train_data{img}(i:i+27,j:j+27),tested_img);
            if curr_corr> max_corr(img)
                max_corr(img)  =curr_corr;
                imgs_matched(img,1)=i;
                imgs_matched(img,2)=j;
            end
        end
        
    end
end
max_idx=0;
best_corr=-100;
%getting the best match from the array of max correlations
for i=1 : 10
    if best_corr< max_corr(i)
        best_corr= max_corr(i);
        max_idx=i;
    end
end
fprintf('The unknown digit is %d \n', max_idx-1);
%shows the tested img besides the matched img
figure('Name','tested img & best match img','NumberTitle','off');
imshowpair(tested_img,train_data{max_idx}( imgs_matched(max_idx,1):imgs_matched(max_idx,1)+27,imgs_matched(max_idx,2):imgs_matched(max_idx,2)+27),'montage');

end

