function updatePaths()

% load the master annotation file
load data/Images_for_annotation_20170621/images_for_annotation_20170621.mat

% get the tumorfound variable from the CSV sheet
tumorfound = [data{:,26}];

% load the updated image files
U = csvimport('Updated_images_for_annotations_state4_newfilepaths_20171205.csv', 'delimiter', ';');


% 0. revisit —> Karin wants to check again
revisit = [];
% 1. unsure —> Edward to look at (later)
unsure = [];
% 2. annotated without files —> Error, need to Revisit (same images as before)
error = [];
% 3. annotated with files without images AND tumorfound==0 —> Finished - no tumor in image
notumor = [];
% 4. annotated with files without images AND tumorfound==1 —> Fredrik needs to update file paths
newpaths = [];
% 5. annotated with files wtih images —> Finished - tumor in image (No action needed)
finished = [];
% 6. needs updated files but not found!
notfound = [];



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
    f6 = 0; 


    % do some operations to handle overlaps ("unsure cases" cannot overlap)
    if f1
        f0=0; f2=0; f3=0; f4=0; f5=0;
    end
    
    

    
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
        % check to see if we can replace the file path
        
        newpaths(end+1) = i;
    end
    if f5
        finished(end+1) = i;
    end
    
    
    % handle updates of the status list
    statusList;
    
    
    % show the test results
    fprintf('case %d  %d %d %d %d %d %d\n', i, f0, f1, f2, f3, f4, f5);
    
    
    % get a final "state" for this case
    state = find(f(2:end));
    for j = 1:numel(idxList)
        data{idxList(j),28} = state;
    end
    
    
end


idxList = [];
for i = 1:numel(statusList)
    id = idList{i};
    if ismember(i, revisit)
        for j = 1:size(data,1)
            if strcmp(data{j,1}, id)
                idxList(end+1) = j;
            end
        end
    end
end

csv_filename = 'Karins_revisits.csv';
fprintf('writing %s\n', csv_filename);
cell2csv(csv_filename, data(idxList,1:18), ';');

keyboard;

% added karin's revisits (13 cases) to lines 2-78 in 
% Updated_images_for_annotations_state4_newfilepaths_20171205.csv





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