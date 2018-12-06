function [T, F] = MLS2(x, y)
y(30) = y(30)+.1;
y(16) = y(16)+.2;
% figure;
% scatter(x,y,'filled'); 
len_x = length(x);

max_x = max(x); 
min_x = min(x);

num = 1000; 
delta = (max_x-min_x)/num; 
x_f =[]; 
f =[]; 
max_delta = (max_x-min_x)*1/3; 
for i=0:num 
    x_val = min_x + i*delta; 
    x_f = [x_f,x_val]; 
    A = zeros(3,3); 
    B = []; 
    for j=1:len_x 
        s = abs(x(j)-x_val)/max_delta; 
        if s<=0.5 
            w = 2/3-4*s^2+4*s^3; 
        elseif s<=1 
            w = 4/3-4*s+4*s^2-4*s^3/3; 
        else 
            w = 0; 
        end
%         A = A + w*[1;x(j);x(j)*x(j)]*[1,x(j),x(j)*x(j)];
%         B = [B,w*[1;x(j);x(j)*x(j)]];
A = A + w*[(1-x(j))^2; 2*x(j)*(1-x(j)); x(j)^2]*[(1-x(j))^2, 2*x(j)*(1-x(j)), x(j)^2];
B = [B, w*[(1-x(j))^2; 2*x(j)*(1-x(j)); x(j)^2]];
    end
    %f = [f, [1,x_val,x_val*x_val]*(A\(B*y'))];
    f = [f, [(1-x_val)^2, 2*x_val*(1-x_val), x_val^2]*(A\(B*y'))];
end
% hold on 
% plot(x_f,f,'r');
T = x_f;
F = f;
end
