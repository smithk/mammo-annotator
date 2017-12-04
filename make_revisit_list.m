load data/images_for_annotation_20170621.mat

A = [data{:,27}];
Anew = A;
revisit_list = [318 374 378 398 401 510 657 748 904 1193 1245 1522 1566 1675];

Anew(A == 2) = 0;
%Anew(revisit_list) = 0;

% [A' Anew']

current_id = data{1,1};
case_numbers = zeros(size(data,1),1);
case_num = 1;
case_numbers(1) = case_num;

for i = 2:size(data,1)
    if strcmpi(current_id, data{i,1})
        case_numbers(i) = case_num;
    else        
        case_num = case_num + 1;
        current_id = data{i,1};
        case_numbers(i) = case_num;
    end
    
    if find(revisit_list == case_num,1) 
        Anew(i) = 0;
    end    
end

for i = 1:size(data,1)
    data{i,27} = Anew(i);    
end

filename = 'data/images_to_revisit_20171205.mat';
fprintf('saving %s\n', filename);
save(filename, 'data', 'dataFields', 'idList', 'statusList');

