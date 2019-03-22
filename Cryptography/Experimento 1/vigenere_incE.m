function C = vigenere_incE(P,K)
% vigenere_incE encrypts a message using incremented vigenere cypher
%   C = viginere_incE(M,K) receives a message M, and returns the
%   encrypted message C by using key K and incremented vigenere cypher.

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

for i = [1:length(P)]
  P(i) = mod(P(i) + K(i), 26);  
  K = [K P(i)]; 
end

% Retorna para intervalo ASC II
P += 'a';
K += 'a';

% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P;

end
