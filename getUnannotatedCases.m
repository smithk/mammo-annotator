function missing = getUnannotatedCases()

load data/images_for_annotation_20170621.mat

nofile = [];
existing = [];
missing = [];
ids = {};

for i = 1:numel(statusList)
    current_id = data{i,1};
%     current_id = case_id;
    
    
    pth = 'C:\Users\mammoai\Desktop\mammo-annotator\Data\annotations\';
    filename = fullfile(pth, current_id);
    try 
        a = load(filename);
    catch
        %fprintf('Missing file %d\n', i);
        foundAnnotation = 0;
        nofile = [nofile i];
        continue;
    end
    
%     keyboard;
    foundAnnotation = 0;
    for j = 1:size(a.annotation,1)
        for k = 1:5
            if ~isempty(a.annotation{j,24}{k})
                foundAnnotation = 1;
                %fprintf('annotation found case %d, img %d, an %d\n', i, j, k);
            end
        end
    end
    
    if (foundAnnotation == 0)
        missing = [missing i];
        ids{end+1} = current_id;
%         fprintf('No annotation case %d\n', i);
    else
        existing = [existing i]; 
%         fprintf('Annotation found case %d\n', i);
    end

end
