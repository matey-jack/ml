function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = meansq(X * theta - y)/2 + sum(theta(2:end) .^ 2)*lambda/m/2;
grad = mean((X*theta - y) .* X)' + lambda/m * [0; theta(2:end)];

%grad = grad(:);

end
