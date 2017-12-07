function buildDatabaseFromCSV(filein)

thiscomp = getenv('computername');

data = csvimport(filein, 'delimiter', ';');
[pth name ext] = fileparts(filein);

fileout = fullfile([pth '\'], [name '.mat']);

% if isequal(thiscomp, 'DESKTOP-24IIS50')
%     fileout = fullfile([pth '\'], [name '.mat']);
% else
%     fileout = fullfile('C:\Users\mammoai\Desktop\Annotator\Data\', [name '.mat']);
% end

% dataFields = {'studyPersonaID', 'A030DiaDat', 'studydate', 'viewposition', ...
%     'x_examination_type', 'x_round', 'sourcefile', 'A030ICDO3Kod', 'A030Sida', ...
%     'A090InvCa', 'A090SnomedInv2', 'A090SnomedTis', 'A090AntInva', 'A090MultiFok2', ...
%     'A090HistoTumStl', 'A090UtbTis'};

dataFields = data(1,:);
data = data(2:end,:);

for i=1:size(data,1)
   for j=1:size(data,2) 
        switch j
            case {9,10,11,12,13,14,15,16,17,18}    
                if ischar(data{i,j})
                    data{i,j} = str2num(data{i,j});
                end
                
            case 4
                % remove whitespace from laterality
                data{i,j} = strtrim(data{i,j});
                
            case 8
                % replace the file location with the correct one!
%                 if isequal(thiscomp, 'DESKTOP-24IIS50')
%                     [pth name ext] = fileparts(data{i,j});
%                     C = strsplit(pth,'/');
%                     newpath = ['D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\Data' '\' C{end} '\'];
%                     % strjoin
%                     data{i,j} = fullfile(newpath, [name ext]);
%                 else
%                     [pth name ext] = fileparts(data{i,j});
%                     filename = data{i,j};
                    if startsWith(data{i,j}(1), 'G')
                        data{i,j}(1) = 'I';
                    end
                        
%                 end
                
                    
                
                if ~exist(data{i,j})
                    warning('could not file file %s', data{i,j});
                end
                
                
%             case 11
%                 dvec = datevec(data{i,j});
%                 data{i,j} = datenum(dvec);
%                 %datestr(datenum) to get a text string
        end
   end
end


% make a vector of unique cases
ID_list_complete = data(:,1);
idList = unique(ID_list_complete);


% make a vector of case annotation status
statusList = zeros(size(idList));

% add our annotations (annotator name, annotation time, comments, mask file, vector
% file)
dataFields{19} = 'contrastCenter';
dataFields{20} = 'contrastWidth';
dataFields{21} = 'annotatorName';
dataFields{22} = 'anntationTime';
dataFields{23} = 'comments';
dataFields{24} = 'maskfile';
dataFields{25} = 'contourfile';
dataFields{26} = 'noTumorFound';
dataFields{27} = 'annotationStatus';
data{1,27} = [];

% save everything to file
save(fileout, 'data', 'dataFields', 'idList', 'statusList'); 
fprintf('saved to %s\n', fileout);

% keyboard;


