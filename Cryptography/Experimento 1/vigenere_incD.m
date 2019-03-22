function C = vigenere_incD(P,K)
% Vigenere_incD decrypts a message using incremented vigenere cypher
%   C = vigenere_incD(M,K) receives a message M, and returns the
%   decrypted message C by using key K and incremented vigenere cypher.

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

% Reduz o intervalo para 0 e 25
P -= 'a';
K -= 'a';

K = [K P(1:length(P)-1)];
P = mod(P-K, 26);

% Retorna para intervalo ASC II
P += 'a';
K += 'a';

% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
