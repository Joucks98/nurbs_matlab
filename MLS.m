clc;clear; 
%ÇúÏßÄâºÏ

%x=[0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]; 
%y=[0, 4, 5, 14, 15, 14.5, 14, 12, 10, 5, 4]; 


[T,F] = MLS(x, y)
%x = 0:.1:2*pi;
%y = sin(x);

y(30) = y(30)+.5;
y(16) = y(16)+.2;
figure;
scatter(x,y,'filled'); 
len_x = length(x);

max_x = max(x); 
min_x = min(x);

num = 100; 
delta = (max_x-min_x)/num; 
x_f =[]; 
f =[]; 
max_delta = (max_x-min_x)*1/20; 
for i=0:num 
    x_val = min_x + i*delta; 
    x_f = [x_f,x_val]; 
    A = zeros(2,2); 
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
        A = A + w*[1;x(j)]*[1,x(j)];
        B = [B,w*[1;x(j)]];
    end
    f = [f, [1,x_val]*(A\(B*y'))];
end
hold on 
plot(x_f,f,'r');
T = x_f;
F = f;