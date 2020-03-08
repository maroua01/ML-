function plotData(x, y)

  figure;
  plot3(x(:,1),x(:,2),y,'b--o');
  xlabel('X');
  ylabel('Y');
  zlabel('Z');


end
