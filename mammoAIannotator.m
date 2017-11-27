


function varargout = mammoAIannotator(varargin)
% MAMMOAIANNOTATOR MATLAB code for mammoAIannotator.fig
%      MAMMOAIANNOTATOR, by itself, creates a new MAMMOAIANNOTATOR or raises the existing
%      singleton*.
%
%      H = MAMMOAIANNOTATOR returns the handle to a new MAMMOAIANNOTATOR or the handle to
%      the existing singleton*.
%
%      MAMMOAIANNOTATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAMMOAIANNOTATOR.M with the given input arguments.
%
%      MAMMOAIANNOTATOR('Property','Value',...) creates a new MAMMOAIANNOTATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mammoAIannotator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mammoAIannotator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mammoAIannotator

% Last Modified by GUIDE v2.5 21-Jun-2017 13:04:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mammoAIannotator_OpeningFcn, ...
                   'gui_OutputFcn',  @mammoAIannotator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before mammoAIannotator is made visible.
function mammoAIannotator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mammoAIannotator (see VARARGIN)

% Choose default command line output for mammoAIannotator
handles.output = hObject;
handles.hMenu       = gcf;  % handle for the menu figure
handles.computer_name = getenv('computername');



% VIEW 1 - handles for annotation figure 1
handles.hFig1        = figure('Toolbar','none','Menubar','none');
if ~isequal(handles.computer_name, 'DESKTOP-24IIS50')
    set(handles.hFig1, 'Position', [1284 230 655 1564]);
else
    set(handles.hFig1, 'Position', [1923 43 480 1007]);
end
set(handles.hFig1, 'Color', [.05 .05 .1]);
set(handles.hFig1, 'Name', 'View 1');

% VIEW 2 - handles for annotation figure 2
handles.hFig2        = figure('Toolbar','none','Menubar','none');
if ~isequal(handles.computer_name, 'DESKTOP-24IIS50')
    set(handles.hFig2, 'Position', [1284+655 230 655 1564]);
else
    set(handles.hFig2, 'Position', [1923+480 43 480 1007]);
end
set(handles.hFig2, 'Color', [.05 .05 .1]);
set(handles.hFig2, 'Name', 'View 2');

% VIEW 3 - handles for annotation figure 3
handles.hFig3        = figure('Toolbar','none','Menubar','none');
if ~isequal(handles.computer_name, 'DESKTOP-24IIS50')
    set(handles.hFig3, 'Position', [2925 230 655 1564]);
else
    set(handles.hFig3, 'Position', [1923+2*480 43 480 1007]);
end
set(handles.hFig3, 'Color', [.05 .05 .1]);
set(handles.hFig3, 'Name', 'View 3');

% VIEW 4 - handles for annotation figure 4
handles.hFig4        = figure('Toolbar','none','Menubar','none');
if ~isequal(handles.computer_name, 'DESKTOP-24IIS50')
    set(handles.hFig4, 'Position', [3580 229 655 1564]);
else
    set(handles.hFig4, 'Position', [1923+3*480 43 480 1007]);
end
set(handles.hFig4, 'Color', [.05 .05 .1]);
set(handles.hFig4, 'Name', 'View 4');


% set initial parameters
if ~isequal(handles.computer_name, 'DESKTOP-24IIS50')
%     handles.datafile = 'C:\Users\mammoai\Desktop\Annotator\test_small.mat';
%     handles.datafile = 'C:\Users\mammoai\Desktop\Annotator\Images_for_annotation_20170602_semicolon.mat';
    handles.datafile = 'C:\Users\mammoai\Desktop\Annotator\Data\images_for_annotation_20170621.mat';
    handles.datapath = 'C:\Users\mammoai\Desktop\Annotator\Data\annotations\';
    handles.csv_out = 'C:\Users\mammoai\Desktop\Annotator\annotations.csv';
else
%     handles.datafile = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\test_small.mat';
    handles.datafile = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\Data\images_for_annotation_20170621.mat';
    handles.datapath = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\Data\annotations\';
    handles.csv_out = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\annotations.csv';
end
if ~exist(handles.datapath, 'dir')
    mkdir(handles.datapath);
end
handles.viewtypes = [1 2 3 4];
handles.current_date = now;
handles.c.side = [];
handles.c.id = [];
handles.c.contrast = zeros(8,2);
handles.c.default_contrast = zeros(8,2);
handles.thisSession = [];
handles.offcolors = {[.87 .8 .54],[.57 .77 .57],[.55 .69 .81],[.88 .6 .59],[.83 .59 .83]};
handles.colors = {[1 .8 0],[.26 .96 .27],[.29 .67 1],[.98 .21 .18],[1 .25 1]};
handles.aCh = [];
handles.aCtype = [];
handles.aCnum = [];
handles.aPh = [];
handles.aPtype = [];
handles.aPnum = [];

% set key press handlers for hFig1
handles.hManager = uigetmodemanager(handles.hFig1);
try
    set(handles.hManager.WindowListenerHandles, 'Enable', 'off');  % HG1
catch
    [handles.hManager.WindowListenerHandles.Enabled] = deal(false);  % HG2
end
set(handles.hFig1, 'WindowKeyPressFcn', []);
set(handles.hFig1, 'KeyPressFcn', {@keypresshandler1, handles});
% set key press handlers for hFig2
handles.hManager = uigetmodemanager(handles.hFig2);
try
    set(handles.hManager.WindowListenerHandles, 'Enable', 'off');  % HG1
catch
    [handles.hManager.WindowListenerHandles.Enabled] = deal(false);  % HG2
end
set(handles.hFig2, 'WindowKeyPressFcn', []);
set(handles.hFig2, 'KeyPressFcn', {@keypresshandler2, handles});
% set key press handlers for hFig3
handles.hManager = uigetmodemanager(handles.hFig3);
try
    set(handles.hManager.WindowListenerHandles, 'Enable', 'off');  % HG1
catch
    [handles.hManager.WindowListenerHandles.Enabled] = deal(false);  % HG2
end
set(handles.hFig3, 'WindowKeyPressFcn', []);
set(handles.hFig3, 'KeyPressFcn', {@keypresshandler3, handles});
% set key press handlers for hFig4
handles.hManager = uigetmodemanager(handles.hFig4);
try
    set(handles.hManager.WindowListenerHandles, 'Enable', 'off');  % HG1
catch
    [handles.hManager.WindowListenerHandles.Enabled] = deal(false);  % HG2
end
set(handles.hFig4, 'WindowKeyPressFcn', []);
set(handles.hFig4, 'KeyPressFcn', {@keypresshandler4, handles});


% load the database
handles = loadDatabase(handles);

% load the next case and draw it
handles = loadNextCase(handles);

% draw the image(s) and the annotation(s)
handles = updateToggle(handles);
handles = firstDraw(handles);
handles = drawtext(handles);
setInitialViewLocations(handles);


% Update handles structure
guidata(hObject, handles);

if isequal(handles.computer_name, 'DESKTOP-24IIS50')
    set(handles.figure1, 'Position', [55 3.6154 200.4000 55.9231]);
