%% - Genetic Algorithm drills

lb = [-3,3];
ub = [3,3];
n_vars = 2;

options = optimoptions(@ga, ...
                    'PopulationSize', 5000, ...
                    'MaxGenerations', 100, ...
                    'EliteCount', 10, ...
                    'FunctionTolerance', 1e-8, ...
                    'PlotFcn', @gaplotbestf);

v1 = 2;
v2 = 5;

[x,fval] = ga(@(x)max_fun(x,v1,v2),n_vars,[],[],[],[],lb,ub,[],options);

disp(x)
disp(fval)

[x,fval] = ga(@min_func,2);
disp(x)
disp(fval)
% ------------------------ Objective functions -----------------------------

% Easy

function y = max_fun(x,v1,v2)

   y = 100 * (x(1)^2*v1 - x(2)*v2) ^2 + (1 - x(1))^2;
   %y = -y;

end

% Harder

function f = min_func(x)

    f = zeros(1,size(x,1));

    for i = 1:size(x,1)
        if  x(i,1) < -5
            f(i) = (x(i,1)+5)^2 + abs(x(i,2));
        elseif x(i,1) < -3
            f(i) = -2*sin(x(i,1)) + abs(x(i,2));
        elseif x(i,1) < 0
            f(i) = 0.5*x(i,1) + 2 + abs(x(i,2));
        elseif x(i,1) >= 0
            f(i) = .3*sqrt(x(i,1)) + 5/2 +abs(x(i,2));
        end
    end

end