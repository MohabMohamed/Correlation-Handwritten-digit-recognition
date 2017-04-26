function [ data ] = load_dataset( start_of_path )
%function loads the data in a cell array
data = cell(10,1);

for i=int8(1) : int8(10)
    data{i}= im2bw(imread(strcat(start_of_path,int2str(i-1),'.jpg')));
end

end