else
   set(handles.figure1, 'Position', [54 3.6923 200.4000 55.9231]);
end

% UIWAIT makes mammoAIannotator wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = mammoAIannotator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;






function handles = loadDatabase(handles)

load(handles.datafile);
handles.data = data;
handles.dataFields = dataFields;
handles.idList = idList;
handles.statusList = statusList;
handles.thisSession = zeros(numel(statusList),2);



function handles = loadNextCase(handles)

% find the next unannotated case id (index n)
% TODO: how can we fix this so you can go back and get skipped annotations?
% handles.n = find(handles.statusList ~= 1, 1, 'first');
handles.n = find(handles.statusList == 0, 1, 'first');


% karin's list of cases to revisit
revisit_list = [318 374 378 398 401 510 657 748 904 1193 1245 1522 1566 1675];


% get id from index n
handles.c.id = handles.idList{handles.n};
str = sprintf('StudyPersonID: %s', handles.c.id);
set(handles.textstudyPersonID, 'String', str);

% update the case progress
str = sprintf('Case: %d/%d', handles.n, numel(handles.statusList));
set(handles.textCaseNum, 'String', str);
str = sprintf('\n%d\n%d', sum(handles.thisSession(:,2) == 1), sum(handles.thisSession(:,2) == 2));
set(handles.textProgress1, 'String', str);
str = sprintf('\n%d\n%d\n%d', sum(handles.statusList==1), sum(handles.statusList==2), sum(handles.statusList==0));
set(handles.textProgress2, 'String', str);

% command line output
fprintf('-----------------------------------------------------------\nloading case %d/%d, StudyPersonID: %s\n', handles.n, numel(handles.statusList), handles.c.id);

% get rows for this case from the data
handles.c.caseInds = startsWith(handles.data(:,1), handles.c.id);
handles.c.data = handles.data(handles.c.caseInds,:);

% which side is the cancer located?
handles.c.A030Sida = handles.c.data{1,10};
if handles.c.A030Sida == 1
    handles.c.side = 'R';
else
    handles.c.side = 'L';
end

handles.c.type = zeros(size(handles.c.data,1),1);

% TODO - I assume the first entry in the data have good values. This may be
% problematic.

% get other attributes
handles.c.A030DiaDat = handles.c.data{1,2}; if isempty(handles.c.A030DiaDat); handles.c.A030DiaDat = -1; end;
handles.c.A030ICD03Kod = handles.c.data{1,9}; if isempty(handles.c.A030ICD03Kod); handles.c.A030ICD03Kod= -1; end;
handles.c.A030Screening = handles.c.data{1,11}; if isempty(handles.c.A030Screening); handles.c.A030Screening= -1; end;
handles.c.A090InvCa = handles.c.data{1,12}; if isempty(handles.c.A090InvCa); handles.c.A090InvCa= -1; end;
handles.c.A090SnomedInv2 = handles.c.data{1,13}; if isempty(handles.c.A090SnomedInv2); handles.c.A090SnomedInv2 = -1; end;
handles.c.A090SnomedTis = handles.c.data{1,14}; if isempty(handles.c.A090SnomedTis); handles.c.A090SnomedTis= -1; end;
handles.c.A090AntInva = handles.c.data{1,15}; if isempty(handles.c.A090AntInva); handles.c.A090AntInva= -1; end;
handles.c.A090MultiFok2 = handles.c.data{1,16}; if isempty(handles.c.A090MultiFok2); handles.c.A090MultiFok2= -1; end;
handles.c.A090HistoTumStl = handles.c.data{1,17}; if isempty(handles.c.A090HistoTumStl); handles.c.A090HistoTumStl= -1; end;
handles.c.A090UtbTis = handles.c.data{1,18}; if isempty(handles.c.A090UtbTis); handles.c.A090UtbTis= -1; end;


% sidematches = startsWith(handles.c.data(:,3), handles.c.side);
leftmatches = startsWith(handles.c.data(:,4), 'L');
rightmatches = startsWith(handles.c.data(:,4), 'R');
mlomatches = startsWith(handles.c.data(:,5), 'MLO');
ccmatches = startsWith(handles.c.data(:,5), 'CC');
round1matches = ([handles.c.data{:,7}] == 1)';
round2matches = ([handles.c.data{:,7}] == 2)';


% LpriorMLO, ind=1
matchvec = leftmatches & mlomatches & round1matches;
type = 1; str = 'LpriorMLO';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% LcurrMLO, ind=2
matchvec = leftmatches & mlomatches & round2matches;
type = 2; str = 'LcurrMLO';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% LpriorCC, ind=3
matchvec = leftmatches & ccmatches & round1matches;
type = 3; str = 'LpriorCC';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% LcurrCC, ind=4
matchvec = leftmatches & ccmatches & round2matches;
type = 4; str = 'LcurrCC';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% RpriorMLO, ind=5
matchvec = rightmatches & mlomatches & round1matches;
type = 5; str = 'RpriorMLO';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% RcurrMLO, ind=6
matchvec = rightmatches & mlomatches & round2matches;
type = 6; str = 'RcurrMLO';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% RpriorCC, ind=7
matchvec = rightmatches & ccmatches & round1matches;
type = 7; str = 'RpriorCC';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% RcurrCC, ind=8
matchvec = rightmatches & ccmatches & round2matches;
type = 8; str = 'RcurrCC';
handles = loadimage(handles, matchvec, type, str);
% handles = loadimage_temp(handles, matchvec, type, str);

% determine the logic of what to show
if isequal(handles.c.side, 'L')
    handles.viewtypes = [1 2 3 4];
    if isempty(handles.c.images{1})
        handles.viewtypes(1) = 6;
    end
    if isempty(handles.c.images{3})
        handles.viewtypes(3) = 8;
    end
else
	handles.viewtypes = [5 6 7 8];
    if isempty(handles.c.images{5})
        handles.viewtypes(1) = 2;
    end
    if isempty(handles.c.images{7})
        handles.viewtypes(3) = 4;
    end
end
set(handles.popupmenuview1, 'Value', handles.viewtypes(1));
set(handles.popupmenuview2, 'Value', handles.viewtypes(2));
set(handles.popupmenuview3, 'Value', handles.viewtypes(3));
set(handles.popupmenuview4, 'Value', handles.viewtypes(4));

% clear the comment string
set(handles.editComment, 'String', '');

% delete all existing annotations
for i = 1:numel(handles.aCh)
    delete(handles.aCh(i));
end
handles.aCtype = [];
handles.aCnum = [];
for i = 1:numel(handles.aPh)
    delete(handles.aPh(i));
end
handles.aPtype = [];
handles.aCnum = [];
handles.c.masks = cell(8,5);
handles.c.points = cell(8,5);






function [im dcon con] = loadimage_temp(handles, matchvec, type, str)

fprintf('loading images randomly for Case %d %s\n', handles.n, str);

