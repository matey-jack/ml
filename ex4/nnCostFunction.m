function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
% expect m × num_input
%size(X)

% Feedforward
A1 = [ones(m, 1) X];
A2 = sigmoid(A1 * Theta1');
% expect m × num_hidden
%size(A2)
A2 = [ones(m, 1) A2];

A3 = sigmoid(A2 * Theta2');
% expect m × num_labels
% size(A3)

% Calculate costs
Ys = linspace(1, num_labels, num_labels);
Y = Ys == y;
J = lambda/2/m * (sum(sum(Theta1(:,2:end) .^ 2)) + sum(sum(Theta2(:,2:end) .^ 2))) ... 
  - sum(sum(Y .* log(A3) + (1.-Y) .* log(1 .- A3))) / m;
 
% Back-Propagation 
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

for t = 1:m
   % Feedforward again, but just one input at a time.
   a1 = [1 X(t, :)];
   % size(a1)
   z2 = a1 * Theta1';
   a2 = [1 sigmoid(z2)];
   % size(a2)
   a3 = sigmoid(a2 * Theta2');
   % size(a3)
   
   % now run back
   d3 = a3 - (Ys == y(t));
   % size(d3)
   Theta2_grad += d3' * a2;
   
   d2 = (Theta2' * d3')(2:end)' .* sigmoidGradient(z2);
   % size(d2)
   Theta1_grad += d2' * a1;   
endfor

Theta2_grad /= m;
Theta1_grad /= m;


% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
