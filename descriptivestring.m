function str = descriptivestring(handles)

str1 = sprintf('%s, ', datestr(handles.c.A030DiaDat));

switch handles.c.A030Sida
    case 1
        str2 = 'R side, ';
    case 2
        str2 = 'L side, ';
end

switch handles.c.A030ICD03Kod
    case 10 
        str3 = 'breast mammary gland unspecified, ';
    case 20 
        str3 = 'nipple and areola, ';
    case 30
        str3 = 'central portion, ';
    case 40
        str3 = 'upper inner quadrant, ';
    case 50
        str3 = 'lower inner quadrant, ';
    case 60
        str3 = 'upper outer quadrant, ';
    case 70
        str3 = 'lower outer quadrant, ';
    case 80
        str3 = 'axillar utskott, ';
    otherwise
        str3 = [];
end

switch handles.c.A030Screening
    case 1
        str4 = 'Screen detected, ';
    case 2
        str4 = 'Clinic detected, ';
    otherwise
        str4 = [];
end

switch handles.c.A090InvCa
    case 1
        str5 = 'invasive only, ';
    case 2
        str5 = 'in Situ only, ';
    case 3
        str5 = 'mixed invasive and in situ, ';
    case 4
        str5 = 'unknown, ';
    otherwise
        str5 = [];
end

switch handles.c.A090SnomedInv2
    case 10
        str6 = 'ductal, '; 
    case 20
        str6 = 'ductal and lobular, ';
    case 30
        str6 = 'ductal and others, ';
    case 40
        str6 = 'lobular, ';
    case 50
        str6 = 'medullary, ';
    case 60
        str6 = 'other, ';
    otherwise
        str6 = [];
end

% switch handles.c.A090SnomedTis
%     case 10
%         str7 = 'DCIS, ';
%     case 20
%         str7 = 'LCIS, ';
%     case 40
%         str7 = 'DCIS+LCIS, ';
%     case 50
%         str7 = 'Other, ';
%     otherwise
%         str7 = [];
% end
str7 = [];

str8 = sprintf ('%d tumor(s), ', handles.c.A090AntInva);

switch handles.c.A090MultiFok2
    case 1
        str9 = 'not multifocal, ';
    case 2
        str9 = 'multifocal, ';
    otherwise
        str9 = [];
end

str10 = [];
if ~isempty (handles.c.A090HistoTumStl)
    str10 = sprintf('invasive size %d mm, ', handles.c.A090HistoTumStl);
end    

str11 = [];
if ~isempty (handles.c.A090UtbTis)
    str11 = sprintf('in situ size %d mm, ', handles.c.A090UtbTis);
end    

str = [str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11];