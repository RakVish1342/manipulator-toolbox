d1 = input('hello1')
d2 = input('hello2')
% d3 = input('hello2')
% d4 = input('hello2')
% d5 = input('hello2')
% 
% d11 = input('hello1')
% d22 = input('hello2')
% d33 = input('hello2')
% d44 = input('hello2')
% d55 = input('hello2')

uit = uitable
get(uit)
set(uit, 'Data', zeros(4))
set(uit, 'ColumnEditable', [true true false false])
set(uit, 'ColumnName', {'hello', 'yolo', 'revolute', 'prismatic', 'link'})







% https://www.mathworks.com/matlabcentral/answers/328704-the-selected-content-of-popup-menu-created-in-a-column-of-uitable-does-not-hold#answer_257816
% https://www.mathworks.com/matlabcentral/answers/328704-the-selected-content-of-popup-menu-created-in-a-column-of-uitable-does-not-hold#answer_257816