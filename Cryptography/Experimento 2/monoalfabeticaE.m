function C = monoalfabeticaE(P,K)
% monoalfabeticaE encrypts a message using monoalfabetic cypher
%   C = monoalfabeticaE(M,K) receives a message M, and returns the
%   encrypted message C by using key K and monoalfabetic cypher.

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');


P = K(P-'a'+1);


% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
