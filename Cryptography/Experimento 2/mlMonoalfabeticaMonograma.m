function probs = mlMonoalfabeticaMonograma(freq,keys,cifra)
% mlMonoalfabeticaDigrama calculates for a set o keys the posterior 
% probability of being the key used to generate a cypher based on a digram
% likelihood of a language
%   PROBS = mlMonoalfabeticaDigrama(FREQ,KEYS,CIFRA) PROBS is the posterior
%   probability for each key in KEYS generating the cypher text in CIFRA,
%   when the a priori language has a digram distribution as in FREQ

nK = size(keys,1);
probs = ones(1,nK)/nK;
nCaracter = length(cifra);

probs = zeros(1,nK);

for kInd = 1:nK
    plain = monoalfabeticaD(cifra,keys(kInd,:));
    plain = plain -'a' + 1;
    count = zeros(1, length(freq));
    for i=1:nCaracter
        count(plain(i)) = count(plain(i))+1;
    end
    prob = binopdf(count,nCaracter-1,freq);
    probs(kInd) = sum(log(prob(:)));
end

probs = probs-max(probs);
probs = exp(probs)/sum(exp(probs));

return