if ~isequal(handles.computer_name, 'DESKTOP-24IIS50')
    pth = 'C:\Users\mammoai\Desktop\Annotator\Data\';
else
    pth = 'D:\Dropbox\Documents-Kevin\Projects\MammoAI\Annotator\TestData\';
end
        
handles.c.type(find(matchvec, 1, 'first')) = type;

r = rand();
if r < .1
    filename = '';
%     handles.c.images{type} = [];
%     handles.c.default_contrast(type,:) = [2000 4000];
%     handles.c.contrast(type,:) = [2000 4000];
    im = [];
    dcon = [2000 4000];
    con = [2000 4000];
    return;
end

switch type
    case {1,2}
        if r < .3
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D6735486C4D6C5A6939647A37774455364A6367436A4C48_20080610_2.dcm'];
        elseif r < .5
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D67374561664F6E4D4756326C514455364A6367436A4C48_20100614_4.dcm'];
        elseif r < .7
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D673568615A614E722B565347774455364A6367436A4C48_20100406_2.dcm'];
        else
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D6735484745322B6E36694C49414455364A6367436A4C48_20111121_2.dcm'];
        end
    case {3,4}
        if r < .3
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D6735486C4D6C5A6939647A37774455364A6367436A4C48_20080610_4.dcm'];
        elseif r < .5
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D67374561664F6E4D4756326C514455364A6367436A4C48_20100614_6.dcm'];
        elseif r < .7
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D673568615A614E722B565347774455364A6367436A4C48_20100406_4.dcm'];
        else
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D6735484745322B6E36694C49414455364A6367436A4C48_20111121_5.dcm'];
        end
    case {5,6}
        if r < .3
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D6735486C4D6C5A6939647A37774455364A6367436A4C48_20080610_1.dcm'];
        elseif r < .5
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D67374561664F6E4D4756326C514455364A6367436A4C48_20100614_2.dcm'];
        elseif r < .7
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D673568615A614E722B565347774455364A6367436A4C48_20100406_1.dcm'];
        else
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D6735484745322B6E36694C49414455364A6367436A4C48_20111121_1.dcm'];
        end
    case {7,8}
        if r < .3
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D6735486C4D6C5A6939647A37774455364A6367436A4C48_20080610_3.dcm'];
        elseif r < .5
            filename = [pth '2B446565326F6D442B2F704D323972383253433455513D3D\2B446565326F6D442B2F704D323972383253433455513D3D_537153536F422F464D67374561664F6E4D4756326C514455364A6367436A4C48_20100614_5.dcm'];
        elseif r < .7
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D673568615A614E722B565347774455364A6367436A4C48_20100406_3.dcm'];
        else
            filename = [pth '2B4B65304845774E7852364E334935366D34745863513D3D\2B4B65304845774E7852364E334935366D34745863513D3D_537153536F422F464D6735484745322B6E36694C49414455364A6367436A4C48_20111121_4.dcm'];
        end
end
% handles.c.imagefiles{type} = filename;
% handles.c.images{type} = dicomread(filename);
% info = dicominfo(filename);
% handles.c.default_contrast(type,:) = [info.WindowCenter(1) info.WindowWidth(1)];
% handles.c.contrast(type,:) = [info.WindowCenter(1) info.WindowWidth(1)];
im = dicomread(filename);
info = dicominfo(filename);
dcon = [info.WindowCenter(1) info.WindowWidth(1)];
con = [info.WindowCenter(1) info.WindowWidth(1)];


function handles = loadimage(handles, matchvec, type, str)

% check how many matches there are in the database, pick a best ind
valid_inds = find(matchvec);
if numel(valid_inds) > 1
    warning('\nmultiple image entries found for Case %d %s\n', handles.n, str);  
    for i = 1:numel(valid_inds)
        datenums(i) = datenum(datevec(handles.c.data(valid_inds(i), 3)));
    end
    [val, y] = max(datenums); %#ok<ASGLU>
    ind = valid_inds(y);    
    fprintf('choosing the most recent image from %s\n', datestr(datenums(y)));
elseif numel(valid_inds) == 0
    fprintf('found %d valid entries for Case %d %s\n', numel(valid_inds), handles.n, str);
    handles.c.imagefiles{type} = '';
    handles.c.images{type} = [];
    handles.c.default_contrast(type,:) = [2000 4000];
    handles.c.contrast(type,:) = [2000 4000];
    return;
else
    ind = valid_inds;
end
handles.c.type(ind) = type;

% get the filename
filename = handles.c.data{ind,8};
handles.c.imagefiles{type} = filename;

if exist(filename, 'file')  
    % get the contrast info from the dicom file
    info = dicominfo(filename);
    if ~isfield(info, 'WindowCenter')
        handles.c.default_contrast(type,:) = [2000 4000];
        handles.c.contrast(type,:) = [2000 4000];
        fprintf('Dicom file does not contain contrast settings!\n');
    else
        handles.c.default_contrast(type,:) = [info.WindowCenter(1) info.WindowWidth(1)];
        handles.c.contrast(type,:) = [info.WindowCenter(1) info.WindowWidth(1)];
    end
    % read the image
    handles.c.images{type} = dicomread(filename);
    fprintf('found %d valid entries for Case %d %s, loaded image successfully\n', numel(valid_inds), handles.n, str);
elseif isequal(handles.computer_name, 'DESKTOP-24IIS50')
    [im, dcon, con] = loadimage_temp(handles, matchvec, type, str);
    handles.c.images{type} = im;
    handles.c.default_contrast(type,:) = dcon;
    handles.c.contrast(type,:) = con;
else
    fprintf('found %d valid entries for Case %d %s, failed to load image!\n', numel(valid_inds), handles.n, str);
    handles.c.images{type} = [];
    handles.c.default_contrast(type,:) = [2000 4000];
    handles.c.contrast(type,:) = [2000 4000];
end


% check to see if the image is inverted, and handle that case
I = handles.c.images{type};
if mode(I(:)) > 3000 
    handles.c.images{type} = 65535 - I; %max(I(:)) - I;
    handles.c.default_contrast(type,1) = 65535 - handles.c.default_contrast(type,1);
    handles.c.contrast(type,1) = 65535 - handles.c.contrast(type,1);
    set(handles.editComment, 'String', 'Inverted image.');
end
% keyboard;






function lims = contrastWindowToLims(win)
lims(1) = win(1) - round(win(2)/2);
lims(2) = win(1) + round(win(2)/2);
lims = lims / 65535;
lims(lims < 0) = 0;
lims(lims > 1) = 1;



function handles = refreshFig1(handles)
type = handles.viewtypes(1);
% update the images in view 1 (handles.sc1)
api = iptgetapi(handles.sc1);
if ~isempty(handles.c.images{type})
    api.replaceImage(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'PreserveView', true);
else
    api.replaceImage(zeros(4000,3000), 'PreserveView', true);
end
% refresh contrast setting
set(handles.editwincenter1, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth1, 'String', num2str(handles.c.contrast(type,2)));
% update text
handles = refreshText(handles);

