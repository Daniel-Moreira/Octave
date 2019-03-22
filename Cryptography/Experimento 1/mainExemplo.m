% mainExemplo example for experience 1, by using text
% 'NotesUnderground.txt' and monoalfabetic cypher

P = readText('NotesUnderground.txt');

%C = monoalfabeticaE(P,'knmporqtsvuxwzybadcfeghjil');
%C = vigenereE(P,'drn');
%C = hillE(P,['j' 'u'; 's' 'd']);
C = hillE(P, [17 17 5; 21 18 21; 2 2 19]+'a');
%C = vigenere_incE(P,'a');
saveText(C,'NotesUnderground_Cifrado.txt');

%C = vigenereD(C,'drn');
%C = vigenere_incD(C,'a');
%C = hillD(C, [17 17 5; 21 18 21; 2 2 19]+'a');

[rateMono character] = countCharacters(C);

    
plot([1:26],rateMono);
%legend('Monoalfabetica');
%legend('Vigenere');
legend('Hill');
%legend('Vigenere Inc');
title('Frequencia de Letras em Textos Cifrados');
xlabel('letras');
ylabel('percentagem de ocorrencia');
print -dpng lab1.png
