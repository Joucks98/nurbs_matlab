function C = plot_BernsteinCurve(n)
u = 0:.01:1;
P = rand(n+1, 3);
figure;
plot3(P(:,1), P(:,2), P(:,3), 'b*:');
hold on;
grid;
C = zeros(length(u),3);
for i = 1:length(u)
    C(i, :) = PointOnBezierCurve(P, n, u(i));
end
plot3(C(:,1),C(:,2),C(:,3),'r-','LineWidth',2);