function handles = refreshFig2(handles)
type = handles.viewtypes(2);
% update the images in view 2 (handles.sc2)
api = iptgetapi(handles.sc2);
if ~isempty(handles.c.images{type})
    api.replaceImage(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'PreserveView', true);
else
    api.replaceImage(zeros(4000,3000), 'PreserveView', true);
end
% refresh contrast setting
set(handles.editwincenter2, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth2, 'String', num2str(handles.c.contrast(type,2)));
% update text
handles = refreshText(handles);



function handles = refreshFig3(handles)
type = handles.viewtypes(3);
% update the images in view 3 (handles.sc3)
api = iptgetapi(handles.sc3);
if ~isempty(handles.c.images{type})
    api.replaceImage(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'PreserveView', true);
else
    api.replaceImage(zeros(4000,3000), 'PreserveView', true);
end
% refresh contrast setting
set(handles.editwincenter3, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth3, 'String', num2str(handles.c.contrast(type,2)));
% update text
handles = refreshText(handles);

function handles = refreshFig4(handles)
type = handles.viewtypes(4);
% update the images in view 4 (handles.sc3)
api = iptgetapi(handles.sc4);
if ~isempty(handles.c.images{type})
    api.replaceImage(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'PreserveView', true);
else
    api.replaceImage(zeros(4000,3000), 'PreserveView', true);
end
% refresh contrast setting
set(handles.editwincenter4, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth4, 'String', num2str(handles.c.contrast(type,2)));
% update text
handles = refreshText(handles);




function handles = firstDraw(handles)

% VIEW 1
type = handles.viewtypes(1);
% show the image and make a scrollpanel
handles.ax1 = axes(handles.hFig1);
set(handles.ax1, 'Position', [0 0 .25 1]);
if ~isempty(handles.c.images{type})
    handles.im1 = imshow(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'Parent', handles.ax1);
else
    handles.im1 = imshow(zeros(4000,3000), 'Parent', handles.ax1);
end
handles.sc1 = imscrollpanel(handles.hFig1, handles.im1);
% create a magnification box 
handles.hMagBox1 = immagbox(handles.hFig1, handles.im1);
pos = get(handles.hMagBox1,'Position');
set(handles.hMagBox1,'Position',[0 0 pos(3) pos(4)])
handles.ov1 = imoverviewpanel(handles.uipanel1,handles.im1);
str = get(handles.popupmenuview1, 'String');
set(handles.hFig1, 'Name', str{type});
set(handles.editwincenter1, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth1, 'String', num2str(handles.c.contrast(type,2)));

% VIEW 2
type = handles.viewtypes(2);
% show the image and make a scrollpanel
handles.ax2 = axes(handles.hFig2);
set(handles.ax2, 'Position', [0 0 .25 1]);
if ~isempty(handles.c.images{type})
    handles.im2 = imshow(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'Parent', handles.ax2);
else
    handles.im2 = imshow(zeros(4000,3000), 'Parent', handles.ax2);
end
handles.sc2 = imscrollpanel(handles.hFig2, handles.im2);
% create a magnification box 
handles.hMagBox2 = immagbox(handles.hFig2, handles.im2);
pos = get(handles.hMagBox2,'Position');
set(handles.hMagBox2,'Position',[0 0 pos(3) pos(4)])
handles.ov2 = imoverviewpanel(handles.uipanel2,handles.im2);
str = get(handles.popupmenuview2, 'String');
set(handles.hFig2, 'Name', str{type});
set(handles.editwincenter2, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth2, 'String', num2str(handles.c.contrast(type,2)));

% VIEW 3
type = handles.viewtypes(3);
% show the image and make a scrollpanel
handles.ax3 = axes(handles.hFig3);
set(handles.ax3, 'Position', [0 0 .25 1]);
if ~isempty(handles.c.images{type})
    handles.im3 = imshow(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'Parent', handles.ax3);
else
    handles.im3 = imshow(zeros(4000,3000), 'Parent', handles.ax3);
end
handles.sc3 = imscrollpanel(handles.hFig3, handles.im3);
% create a magnification box 
handles.hMagBox3 = immagbox(handles.hFig3, handles.im3);
pos = get(handles.hMagBox3,'Position');
set(handles.hMagBox3,'Position',[0 0 pos(3) pos(4)])
handles.ov3 = imoverviewpanel(handles.uipanel3,handles.im3);
str = get(handles.popupmenuview3, 'String');
set(handles.hFig3, 'Name', str{type});
set(handles.editwincenter3, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth3, 'String', num2str(handles.c.contrast(type,2)));

% VIEW 4
type = handles.viewtypes(4);
% show the image and make a scrollpanel
handles.ax4 = axes(handles.hFig4);
set(handles.ax4, 'Position', [0 0 .25 1]);
if ~isempty(handles.c.images{type})
    handles.im4 = imshow(imadjust(handles.c.images{type}, contrastWindowToLims(handles.c.contrast(type,:)), []), 'Parent', handles.ax4);
else
    handles.im4 = imshow(zeros(4000,3000), 'Parent', handles.ax4);
end
handles.sc4 = imscrollpanel(handles.hFig4, handles.im4);
% create a magnification box 
handles.hMagBox4 = immagbox(handles.hFig4, handles.im4);
pos = get(handles.hMagBox4,'Position');
set(handles.hMagBox4,'Position',[0 0 pos(3) pos(4)])
handles.ov4 = imoverviewpanel(handles.uipanel4,handles.im4);
str = get(handles.popupmenuview4, 'String');
set(handles.hFig4, 'Name', str{type});
set(handles.editwincenter4, 'String', num2str(handles.c.contrast(type,1)));
set(handles.editwinwidth4, 'String', num2str(handles.c.contrast(type,2)));



function handles = drawtext(handles)
smFontSize = 16;
bgFontSize = 24;
% VIEW 1
str = descriptivestring(handles);
handles.thandles(1) = annotation(handles.sc1, 'textbox', [.02 .01 .95 .05], 'String', str, 'Color', [1 .8 0], 'FontSize', smFontSize, 'LineStyle', 'none');
type = handles.viewtypes(1);
str = get(handles.popupmenuview1, 'String');
handles.thandles(2) = annotation(handles.sc1, 'textbox', [.02 .9 .6 .1], 'String', str{type}, 'Color', [1 .8 0], 'FontSize', bgFontSize, 'LineStyle', 'none');
% VIEW 2
str = descriptivestring(handles);
handles.thandles(3) = annotation(handles.sc2, 'textbox', [.02 .01 .95 .05], 'String', str, 'Color', [1 .8 0], 'FontSize', smFontSize, 'LineStyle', 'none');
type = handles.viewtypes(2);
str = get(handles.popupmenuview2, 'String');
handles.thandles(4) = annotation(handles.sc2, 'textbox', [.02 .9 .6 .1], 'String', str{type}, 'Color', [1 .8 0], 'FontSize', bgFontSize, 'LineStyle', 'none');
% VIEW 3
str = descriptivestring(handles);
handles.thandles(5) = annotation(handles.sc3, 'textbox', [.02 .01 .95 .05], 'String', str, 'Color', [1 .8 0], 'FontSize', smFontSize, 'LineStyle', 'none');
type = handles.viewtypes(3);
str = get(handles.popupmenuview1, 'String');
handles.thandles(6) = annotation(handles.sc3, 'textbox', [.02 .9 .6 .1], 'String', str{type}, 'Color', [1 .8 0], 'FontSize', bgFontSize, 'LineStyle', 'none');
% VIEW 4
str = descriptivestring(handles);
handles.thandles(7) = annotation(handles.sc4, 'textbox', [.02 .01 .95 .05], 'String', str, 'Color', [1 .8 0], 'FontSize', smFontSize, 'LineStyle', 'none');
type = handles.viewtypes(4);
str = get(handles.popupmenuview4, 'String');
handles.thandles(8) = annotation(handles.sc4, 'textbox', [.02 .9 .6 .1], 'String', str{type}, 'Color', [1 .8 0], 'FontSize', bgFontSize, 'LineStyle', 'none');


