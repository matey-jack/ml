function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%

% You need to set these values correctly
mu = mean(X);
sigma = std(X);

% Pointwise operations magically spread over first dimension of x 
% and align second dimension of x with first and only dimension of mu and sigma.

% Doc says: "Broadly speaking, smaller arrays are “broadcast” across the larger one, 
% until they have a compatible shape."
X_norm = (X .- mu) ./ sigma;

end
