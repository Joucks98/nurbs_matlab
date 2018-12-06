function C = PointOnBezierCurve(P, n, u)
%% input P has size:(n+1)x3
B = AllBernstein(n,u);
C = B'*P;
end