function invK = inverseMod(K)
% inverseMod calculates the inverse of a matrix of integers module 26
%   INVERSE = inverseMod(K) receives a square matrix of integers K and 
%   returns the INVERSE matrix module 26. If does not exist the inverse,
%   returns 0.

invK = 0;

if size(K,1) ~= size(K,2)
    return;
end

listaInv = [0 1 0 9 0 21 0 15 0 3 0 19 0 0 0 7 0 23 0 11 0 5 0 17 0 25];


invDet = listaInv(mod(round(det(K)),26)+1);

if invDet > 0
	[n m] = size(K);
	invK = zeros(n,m);
	for i=1:n
		for j=1:m
			invK(j,i) = mod((-1)^(i+j)*det(K([[1:i-1] [i+1:end]],[[1:j-1] [j+1:end]]))*invDet,26);
		end
	end
end

