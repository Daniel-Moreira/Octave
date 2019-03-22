function C = DES(P, K)

% IP e IP^-1
IP = [2 6 3 1 4 8 5 7];
inverseIP = [4 1 3 5 7 2 8 6];

C = P(IP);
K = GenerateSubKeys(K);

for i = 1:2
  L = P(1:4);
  R = P(5:8);

  C = [xor(L, FunctionF(R, K(i, :))) R];
  
  % Switch Function (SW)
  P = [C(5:8) C(1:4)];
end

C = C(inverseIP);