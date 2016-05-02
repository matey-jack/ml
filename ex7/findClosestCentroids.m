function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
[K, N] = size(centroids);
[M, N] = size(X);
% N = size(X, 2);  %% size(centroids, 2)

% You need to return the following variables correctly.
idx = zeros(M, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

for m = 1:M
  ds = zeros(1, K);
  for k = 1:K
     ds(k) = sumsq(X(m,:) - centroids(k,:));
     % printf("%d ", ds(k));
  end
  % printf("\n");
  [d, i] = min(ds);
  idx(m) = i;
end

end

