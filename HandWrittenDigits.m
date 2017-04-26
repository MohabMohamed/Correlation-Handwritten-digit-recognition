%this is the main script of the project please run it
train_data=load_dataset( 'train/mnist_train' );
test_data=load_dataset( 'test/mnist_test');

%matching the img with an img in the data set but the parameter of the test
%data should be in this format test_data{<numer of the photo of test set 1
%for zero's,2 for ones..>}(<starting pixel in row should be (divisible 
%by 28)+1>:ending pixel in row should be divisible by 28,the same as rows
%but for colms).
%like match_img(test_data{9}(29:56,29:56),train_data);
%the size of tested img MUST be 28*28
arr=match_img(test_data{6}(1:28,197:224),train_data);
figure('Name','histogram','NumberTitle','off');
hist(arr);
figure('Name','bar graph','NumberTitle','off');
bar(arr);
figure('Name','box plot','NumberTitle','off');
boxplot(arr);