function handles = refreshText(handles)
str = descriptivestring(handles);
set(handles.thandles(1), 'String', str);
set(handles.thandles(3), 'String', str);
set(handles.thandles(5), 'String', str);
set(handles.thandles(7), 'String', str);
% view 1
type = handles.viewtypes(1);
str = get(handles.popupmenuview1, 'String');
set(handles.thandles(2), 'String', str{type});
set(handles.hFig1, 'Name', str{type});
% view 2
type = handles.viewtypes(2);
str = get(handles.popupmenuview2, 'String');
set(handles.thandles(4), 'String', str{type});
set(handles.hFig2, 'Name', str{type});
% view 3
type = handles.viewtypes(3);
str = get(handles.popupmenuview3, 'String');
set(handles.thandles(6), 'String', str{type});
set(handles.hFig3, 'Name', str{type});
% view 4
type = handles.viewtypes(4);
str = get(handles.popupmenuview4, 'String');
set(handles.thandles(8), 'String', str{type});
set(handles.hFig4, 'Name', str{type});



function setInitialViewLocations(handles)

if ~isequal(handles.computer_name, 'DESKTOP-24IIS50')
    % set initial window views
    if isequal(handles.c.side, 'L')
        api = iptgetapi(handles.sc1);
        api.setVisibleLocation([0.5000   .5]);
        api.setMagnification(.40);
        api = iptgetapi(handles.sc2);
        api.setVisibleLocation([0.5000  .5]);
        api.setMagnification(.40);
        api = iptgetapi(handles.sc3);
        api.setVisibleLocation([0.5000  .5]);
        api.setMagnification(.40);
        api = iptgetapi(handles.sc4);
        api.setVisibleLocation([0.5000  .5]);
        api.setMagnification(.40);
    else
        api = iptgetapi(handles.sc1);
        api.setVisibleLocation([2600 .5]);
        api.setMagnification(.40);
        api = iptgetapi(handles.sc2);
        api.setVisibleLocation([2600  .5]);
        api.setMagnification(.40);
        api = iptgetapi(handles.sc3);
        api.setVisibleLocation([2600  .5]);
        api.setMagnification(.40);
        api = iptgetapi(handles.sc4);
        api.setVisibleLocation([2600  .5]);
        api.setMagnification(.40);
    end
else
    % set initial window views
    if isequal(handles.c.side, 'L')
        api = iptgetapi(handles.sc1);
        api.setVisibleLocation([0.5000  574.9077]);
        api.setMagnification(.2475);
        api = iptgetapi(handles.sc2);
        api.setVisibleLocation([0.5000  158.4394]);
        api.setMagnification(.2475);
        api = iptgetapi(handles.sc3);
        api.setVisibleLocation([0.5000  526.2052]);
        api.setMagnification(.2475);
        api = iptgetapi(handles.sc4);
        api.setVisibleLocation([0.5000  510.2497]);
        api.setMagnification(.2475);
    else
        api = iptgetapi(handles.sc1);
        api.setVisibleLocation([621 .5]);
        api.setMagnification(.2475);
        api = iptgetapi(handles.sc2);
        api.setVisibleLocation([1441.6  .5]);
        api.setMagnification(.2475);
        api = iptgetapi(handles.sc3);
        api.setVisibleLocation([621  .5]);
        api.setMagnification(.2475);
        api = iptgetapi(handles.sc4);
        api.setVisibleLocation([1441.6  .5]);
        api.setMagnification(.2475);
    end
end



function keypresshandler1(src, evnt, handles)
handles = guidata(handles.figure1);
type = handles.viewtypes(1);
disp(['=>you pressed "' evnt.Key '"']);
switch evnt.Key
    case 'space'
        handles = createAnnotation(handles);
    case 'period'
        coords = get(handles.ax1,'CurrentPoint');
        api = iptgetapi(handles.sc1);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag * 4/3, coords(1), coords(3));
    case 'comma'
        coords = get(handles.ax1,'CurrentPoint');
        api = iptgetapi(handles.sc1);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag *3/4, coords(1), coords(3));
    case 'uparrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) + 50;
        set(handles.editwinwidth1, 'String', num2str(handles.c.contrast(type,2)));
        handles = refreshFig1(handles);
    case 'downarrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) - 50;
        set(handles.editwinwidth1, 'String', num2str(handles.c.contrast(type,2)));
        handles = refreshFig1(handles);
    case 'leftarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) - 50;
        set(handles.editwincenter1, 'String', num2str(handles.c.contrast(type,1)));
        handles = refreshFig1(handles);
    case 'rightarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) + 50;
        set(handles.editwincenter1, 'String', num2str(handles.c.contrast(type,1)));
        handles = refreshFig1(handles);
%     case '1'
%         uibuttongroup1_SelectionChangedFcn();
% %         '2','3','4','5','6','7','8','9','0'}
        
%         uibuttongroup1_SelectionChangedFcn;
        
    otherwise
end
guidata(handles.figure1, handles);


function keypresshandler2(src, evnt, handles)
handles = guidata(handles.figure1);
type = handles.viewtypes(2);
disp(['=>you pressed "' evnt.Key '"']);
switch evnt.Key
    case 'space'
        handles = createAnnotation(handles);
    case 'period'
        coords = get(handles.ax2,'CurrentPoint');
        api = iptgetapi(handles.sc2);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag * 4/3, coords(1), coords(3));
    case 'comma'
        coords = get(handles.ax2,'CurrentPoint');
        api = iptgetapi(handles.sc2);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag *3/4, coords(1), coords(3));
    case 'uparrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) + 50;
        set(handles.editwinwidth2, 'String', num2str(handles.c.contrast(type,2)));
        handles = refreshFig2(handles);
    case 'downarrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) - 50;
        set(handles.editwinwidth2, 'String', num2str(handles.c.contrast(type,2)));
        handles = refreshFig2(handles);
    case 'leftarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) - 50;
        set(handles.editwincenter2, 'String', num2str(handles.c.contrast(type,1)));
        handles = refreshFig2(handles);
    case 'rightarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) + 50;
        set(handles.editwincenter2, 'String', num2str(handles.c.contrast(type,1)));
        handles = refreshFig2(handles);
    otherwise
