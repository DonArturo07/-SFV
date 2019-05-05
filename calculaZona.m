function calculaZona(varargin)

vecZona=varargin{1};
vSenalHRms=varargin{2};vSenalVRms=varargin{3};vSenalARms=varargin{4};
etxtZh=varargin{5};etxtZv=varargin{6};etxtZa=varargin{7};

zona=binaryVectorToDecimal(vecZona);

switch zona
    case {69,74,145,162}
        if vSenalHRms<=2.3
            set(etxtZh,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalHRms<=4.5
            set(etxtZh,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalHRms<=7.1
            set(etxtZh,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalHRms>7.1
            set(etxtZh,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
        if vSenalVRms<=2.3
            set(etxtZv,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalVRms<=4.5
            set(etxtZv,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalVRms<=7.1
            set(etxtZv,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalVRms>7.1
            set(etxtZv,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
        if vSenalARms<=2.3
            set(etxtZa,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalARms<=4.5
            set(etxtZa,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalARms<=7.1
            set(etxtZa,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalARms>7.1
            set(etxtZa,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
    case {70,146}
        if vSenalHRms<=1.4
            set(etxtZh,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalHRms<=2.8
            set(etxtZh,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalHRms<=4.5
            set(etxtZh,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalHRms>4.5
            set(etxtZh,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
        if vSenalVRms<=1.4
            set(etxtZv,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalVRms<=2.8
            set(etxtZv,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalVRms<=4.5
            set(etxtZv,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalVRms>4.5
            set(etxtZv,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
        if vSenalARms<=1.4
            set(etxtZa,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalARms<=2.8
            set(etxtZa,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalARms<=4.5
            set(etxtZa,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalARms>4.5
            set(etxtZa,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
    case {73,161}
        if vSenalHRms<=3.5
            set(etxtZh,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalHRms<=7.1
            set(etxtZh,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalHRms<=11
            set(etxtZh,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalHRms>11
            set(etxtZh,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
        if vSenalVRms<=3.5
            set(etxtZv,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalVRms<=7.1
            set(etxtZv,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalVRms<=11
            set(etxtZv,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalVRms>11
            set(etxtZv,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end        
        if vSenalARms<=3.5
            set(etxtZa,'String','A','BackgroundColor','[0.47 0.67 0.19]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalARms<=7.1
            set(etxtZa,'String','B','BackgroundColor','[1 1 0]',...
                'ForegroundColor','[0 0 0]');
        elseif vSenalARms<=11
            set(etxtZa,'String','C','BackgroundColor','[0.93 0.69 0.13]',...
                'ForegroundColor','[1 1 1]');
        elseif vSenalARms>11
            set(etxtZa,'String','D','BackgroundColor','[1 0 0]',...
                'ForegroundColor','[1 1 1]');
        end
    otherwise
        set(etxtZh,'String','N.A.');
        set(etxtZv,'String','N.A.');
        set(etxtZa,'String','N.A.');        
end

end

