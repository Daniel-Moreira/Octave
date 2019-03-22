function keys = keysHill(N,V)
% keysHill calculates all feasible keys for Hill cypher
%   KEYS = keysHill(N,V) KEYS is a matrix with all Hill keys of order N and
%   alphabet with size V

keys = zeros(0,N^2);

for i=0:(V^(N^2)-1)

	x = i;
	K = [];
	for j=1:N^2
		K = [K, mod(x,V)];
		x = floor(x/V);
	end
	
	matrizK = reshape(K,N,N);
	if any(inverseMod(matrizK))
		keys = [keys; K];
	end
	
end


