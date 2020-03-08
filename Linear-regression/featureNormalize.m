function X_norm = featureNormalize(X)


  X_norm = X;
  m = size(X,1);
  n = size (X, 2);
  mu = zeros(1,n);
  sigma = zeros(1,n);

  for i=1:n

    mu(1,i) = mean(X(:,i));
    sigma(1,i) = std(X(:,i));

  end

  for i=1:n

        X_norm(:,i) = (X(:,i) - mu(1,i)) / sigma(1,i) ;

  end

end
