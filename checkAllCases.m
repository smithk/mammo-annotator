function checkAllCases()

% load the master annotation file
load data/images_for_annotation_20170621.mat

tumorfound = [data{:,26}];

% A = [data{:,27}];
% Anew = A;
% statusListOld = statusList;

% revisit_list_Karin = [318 374 378 398 401 510 657 748 904 1193 1245 1522 1566 1675];

% revisit —> Karin wants to check again
revisit = [];

% unsure —> Edward to look at (later)
unsure = [];

% annotated without files —> Error, need to Revisit (same images as before)
error = [];

% annotated with files without images AND tumorfound==0 —> Finished - no tumor in image
notumor = [];

% annotated with files without images AND tumorfound==1 —> Fredrik needs to update file paths
newpaths = [];

% annotated with files wtih images —> Finished - tumor in image (No action needed)
finished = [];



for i = 1:numel(statusList)
    % get the case ID
    id = idList{i};
    
    % get a list of indexes into the CSV sheet corresponding to the ID
    idxList = [];
    for j = 1:size(data,1)
        if strcmp(data{j,1}, id)
            idxList(end+1) = j;
        end
    end
    
    % check that the status matches
    status = statusList(i);
    status_data = cell2mat(data(idxList,27));
    for j = 1:numel(idxList)
        if status ~= status_data(j)
            fprintf('status = %d does not agree with data = %d\n', status, status_data);
        end
    end
    
    % try to load the annotation file
    pth = 'D:\ksmith\mammo-annotator\Data\annotations\';
    filename = fullfile(pth, id);
    try
        a = load(filename);
    catch
        a = [];
    end
    
    % make the tests
    f0 = check_revisit(i);
    f1 = check_unsure(status, id, a, tumorfound(i));
    f2 = check_error(status, id, a, tumorfound(i));
    f3 = check_notumor(status, id, a, tumorfound(i));
    f4 = check_newpaths(status, id, a, tumorfound(i));
    f5 = check_finished(status, id, a, tumorfound(i));


    % do some operations to handle overlaps ("unsure cases" cannot overlap)
    if f1
        f0=0; f2=0; f3=0; f4=0; f5=0;
    end
    
    
    % show the test results
    fprintf('case %d  %d %d %d %d %d %d\n', i, f0, f1, f2, f3, f4, f5);
    
    % checks to see if the states overlap
    % (only "unsure" overlaps!)
    f = [f0 f1 f2 f3 f4 f5];
    if sum(f) > 1
%             pause;
    end
    if sum(f) == 0
        keyboard;
    end
    
    
    
    % add to the final lists
    if f0
        revisit(end+1) = i;
    end
    if f1
        unsure(end+1) = i;
    end
    if f2
        error(end+1) = i;
    end
    if f3
        notumor(end+1) = i;
    end
    if f4
        newpaths(end+1) = i;
    end
    if f5
        finished(end+1) = i;
    end
    
    % get a final "state" for this case
    state = find(f(2:end));
    for j = 1:numel(idxList)
        data{idxList(j),28} = state;
    end
    
    
end

csv_filename = 'images_for_annotation_20170621_with_states_KS.csv';
fprintf('writing %s\n', csv_filename);
cell2csv(csv_filename, data, ';');

keyboard;






function flag = check_revisit(i)

flag = 0;
revisit_list_Karin = [318 374 378 398 401 510 657 748 904 1193 1245 1522 1566 1675];
if sum(ismember(revisit_list_Karin, i))
    flag = 1;
end

% karin's revisit list overlaps with "unsure" , "notumor", and "newpaths" (as  well as
% "finished")


function flag = check_unsure(status, id, a, tumorfound)

flag = 0;

if status == 2
    flag = 1;
end



function flag = check_error(status, id, a, tumorfound)

flag = 0;

if isempty(a)
    flag = 1;
end



function flag = check_notumor(status, id, a, tumorfound)

flag = 0;
foundAnnotation = 0;

if isempty(a)
    return;
end

for j = 1:size(a.annotation,1)
    for k = 1:5
        if ~isempty(a.annotation{j,24}{k})
            foundAnnotation = 1;
        end
    end
end
   
if (tumorfound == 0) && (foundAnnotation == 0)
    flag = 1;
end


function flag = check_newpaths(status, id, a, tumorfound)

flag = 0;
foundAnnotation = 0;

if isempty(a)
    return;
end

for j = 1:size(a.annotation,1)
    for k = 1:5
        if ~isempty(a.annotation{j,24}{k})
            foundAnnotation = 1;
        end
    end
end
   
if (tumorfound == 1) && (foundAnnotation == 0)
    flag = 1;
end


function flag = check_finished(status, id, a, tumorfound)

flag = 0;
foundAnnotation = 0;

if isempty(a)
    return;
end

for j = 1:size(a.annotation,1)
    for k = 1:5
        if ~isempty(a.annotation{j,24}{k})
            foundAnnotation = 1;
        end
    end
end

if (status == 1) && (foundAnnotation == 1)
    flag = 1;
end