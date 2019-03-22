function C = vigenereD(P,K)
% Vigenere_incD decrypts a message using vigenere cypher
%   C = vigenere_incD(M,K) receives a message M, and returns the
%   decrypted message C by using key K and vigenere cypher.

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

PlainS = length(P);
KeyS = length(K);

N = ceil(PlainS/KeyS);

% Reduz o intervalo para 0 e 25
P -= 'a';

Kn = repmat(K, 1, N)(1:PlainS);
P = mod(P - (Kn - 'a'), 26);

% Retorna para intervalo ASC II
P += 'a';

% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
