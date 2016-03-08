function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples


J = -mean(y .* log(sigmoid(X * theta)) + (1.-y) .* log(1 .- sigmoid(X * theta))) ...
    + sum(theta(2:end) .^ 2) * lambda/m/2 ;

reg_theta = [0 ; theta(2:end)];
grad = mean((sigmoid(X*theta) - y) .* X, 1)' + reg_theta * lambda / m;


end
