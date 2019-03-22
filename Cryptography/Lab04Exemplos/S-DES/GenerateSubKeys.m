% Gera duas chaves de 8 bits dada uma chave K de 10 bits
function Keys = GenerateSubKeys(K)

% Permutation Tables
  P10 = [3 5 2 7 5 10 1 9 8 6];
  P8 = [6 3 7 4 8 5 10 9];

% First key
K = K(P10);
  % Circular Shift Left
K = [K([2:5, 1]) K([7:10, 6])];
K1 = K(P8);

% Second key
  % Circular 2-Shift Left
K = [K([3:5, 1, 2]) K([8:10, 6, 7])];
K2 = K(P8);

Keys = [K1; K2];