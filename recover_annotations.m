
% filename = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\Data\annotations\31575451305771374F303565313763397842485935513D3D.mat';
% g = load(filename);


filename = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\Data\images_for_annotation_20170621.mat';
old = load(filename);


dest_folder = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\Data\annotations\';

for i = 1:numel(old.idList)
    
    % only write the file if the data was properly annotated
    if old.statusList(i) ~= 1
        continue;
    end
    
    id = old.idList{i};
    fprintf('working on patient id %s\n', id);
    annotation = {};
    dataFields = old.dataFields;
    counter = 1;
    
    for n = 1:size(old.data,1)
    
        if contains(old.data{n,8}, id)
            annotation(counter,:) = old.data(n,:);
            counter = counter + 1;
        end
    end
    
    annotation
    
    filename = fullfile(dest_folder, [id '.mat']);
    save(filename, 'dataFields', 'annotation');
    fprintf('saved %s\n', filename);

end