end
guidata(handles.figure1, handles);

function keypresshandler3(src, evnt, handles)
handles = guidata(handles.figure1);
type = handles.viewtypes(3);
disp(['=>you pressed "' evnt.Key '"']);
switch evnt.Key
    case 'space'
        handles = createAnnotation(handles);
    case 'period'
        coords = get(handles.ax3,'CurrentPoint');
        api = iptgetapi(handles.sc3);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag * 4/3, coords(1), coords(3));
    case 'comma'
        coords = get(handles.ax3,'CurrentPoint');
        api = iptgetapi(handles.sc3);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag *3/4, coords(1), coords(3));
    case 'uparrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) + 50;
        set(handles.editwinwidth3, 'String', num2str(handles.c.contrast(type,2)));
        handles = refreshFig3(handles);
    case 'downarrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) - 50;
        set(handles.editwinwidth3, 'String', num2str(handles.c.contrast(type,2)));
        handles = refreshFig3(handles);
    case 'leftarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) - 50;
        set(handles.editwincenter3, 'String', num2str(handles.c.contrast(type,1)));
        handles = refreshFig3(handles);
    case 'rightarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) + 50;
        set(handles.editwincenter3, 'String', num2str(handles.c.contrast(type,1)));
        handles = refreshFig3(handles);
    otherwise
end
guidata(handles.figure1, handles);

function keypresshandler4(src, evnt, handles)
handles = guidata(handles.figure1);
type = handles.viewtypes(4);
disp(['=>you pressed "' evnt.Key '"']);
switch evnt.Key
    case 'space'
        handles = createAnnotation(handles);
    case 'period'
        coords = get(handles.ax4,'CurrentPoint');
        api = iptgetapi(handles.sc4);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag * 4/3, coords(1), coords(3));
    case 'comma'
        coords = get(handles.ax4,'CurrentPoint');
        api = iptgetapi(handles.sc4);
        mag = api.getMagnification();
        api.setMagnificationAndCenter(mag *3/4, coords(1), coords(3));
    case 'uparrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) + 50;
        set(handles.editwinwidth4, 'String', num2str(handles.c.contrast(type,2)));
        handles = refreshFig4(handles);
    case 'downarrow'
        handles.c.contrast(type,2) = handles.c.contrast(type,2) - 50;
        set(handles.editwinwidth4, 'String', num2str(handles.c.contrast(4,2)));
        handles = refreshFig4(handles);
    case 'leftarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) - 50;
        set(handles.editwincenter4, 'String', num2str(handles.c.contrast(4,1)));
        handles = refreshFig4(handles);
    case 'rightarrow'
        handles.c.contrast(type,1) = handles.c.contrast(type,1) + 50;
        set(handles.editwincenter4, 'String', num2str(handles.c.contrast(4,1)));
        handles = refreshFig4(handles);
    otherwise
end
guidata(handles.figure1, handles);


function ok = sanityCheck(handles)
% ok = 1;
%check if the radiologist name is entered
% if isempty(get(handles.editRadiologist, 'String'))
%     h = msgbox('Please type the name of the radiologist.', 'Error','error');
%     ok = 0;
% end
% h = msgbox('Please confirm that the annotation is correct.', 'Confirm','Warn');

resp = questdlg('Please confirm that the annotation is correct, the radiologist name is correct, and you have entered necessary comments.', 'Confirm annotation','Next Patient', 'Redo', 'Confirm');
if strcmp(resp, 'Next Patient')
    ok = 1;
else
    ok = 0;
end



function handles = updateToggle(handles)

togglestate(1) = get(handles.togglebutton1, 'Value');
togglestate(2) = get(handles.togglebutton2, 'Value');
togglestate(3) = get(handles.togglebutton3, 'Value');
togglestate(4) = get(handles.togglebutton4, 'Value');
togglestate(5) = get(handles.togglebutton5, 'Value');
togglestate(6) = get(handles.togglebutton6, 'Value');
togglestate(7) = get(handles.togglebutton7, 'Value');
togglestate(8) = get(handles.togglebutton8, 'Value');
togglestate(9) = get(handles.togglebutton9, 'Value');
togglestate(10) = get(handles.togglebutton10, 'Value');
togglestate = find(togglestate);

handles.togglestate = togglestate;

set(handles.togglebutton1, 'BackgroundColor', handles.offcolors{1});
set(handles.togglebutton2, 'BackgroundColor', handles.offcolors{1});
set(handles.togglebutton3, 'BackgroundColor', handles.offcolors{2});
set(handles.togglebutton4, 'BackgroundColor', handles.offcolors{2});
set(handles.togglebutton5, 'BackgroundColor', handles.offcolors{3});
set(handles.togglebutton6, 'BackgroundColor', handles.offcolors{3});
set(handles.togglebutton7, 'BackgroundColor', handles.offcolors{4});
set(handles.togglebutton8, 'BackgroundColor', handles.offcolors{4});
set(handles.togglebutton9, 'BackgroundColor', handles.offcolors{5});
set(handles.togglebutton10, 'BackgroundColor', handles.offcolors{5});

str = sprintf('togglebutton%d', togglestate);
set(handles.(str), 'BackgroundColor', handles.colors{round(togglestate/2)});




function handles = createAnnotation(handles)
linewidth = 2.5;
t = round(handles.togglestate/2);


if rem(handles.togglestate, 2) == 1
    % CONTOURS
    handles.aCh = cat(1, handles.aCh, imfreehand());
    c = get(handles.aCh(end), 'Children');
    set(c(2), 'Visible', 'off');
    set(c(4), 'Visible', 'off');
    set(c(1), 'LineWidth', linewidth);
    set(c(3), 'LineWidth', linewidth);
    handles.aCh(end).setColor(handles.colors{t});
    % set the view the annotation was made in
    curfig = gcf;
    i = numel(handles.aCh);
    if isequal(curfig, handles.hFig1)
        handles.aCtype(i) = handles.viewtypes(1);
    elseif isequal(curfig, handles.hFig2)
        handles.aCtype(i) = handles.viewtypes(2);
    elseif isequal(curfig, handles.hFig3)
        handles.aCtype(i) = handles.viewtypes(3);
    elseif isequal(curfig, handles.hFig4)
        handles.aCtype(i) = handles.viewtypes(4);
    end
    % set the annotation number (the color, 1-5)
    handles.aCnum(i) = t;
else
    % POINTS
    handles.aPh = cat(1, handles.aPh, impoint());
    handles.aPh(end).setColor(handles.colors{t});
        % set the view the annotation was made in
    curfig = gcf;
    i = numel(handles.aPh);
    if isequal(curfig, handles.hFig1)
        handles.aPtype(i) = handles.viewtypes(1);
    elseif isequal(curfig, handles.hFig2)
        handles.aPtype(i) = handles.viewtypes(2);
    elseif isequal(curfig, handles.hFig3)
        handles.aPtype(i) = handles.viewtypes(3);
    elseif isequal(curfig, handles.hFig4)
        handles.aPtype(i) = handles.viewtypes(4);
    end
    % set the annotation number (the color, 1-5)
    handles.aPnum(i) = t;
