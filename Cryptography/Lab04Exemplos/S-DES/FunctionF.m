% Function F(R, SK)
function result = FunctionF(R, SK)

% Boxs
  % Expansao/Permutacao
  EP = [4 1 2 3 2 3 4 1];
  % S-boxs
  S0 = [1 0 3 2;
        3 2 1 0;
        0 2 1 3;
        3 1 3 2];
        
  S1 = [0 1 2 3;
        2 0 1 3;
        3 0 1 0;
        2 1 0 3];
  % Permutacao Final
  P4 = [2 4 3 1];

n = R(EP); 
p = [xor(n(1:4), SK(1:4)); xor(n(5:8), SK(5:8))];

linha = p(1, 1)*2 + p(1, 4) + 1;
coluna = p(1, 2)*2 + p(1, 3) + 1;
%linha = bin2dec([p(1,1) p(1,4)])+1;
%coluna = bin2dec(p(1,2:3))+1;
result = dec2bin(S0(linha, coluna), 2);
linha = p(2, 1)*2 + p(2, 4) + 1;
coluna = p(2, 2)*2 + p(2, 3) + 1;
%linha = bin2dec([p(2,1) p(2,4)])+1;
%coluna = bin2dec(p(2,2:3))+1;
result = [result dec2bin(S1(linha, coluna), 2)];

result = result(P4);
result = result=='1';