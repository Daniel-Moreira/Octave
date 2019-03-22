function C = monoalfabeticaD(P,K)
% monoalfabeticaD decrypts a message using monoalfabetic cypher
%   M = monoalfabeticaE(C,K) receives a cypher message C, and returns the
%   decrypted message M by using key K and monoalfabetic cypher.

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

Kdec = 'abcdefghijklmnopqrstuvwxyz';
[aux index] = sort(K);
Kdec = Kdec(index);

P = Kdec(P-'a'+1);


% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
