function C = feistelDes(P, K, rodadas)

P=double(P);

L0 = P(1:floor(end/2));
R0 = P((floor(end/2)+1):end);

C = P;
for i=1:rodadas
    L = R0;
    R = mod(L0 + DES([0 0 0 0 R0], K)(1:4) + R0 + 1,2);
    
    L0=L;
    R0=R;
    
end

C = [L R];