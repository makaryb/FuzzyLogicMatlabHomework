%   �������� ������������� ������������: y=x1^2*sin(x2-1)
%                                                         (a1_PostrGraf.m)
%==========================================================================
% ���������� ������� �������  y=x1^2*sin(x2-1)
% � �������    x1 e [-7, 3];  x2 e [-4.4, 1.7]
%---------------------------------------------

n = 15;         % ���������� ����� �������������
x1 = linspace(-7,     3, n);
x2 = linspace(-4.4, 1.7, n);

y = zeros(n, n);

for i = 1:n
    y(i,:) = x1.^2 * sin(x2(i)-1);   
end    

%---------------------------------------------
h1 = figure(1);
surf(x1, x2, y)
xlabel('x_1');   ylabel('x_2');   zlabel('y');
title('�������� �����������') 

% h2 = figure(2);
% set(h2,'Position',[4   527   547   443])
% clf
% hold on
% colormap([0 0 0;0 0 0]);
% mesh(x1, x2, y)
% mesh(x1, x2, 0.2*y)
% axis([-10     5 ...
%       -6	2 ...
%       -50   50]); 
% view(-40,30)
% grid on;
% hold off