end



function handles = processAnnotations(handles)

for type = 1:8
    for num = 1:5
        % CONTOURS
        for i = 1:numel(handles.aCh)
            if isvalid(handles.aCh(i))
                if handles.aCtype(i) == type
                    if handles.aCnum(i) == num
                        handles.c.masks{type, num} = handles.aCh(i).createMask();
                        handles.c.points{type, num} = handles.aCh(i).getPosition();
                    end
                end
            end
        end
        % POINTS
        for i = 1:numel(handles.aPh)
            if isvalid(handles.aPh(i))
                if handles.aPtype(i) == type
                    if handles.aPnum(i) == num
                        handles.c.masks{type, num} = handles.aPh(i).createMask();
                        handles.c.points{type, num} = handles.aPh(i).getPosition();
                    end
                end
            end
        end
    end
end



function handles = saveAnnotation(handles, status, tumorfound)

% keyboard;

% save the previous version of the annotation file
[pth name ext] = fileparts(handles.datafile);
timestr = datestr(now,'yyyy-mmm-dd-HH-MM-ss');
filename = fullfile(pth, [name '-' timestr ext]);
data = handles.data;
dataFields = handles.dataFields;
idList = handles.idList;
statusList = handles.statusList;
save(filename, 'data', 'dataFields', 'idList', 'statusList');
fprintf('backed up records file %s\n', filename);

handles = processAnnotations(handles);

% write the data into handles.c
for k = 1:size(handles.c.data,1)
    if handles.c.type(k) ~= 0
        handles.c.data{k,19} = handles.c.contrast(handles.c.type(k),1);
        handles.c.data{k,20} = handles.c.contrast(handles.c.type(k),2);
    end
    handles.c.data{k,21} = get(handles.editRadiologist, 'String');
    handles.c.data{k,22} = datestr(now);
    handles.c.data{k,23} = get(handles.editComment, 'String');
    if handles.c.type(k) ~= 0
        % mask filename
        type = handles.c.type(k);
        handles.c.data{k,24} = handles.c.masks(type,:);
%         handles.c.data{k,24} = sprintf('maskfile %d', handles.c.type(k)); %handles.c.maskfiles{handles.c.type(k)};
        % contour filename
        handles.c.data{k,25} = handles.c.points(type,:);
%         handles.c.data{k,25} = sprintf('maskfile %d', handles.c.type(k)); %handles.c.contourfiles{handles.c.type(k)};
    end
    handles.c.data{k,26} = tumorfound;
    handles.c.data{k,27} = status;
end


