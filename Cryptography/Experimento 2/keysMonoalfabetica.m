function keys = keysMonoalfabetica(N)
% keysMonoalfabetica calculates all feasible keys for Monoalphabetic cypher
%   KEYS = keysMonoalfabetica(N) KEYS is a matrix with all Monoalphabetic 
%   keys which permutes only the N frequent letters in english

freq = 'etaoinshrdlcumwfgypbvkjxqz';
alf = 'abcdefghijklmnopqrstuvwxyz';

keys = repmat(alf,factorial(N),1);

indexes = freq(1:N)-'a'+1;

keys(:,indexes) = perms(freq(1:N));
