%% Machine Learning Online Class

x = [1, 2, 3]'
x = [x, x.*2]
y = [2, 5, 5]'

mu = mean(x)
si = std(x)

m = length(x)
X = [ones(m, 1), x]

theta = zeros(2, 1)
cost = computeCost(X, y, theta)

fprintf('One iteration step: cost should decrease. \n');
theta = theta - sum((X*theta - y) .* X)' / m .* alpha
cost = computeCost(X, y, theta)


