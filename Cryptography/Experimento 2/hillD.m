function C = hillD(P,K)
% vigenereE encrypts a message using vigenere cypher
%   C = viginereE(M,K) receives a message M, and returns the
%   encrypted message C by using key K and vigenere cypher.

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

PlainS = length(P);
KeyS = size(K)(1);

N = ceil(PlainS/KeyS);

% Reduz o intervalo para 0 e 25
P -= 'a';
K -= 'a';

% Prenche com zeros
P = [P zeros(1, N*KeyS-PlainS)];

K = inverseMod(K);
P = reshape(P, KeyS, N);
P = mod(K * P, 26);

% Retira os zeros
P = P(:)(1:PlainS);

% Retorna para intervalo ASC II
P += 'a';
K += 'a';

% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
