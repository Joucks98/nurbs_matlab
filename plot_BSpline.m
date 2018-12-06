function plot_BSpline(P, p, U)
u = 0:.01:1;
u = u*max(U);
%P = rand(n+1, 3);
% figure;
plot3(P(:,1), P(:,2), P(:,3), 'b*:');
hold on;
grid;
C = zeros(length(u),3);
C1 = zeros(length(u),3);
for i = 1:length(u)
    C(i, :) = PointOnBSpline(P,p,U,u(i));
    C1(i,:) = deBoor(P,U,p,u(i));
end
plot3(C(:,1),C(:,2),C(:,3),'r-','LineWidth',2,'MarkerEdgeColor','k');
plot3(C1(:,1),C1(:,2),C1(:,3),'b--','LineWidth',2,'MarkerEdgeColor','k');
end