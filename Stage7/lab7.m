clear all       % очистка памяти (leaving the workspace empty)
clc             % очистка командного окна  (Clear Command Window)  

fisRalphLauren_girls = readfis('ralph_lauren_girls');
fisRalphLauren_boys = readfis('ralph_lauren_boys');

fisHAndM_unisex = readfis('h_and_m_unisex');

h_and_m = true;

answerBrand = questdlg('Какой бренд детской одежды предпочитаете?','Выбор бренда','RalphLauren','H&M','H&M');
% В зависимости от ответа
switch answerBrand
    case 'Ralph Lauren'
        disp([answerBrand ' выбран'])
        h_and_m = false;
    case 'H&M'
        disp([answerBrand ' выбран'])
        h_and_m = true;
end

girls = true;

answerGender = questdlg('Подбираем одежду для мальчика или для девочки?','Для кого','Для мальчика','Для девочки','Для девочки');
% В зависимости от ответа
switch answerGender
    case 'Для мальчика'
        disp([answerGender ' - определили'])
        girls = false;
    case 'Для девочки'
        disp([answerGender ' - определили'])
        girls = true;
end

% приступим
switch h_and_m
    case true
        prompt = {'Введите рост (93.51 -:- 163.99), см:','Введите обхват груди (49.31 -:- 82.49), см:','Введите обхват талии (46.76 -:- 67.24), см'};
        dlgtitle = 'Параметры ребенка';
        answer = inputdlg(prompt,dlgtitle,[1 70; 1 70; 1 70]);
        
        disp(str2double(answer{1}));
        disp(str2double(answer{2}));
        disp(str2double(answer{3}));
        
        input = [str2double(answer{1}) str2double(answer{2}) str2double(answer{3})];
        
        [output,fuzzifiedIn,ruleOut,aggregatedOut,ruleFiring] = evalfis(fisHAndM_unisex,input);

        size_4_5 = ruleFiring(1, 1);
        size_5_6 = ruleFiring(2, 1);
        size_6_7 = ruleFiring(3, 1);
        size_7_8 = ruleFiring(4, 1);
        size_8_9 = ruleFiring(5, 1);
        size_9_10 = ruleFiring(6, 1);
        size_10_11 = ruleFiring(7, 1);
        size_11_12 = ruleFiring(8, 1);
        size_12_13 = ruleFiring(9, 1);
        size_13_14 = ruleFiring(10, 1);
        
        maxReccomentation = max(ruleFiring);
        
        %disp(ruleFiring);
        %disp(maxReccomentation);
        
        if maxReccomentation == size_4_5 
            answerOK = questdlg('Нечеткая система рекомендует размер "4-5" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_5_6 
            answerOK = questdlg('Нечеткая система рекомендует размер "5-6" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_6_7
            answerOK = questdlg('Нечеткая система рекомендует размер "6-7" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_7_8
            answerOK = questdlg('Нечеткая система рекомендует размер "7-8" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_8_9
            answerOK = questdlg('Нечеткая система рекомендует размер "8-9" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_9_10
            answerOK = questdlg('Нечеткая система рекомендует размер "9-10" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_10_11
            answerOK = questdlg('Нечеткая система рекомендует размер "10-11" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_11_12
            answerOK = questdlg('Нечеткая система рекомендует размер "11-12" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_12_13
            answerOK = questdlg('Нечеткая система рекомендует размер "12-13" (H&M)','Рекомендация','OK','OK');
        elseif maxReccomentation == size_13_14
            answerOK = questdlg('Нечеткая система рекомендует размер "13-14" (H&M)','Рекомендация','OK','OK');
        end
        
    case false
        prompt = {'Введите рост (98.60 -:- 155.00), см:','Введите вес (17.00 -:- 45.00), кг:','Введите обхват талии (45.05 -:- 66.00), см'};
        dlgtitle = 'Параметры ребенка';
        answer = inputdlg(prompt,dlgtitle,[1 70; 1 70; 1 70]);
        
        disp(str2double(answer{1}));
        disp(str2double(answer{2}));
        disp(str2double(answer{3}));
        
        input = [str2double(answer{1}) str2double(answer{2}) str2double(answer{3})];
        
        if girls == true
            [output,fuzzifiedIn,ruleOut,aggregatedOut,ruleFiring] = evalfis(fisRalphLauren_girls,input);
            
            size_5 = ruleFiring(1, 1);
            size_6 = ruleFiring(2, 1);
            size_6x = ruleFiring(3, 1);
            size_7 = ruleFiring(4, 1);
            size_8 = ruleFiring(5, 1);
            size_10 = ruleFiring(6, 1);
            size_12 = ruleFiring(7, 1);
            size_14 = ruleFiring(8, 1);
            
            maxReccomentation = max(ruleFiring);
            
            if maxReccomentation == size_5 
                answerOK = questdlg('Нечеткая система рекомендует размер "5" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_6 
                answerOK = questdlg('Нечеткая система рекомендует размер "6" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_6x
                answerOK = questdlg('Нечеткая система рекомендует размер "6x" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_7
                answerOK = questdlg('Нечеткая система рекомендует размер "7" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_8
                answerOK = questdlg('Нечеткая система рекомендует размер "8" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_10
                answerOK = questdlg('Нечеткая система рекомендует размер "10" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_12
                answerOK = questdlg('Нечеткая система рекомендует размер "12" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_14
                answerOK = questdlg('Нечеткая система рекомендует размер "14" (RalphLouren)','Рекомендация','OK','OK');
            end
        else
            [output,fuzzifiedIn,ruleOut,aggregatedOut,ruleFiring] = evalfis(fisRalphLauren_boys,input);
            
            size_5 = ruleFiring(1, 1);
            size_6 = ruleFiring(2, 1);
            size_7 = ruleFiring(3, 1);
            size_8 = ruleFiring(4, 1);
            size_10 = ruleFiring(5, 1);
            size_12 = ruleFiring(6, 1);
            size_14 = ruleFiring(7, 1);
            
            maxReccomentation = max(ruleFiring);
            
            disp(ruleFiring);
            %disp(maxReccomentation);
            
            if maxReccomentation == size_5 
                answerOK = questdlg('Нечеткая система рекомендует размер "5" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_6 
                answerOK = questdlg('Нечеткая система рекомендует размер "6" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_7
                answerOK = questdlg('Нечеткая система рекомендует размер "7" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_8
                answerOK = questdlg('Нечеткая система рекомендует размер "8" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_10
                answerOK = questdlg('Нечеткая система рекомендует размер "10" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_12
                answerOK = questdlg('Нечеткая система рекомендует размер "12" (RalphLouren)','Рекомендация','OK','OK');
            elseif maxReccomentation == size_14
                answerOK = questdlg('Нечеткая система рекомендует размер "14" (RalphLouren)','Рекомендация','OK','OK');
            end
        end   
end
