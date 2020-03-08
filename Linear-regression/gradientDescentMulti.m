function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)


  m = length(y);
  J_history = zeros(num_iters, 1);
  

  for iter = 1:num_iters
  
    hypo = X * theta;
    errors = hypo - y;
    delta = X' * errors;
    theta = theta - (alpha / m) * delta;




    % Save the cost J in every iteration
    J_history(iter) = computeCost(X, y, theta);

  end

end
