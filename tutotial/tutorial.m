% Mainly functions
a = 2;
b = 3;
c = a+b;

x = linspace(-1, 1, 1000);
y = x.^2;
plot(x, y)

x = linspace(-1, 1, 1000);
y = randn(1, 1000);
plot(x, y, "r*")