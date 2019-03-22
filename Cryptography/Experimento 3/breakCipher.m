c1 = readText('CipherText03A.txt');
c2 = readText('CipherText03B.txt');
text = readText('NotesUnderground.txt');

diff = c1-c2;

% Elimina caracteres que nao sao texto
indexTexto = find((text>='a'&text<='z')|(text>='A'&text<='Z'));
text = text(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((text>='A'&text<='Z'));
text(indexCaixaAlta) = text(indexCaixaAlta) + ('a'-'A');

N = length(text);
sizeText = 100;

for i=1:(N-(sizeText+1))
  guess = text(i:i+sizeText-1);
  guess2 = char(mod(guess-'a'-diff, 26)+'a');
  if (strfind(text, guess2) > 0)
    guess
    saveText(guess,'PlainText03A.txt');
    guess2
    saveText(guess2,'PlainText03B.txt');
    break;
  endif
endfor