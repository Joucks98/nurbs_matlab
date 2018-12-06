function P = SolveTridiagonal(n, Q, U, P)
% Q size is n+1 
%input: n, Q, U, P(1),P(2),P(n+2),P(n+3)
%output: P size is n+3
R = zeros(n+1,1);
for i = 3: n-1
    R(i+1) = Q(i);
end
abc = BasisFuns(5, U(5), 3, U);
den = abc(2);
P(3) = (Q(2) - abc(1)*P(2)) / den;
dd = zeros(n+1, 1);
for i = 3 : n-1
    dd(i+1) = abc(3) / den;
    abc = BasisFuns(i+3, U(i+3), 3, U);
    den = abc(2) - abc(1)*dd(i+1);
    P(i+1) = (R(i+1) - abc(1)*P(i)) /den;
end
dd(n+1) = abc(3) / den;
abc = BasisFuns(n+3, U(n+3), 3, U);
den = abc(2) - abc(1)*dd(n+1);
P(n+1) = (Q(n) - abc(3)*P(n+2) - abc(1)*P(n)) / den;
for i = n-1: -1: 2
    P(i+1) = P(i+1) - dd(i+2)*P(i+2);
end
disp('P = :');
disp(P);
end