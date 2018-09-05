function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i = 1:m
  J = J + (-y(i)*log(sigmoid(theta'*X(i,:)'))) - (1-y(i))*log(1-sigmoid(theta'*X(i,:)'));
endfor

J = J/m;

test=0;
for j=2:size(theta)
  test = test + (theta(j)^2);
endfor

J= J + ((lambda/(2*m))*test);

for i = 2:length(grad)
  temp = 0;
  for k=1:m
    temp = temp + (sigmoid(theta'*X(k,:)') - y(k)) * X(k,i);
  endfor
  temp = temp/m;
  temp = temp + ((lambda * theta(i))/m);
  grad(i) = temp;
endfor

temp = 0;
for k=1:m
  temp = temp + (sigmoid(theta'*X(k,:)') - y(k)) * X(k,1);
endfor
grad(1) = temp/m;



% =============================================================

end
