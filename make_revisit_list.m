load data/images_for_annotation_20170621.mat

A = [data{:,27}];
Anew = A;
statusListOld = statusList;


setupfor = 'Edward';


switch setupfor
    case 'Edward'
        % set up for Edward
        % when 'skip' was pressed
        Anew(A == 2) = 0;
        
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
            
            if Anew(i) == 0
                statusList(case_num) = 0;
                fprintf('case_num 0 %d\n', case_num);
            end
        end
        


    case 'Karin'

        % set up for Karin
        revisit_list = [57 58 59 60 61 62 63 64 65 66 67 68 73 74 75 76 ...
         133 134 135 136 141 142 143 144 157 158 159 160 169 170 171 ...
         172 181 182 183 184 213 214 215 216 221 222 223 224 233 234 ...
         235 236 237 238 239 240 241 242 243 260 261 262 263 268 269 ...
         270 271 276 277 278 279 280 281 282 283 318 319 320 321 322 ...
         323 324 325 326 355 356 357 358 363 364 365 366 374 375 376 ...
         377 378 378 398 401 423 424 425 426 427 428 429 430 431 432 ...
         433 434 439 440 441 442 510 657 748 904 1193 1245 1522 1566 ...
         1675];
        % when clicked 'done' but no masks were created
        
        current_id = data{1,1};
        case_numbers = zeros(size(data,1),1);
        case_num = 1;
        case_numbers(1) = case_num;
        
        statusList(revisit_list) = 0;
        
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
            
%             if (data{i,26} == 0) && (data{i,27} == 1)
%                Anew(i) = 0; 
%             end
            
            if Anew(i) == 0
                statusList(case_num) = 0;
                fprintf('case_num 0 %d\n', case_num);
            end
        end
    
end



% write the output file
for i = 1:size(data,1)
    data{i,27} = Anew(i);
end

filename = 'data/images_to_revisit_20171205.mat';
fprintf('saving %s\n', filename);
save(filename, 'data', 'dataFields', 'idList', 'statusList');