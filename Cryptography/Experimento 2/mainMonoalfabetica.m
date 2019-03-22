% mainExemplo example for experience 2, by using text
% 'NotesUnderground.txt' and monoalfabetic cypher

yy=clock;fprintf(1,'Obtendo as frequencias do texto. Clock: %02d:%02d:%02d\n',yy(4),yy(5),round(yy(6)));flush;

text = readText('NotesUnderground.txt');

% Elimina caracteres que nao sao texto
indexTexto = find((text>='a'&text<='z')|(text>='A'&text<='Z'));
text = text(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((text>='A'&text<='Z'));
text(indexCaixaAlta) = text(indexCaixaAlta) + ('a'-'A');

N = length(text);

% Faz a contagem dos digramas
freq = zeros(26,26);
for i=1:26
	for j=1:26
		freq(i,j) = length(findstr(text,[i j]-1 + 'a'));
	end
end

freq = (freq+1/100)/(N-1+26*26/100);

% Faz a contagem dos monogramas
freq = zeros(1,26);
for i=1:26
		freq(i) = length(find(text == i-1 + 'a'));
end

freq = (freq+1/100)/(N-1+26/100);

% Escolhe o tamanho do experimento
Nsize = 10;  % quantos tamanhos de textos diferentes (aumenta de 10 em 10)
Ntextos = 50; % quantas vezes repete o experimento

yy=clock;fprintf(1,'Gerando as chaves. Clock: %02d:%02d:%02d\n',yy(4),yy(5),round(yy(6)));flush;

keys = keysMonoalfabetica(7);

probMax = zeros(Nsize, Ntextos);
probReal = zeros(Nsize, Ntextos);
entropia = zeros(Nsize, Ntextos);
acertos = zeros(Nsize, Ntextos);

yy=clock;fprintf(1,'Iniciando Processamento. Clock: %02d:%02d:%02d\n',yy(4),yy(5),round(yy(6)));flush;
for texto=1:Ntextos
for tamanho=1:Nsize
	% sorteia um texto aberto
    nCaracter = tamanho*10;
	aux = ceil(rand*(N-nCaracter+1));
	plain = text(aux:aux+nCaracter-1);
    
    % sorteia uma chave	
	keyRealInd = ceil(rand*size(keys,1));
	cifra = monoalfabeticaE(plain,keys(keyRealInd,:));

    % encontra a verossimilhanca de toda chave
	%probs = mlMonoalfabeticaDigrama(freq,keys,cifra);
	probs = mlMonoalfabeticaMonograma(freq,keys,cifra);
	[probMax(tamanho,texto), keyMaxInd] = max(probs);
	probReal(tamanho,texto) = probs(keyRealInd);
    entropia(tamanho,texto) = -probs*logEntropia(probs')/log(size(keys,1));
    acertos(tamanho,texto) = (keyRealInd == keyMaxInd);
    
    %save monoalfabetica.mat probMax probReal
end
yy=clock;fprintf(1,'Completed: %1.2f. Clock: %02d:%02d:%02d\n',texto/Ntextos,yy(4),yy(5),round(yy(6)));flush;
end

plot(10*[1:Nsize],mean(probMax,2),10*[1:Nsize],mean(probReal,2),10*[1:Nsize],mean(entropia,2),10*[1:Nsize],mean(acertos,2))
legend('Maxima Probabilidade', 'Probabilidade da Chave Correta', 'Entropia', 'Acertos')
xlabel('numero de caracteres')
ylabel('probabilidade')
print -dpng lab2-mono.png
save lab2-mono.dat  probMax probReal entropia acertos