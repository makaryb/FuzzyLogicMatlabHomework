function FISnew = F_changeFISmg(param, FISold, Msht)
% Установка новых параметров (param) нечеткой системы FISold

FISnew = FISold;

% Демасштабирование настраиваемых параметров
param = param ./ Msht;

% Весовые коэффициенты правил
FISnew.rule(1).weight = param(1);
FISnew.rule(2).weight = param(2);
FISnew.rule(3).weight = param(3);
FISnew.rule(4).weight = param(4);
FISnew.rule(5).weight = param(5);
FISnew.rule(6).weight = param(6);
FISnew.rule(7).weight = param(7);
FISnew.rule(8).weight = param(8);

% Коэффициенты конццентрации термов входных переменных
FISnew.input(1).mf(1).params(1) = param(9);
FISnew.input(1).mf(2).params(1) = param(10);
FISnew.input(1).mf(3).params(1) = param(11);	
FISnew.input(2).mf(1).params(1) = param(12);
FISnew.input(2).mf(2).params(1) = param(13);
FISnew.input(2).mf(3).params(1) = param(14);

% Коэффициенты конццентрации термов выходных переменных
FISnew.output(1).mf(1).params(1) = param(15);
FISnew.output(1).mf(2).params(1) = param(16);
FISnew.output(1).mf(3).params(1) = param(17);
FISnew.output(1).mf(4).params(1) = param(18);
FISnew.output(1).mf(5).params(1) = param(19);

% коорд.максимумв некотор.термов входных переменных     
FISnew.input(1).mf(2).params(2) = param(20);
FISnew.input(2).mf(2).params(2) = param(21);

% коорд.максимумв некотор.термов выходных переменных     
FISnew.output(1).mf(2).params(2) = param(22);
FISnew.output(1).mf(3).params(2) = param(23);
FISnew.output(1).mf(4).params(2) = param(24);

