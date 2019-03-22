function keys = keysVigenere(N,V)
% keysVigenere calculates all feasible keys for Vigenere cypher
%   KEYS = keysVigenere(N,V) KEYS is a matrix with all Vigenere keys of size 
%   N and alphabet with size V

keys = zeros(0,N);

for i=0:(V^(N)-1)

	x = i;
	K = [];
	for j=1:N
		K = [K, mod(x,V)];
		x = floor(x/V);
	end
	
	keys = [keys; K];
	
end


