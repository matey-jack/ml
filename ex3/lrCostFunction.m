function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 


m = length(y);

J = -mean(y .* log(sigmoid(X * theta)) + (1.-y) .* log(1 .- sigmoid(X * theta))) ...
    + sum(theta(2:end) .^ 2) * lambda/m/2 ;

reg_theta = [0 ; theta(2:end)];
grad = mean((sigmoid(X*theta) - y) .* X, 1)' + reg_theta * lambda / m;

% following line was in provided template. let's see if we'll need it ;)
% grad = grad(:);

end
