function status = checkAnnotation(case_id)

status = 0;

current_id = case_id;


pth = 'C:\Users\mammoai\Desktop\mammo-annotator\Data\annotations\';
filename = fullfile(pth, current_id);
try
    a = load(filename);
catch
    fprintf('Missing file %s\n', case_id);
    status = 0;
end

%     keyboard;
status = 0;
for j = 1:size(a.annotation,1)
    for k = 1:5
        if ~isempty(a.annotation{j,24}{k})
            status = 1;
            %fprintf('annotation found case %d, img %d, an %d\n', i, j, k);
        end
    end
end

if (status == 0)
    fprintf('No annotation case %s\n', case_id);
else
    fprintf('Annotation found case %s\n', case_id);
end

