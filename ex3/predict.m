function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

%size(X)
%size(Theta1)
%size(Theta2)

% Useful values
m = size(X, 1);

A1 = [ones(m, 1) X];
%size(A1)

A2 = [ones(m, 1) sigmoid(A1 * Theta1')];
%size(A2)

A3 = sigmoid(A2 * Theta2');
%size(A3)

[maxvalue, p] = max(A3, [], 2);
%size(p)

end
