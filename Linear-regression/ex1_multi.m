clear ; close all; clc

fprintf('Loading data ...\n');

%% Loading Data
data = load('dataSet.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
n = size(X,2);

%visualizing
plotData(X,y);



%Normalizing
fprintf('Normalizing Features ...\n');
X = featureNormalize(X);


% Add intercept term to X
X = [ones(m, 1) X];

% Gradient descent 
fprintf('Running gradient descent ...\n');

alpha = 0.1;
num_iters = 400;

% Init Theta and Run Gradient Descent
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');


fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');


%price = 0;
%price = [1 , 1650 , 3] * theta


x = [1 1650 3]';
price = theta' * x;



fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

% *************** USING NORMAL EQUATION **************** %*

fprintf('Solving with normal equations...\n');

%% Load Data
data = csvread('dataSet.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


price = 0; 
x = [1 1650 3]';
price = theta' * x;



fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

