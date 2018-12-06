function [u, B] = plot_Bernstein(n)
u = 0:.01:1;
u = u';
color = rand(n+1, 3);
B = zeros(length(u), n+1);
for j = 1: n+1
    for i = 1:length(u)
        B(i, j) = Bernstein(j-1,n, u(i));
    end
    plot(u, B(:,j), 'Color', color(j,:));
    hold on;
end