% % write the annotation information (handles.c.data) to its own folder
% annotationfolder = [handles.datapath '\' handles.c.id '\'];
% if ~exist(annotationfolder, 'dir')
%     mkdir(annotationfolder);
% end
% [pth name ext] = fileparts(handles.c.data{k,8});
annotationfile = [handles.datapath handles.c.id '.mat'];
% annotationfile = fullfile(annotationfolder, [name '.mat']);
annotation = handles.c.data;
save(annotationfile, 'annotation', 'dataFields');
fprintf('saved annotation to %s\n', annotationfile);

% remove the masks and contours (data heavy) from the records file
for k = 1:size(handles.c.data,1)
    handles.c.data{k,24} = [];
    handles.c.data{k,25} = [];
end


% write handles.c.data into handles.data
handles.data(handles.c.caseInds,:) = handles.c.data;

% update the statuslist & session info
handles.statusList(handles.n) = status;
handles.thisSession(end+1,:) = [handles.n status];

% overwrite the database file 
data = handles.data;
dataFields = handles.dataFields;
idList = handles.idList;
statusList = handles.statusList;
save(handles.datafile, 'data', 'dataFields', 'idList', 'statusList');
fprintf('saved records file %s\n', handles.datafile);

% keyboard;




















% --- Executes on button press in pushbutton_debug.
function pushbutton_debug_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_debug (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
keyboard;





function pushbutton_autocontrast1_Callback(hObject, eventdata, handles)
type = handles.viewtypes(1);
center = handles.c.default_contrast(type,1);
width = handles.c.default_contrast(type,2);
handles.c.contrast(type,:) = [center width];
set(handles.editwincenter1, 'String', num2str(center));
set(handles.editwinwidth1, 'String', num2str(width));
handles = refreshFig1(handles);
guidata(handles.figure1, handles);

function pushbutton_autocontrast2_Callback(hObject, eventdata, handles)
type = handles.viewtypes(2);
center = handles.c.default_contrast(type,1);
width = handles.c.default_contrast(type,2);
handles.c.contrast(type,:) = [center width];
set(handles.editwincenter2, 'String', num2str(center));
set(handles.editwinwidth2, 'String', num2str(width));
handles = refreshFig2(handles);
guidata(handles.figure1, handles);

function pushbutton_autocontrast3_Callback(hObject, eventdata, handles)
type = handles.viewtypes(3);
center = handles.c.default_contrast(type,1);
width = handles.c.default_contrast(type,2);
handles.c.contrast(type,:) = [center width];
set(handles.editwincenter3, 'String', num2str(center));
set(handles.editwinwidth3, 'String', num2str(width));
handles = refreshFig3(handles);
guidata(handles.figure1, handles);

function pushbutton_autocontrast4_Callback(hObject, eventdata, handles)
type = handles.viewtypes(4);
center = handles.c.default_contrast(type,1);
width = handles.c.default_contrast(type,2);
handles.c.contrast(type,:) = [center width];
set(handles.editwincenter4, 'String', num2str(center));
set(handles.editwinwidth4, 'String', num2str(width));
handles = refreshFig4(handles);
guidata(handles.figure1, handles);



function editwincenter1_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(1);
handles.c.contrast(type,1) = val;
handles = refreshFig1(handles);
guidata(handles.figure1, handles);

function editwincenter2_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(2);
handles.c.contrast(type,1) = val;
handles = refreshFig2(handles);
guidata(handles.figure1, handles);

function editwincenter3_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(3);
handles.c.contrast(type,1) = val;
handles = refreshFig3(handles);
guidata(handles.figure1, handles);

function editwincenter4_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(4);
handles.c.contrast(type,1) = val;
handles = refreshFig4(handles);
guidata(handles.figure1, handles);



function editwinwidth1_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(1);
handles.c.contrast(type,2) = val;
handles = refreshFig1(handles);
guidata(handles.figure1, handles);

function editwinwidth2_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(2);
handles.c.contrast(type,2) = val;
handles = refreshFig2(handles);
guidata(handles.figure1, handles);

function editwinwidth3_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(3);
handles.c.contrast(type,2) = val;
handles = refreshFig3(handles);
guidata(handles.figure1, handles);

function editwinwidth4_Callback(hObject, eventdata, handles)
val = str2double(get(hObject,'String'));
type = handles.viewtypes(4);
handles.c.contrast(type,2) = val;
handles = refreshFig4(handles);
guidata(handles.figure1, handles);



function pushbuttonzoomin1_Callback(hObject, eventdata, handles)
coords = get(handles.ax1,'CurrentPoint');
api = iptgetapi(handles.sc1);
mag = api.getMagnification();
api.setMagnification(mag * 4/3);

function pushbuttonzoomin2_Callback(hObject, eventdata, handles)
coords = get(handles.ax2,'CurrentPoint');
api = iptgetapi(handles.sc2);
mag = api.getMagnification();
api.setMagnification(mag * 4/3);

function pushbuttonzoomin3_Callback(hObject, eventdata, handles)
coords = get(handles.ax3,'CurrentPoint');
api = iptgetapi(handles.sc3);
mag = api.getMagnification();
api.setMagnification(mag * 4/3);

function pushbuttonzoomin4_Callback(hObject, eventdata, handles)
coords = get(handles.ax4,'CurrentPoint');
api = iptgetapi(handles.sc4);
mag = api.getMagnification();
api.setMagnification(mag * 4/3);



function pushbuttonzoomout1_Callback(hObject, eventdata, handles)
coords = get(handles.ax1,'CurrentPoint');
api = iptgetapi(handles.sc1);
mag = api.getMagnification();
api.setMagnification(mag * 3/4);

function pushbuttonzoomout2_Callback(hObject, eventdata, handles)
coords = get(handles.ax2,'CurrentPoint');
api = iptgetapi(handles.sc2);
mag = api.getMagnification();
api.setMagnification(mag * 3/4);

function pushbuttonzoomout3_Callback(hObject, eventdata, handles)
coords = get(handles.ax3,'CurrentPoint');
api = iptgetapi(handles.sc3);
mag = api.getMagnification();
api.setMagnification(mag * 3/4);

function pushbuttonzoomout4_Callback(hObject, eventdata, handles)
coords = get(handles.ax4,'CurrentPoint');
api = iptgetapi(handles.sc4);
mag = api.getMagnification();
api.setMagnification(mag * 3/4);



function popupmenuview1_Callback(hObject, eventdata, handles)
handles.viewtypes(1) = get(handles.popupmenuview1, 'Value');
handles = refreshFig1(handles);
guidata(handles.figure1, handles);

function popupmenuview2_Callback(hObject, eventdata, handles)
handles.viewtypes(2) = get(handles.popupmenuview2, 'Value');
handles = refreshFig2(handles);
guidata(handles.figure1, handles);

function popupmenuview3_Callback(hObject, eventdata, handles)
handles.viewtypes(3) = get(handles.popupmenuview3, 'Value');
handles = refreshFig3(handles);
guidata(handles.figure1, handles);

function popupmenuview4_Callback(hObject, eventdata, handles)
handles.viewtypes(4) = get(handles.popupmenuview4, 'Value');
handles = refreshFig4(handles);
guidata(handles.figure1, handles);



% --- Executes during object creation, after setting all properties.
function editwincenter1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwincenter1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function editwinwidth1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwinwidth1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function popupmenuview1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuview1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function editwinwidth2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwinwidth2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function editwincenter2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwincenter2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function popupmenuview2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuview2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function editwinwidth3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwinwidth3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function editwincenter3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwincenter3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function popupmenuview3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuview3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function editwinwidth4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwinwidth4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function editwincenter4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwincenter4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function popupmenuview4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuview4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRadiologist_Callback(hObject, eventdata, handles)
% hObject    handle to editRadiologist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRadiologist as text
%        str2double(get(hObject,'String')) returns contents of editRadiologist as a double


% --- Executes during object creation, after setting all properties.
function editRadiologist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRadiologist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editComment_Callback(hObject, eventdata, handles)
% hObject    handle to editComment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editComment as text
%        str2double(get(hObject,'String')) returns contents of editComment as a double


% --- Executes during object creation, after setting all properties.
function editComment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editComment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonComplete.
function pushbuttonComplete_Callback(hObject, eventdata, handles)

ok = sanityCheck(handles);

if ok
    status = 1;
    tumorfound = 1;
    handles = saveAnnotation(handles, status, tumorfound);
    handles = loadNextCase(handles);
    handles = refreshFig1(handles);
    handles = refreshFig2(handles);
    handles = refreshFig3(handles);
    handles = refreshFig4(handles);
    setInitialViewLocations(handles);
    guidata(handles.figure1, handles);
end
    
% --- Executes on button press in pushbuttonSkipPatient.
function pushbuttonSkipPatient_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSkipPatient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

resp = questdlg('Please confirm that you want to skip this annotation.', 'Skip annotation?','Skip', 'Redo', 'Skip');
if strcmp(resp, 'Skip')
    ok = 1;
else
    ok = 0;
end

if ok
    status = 2;
    tumorfound = 0;
    handles = saveAnnotation(handles, status, tumorfound);
    handles = loadNextCase(handles);
    handles = refreshFig1(handles);
    handles = refreshFig2(handles);
    handles = refreshFig3(handles);
    handles = refreshFig4(handles);
    setInitialViewLocations(handles);
    guidata(handles.figure1, handles);
end


% --- Executes on button press in pushbuttonNoTumor.
function pushbuttonNoTumor_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonNoTumor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ok = sanityCheck(handles);

if ok
    status = 1;
    tumorfound = 0;
    handles = saveAnnotation(handles, status, tumorfound);
    handles = loadNextCase(handles);
    handles = refreshFig1(handles);
    handles = refreshFig2(handles);
    handles = refreshFig3(handles);
    handles = refreshFig4(handles);
    setInitialViewLocations(handles);
    guidata(handles.figure1, handles);
end

% --- Executes on button press in pushbuttonExit.
function pushbuttonExit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Do you want to exit your session?', 'Exit', 'Exit', 'Stay', 'Exit');

if isequal(choice, 'Exit')
    close(handles.hFig1);
    close(handles.hFig2);
    close(handles.hFig3);
    close(handles.hFig4);
    close(handles.figure1);
end


function figure1_SizeChangedFcn(hObject, eventdata, handles)

% --- Executes on button press in pushbuttonHelp.
function pushbuttonHelp_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = 'mammoAI Annotator HELP\n\nBefore interacting with a view, click on the window to give it focus.Do not mix contours and points in the same window! Hotkeys and functions:\n\nSPACE - create a new annotation\nPERIOD (.) - zoom in\nCOMMA (,) - zoom out\nUP ARROW - increase contrast window width\nDOWN ARROW - shrink contrast window width\nLEFT ARROW - lower contrast window center\nRIGHT ARROW - raise contrast window center\n';
helpdlg(sprintf(str), 'Help');


function togglebutton1_Callback(hObject, eventdata, handles)
function togglebutton2_Callback(hObject, eventdata, handles)


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = updateToggle(handles);
guidata(handles.figure1, handles);
