block EuroCallOption "Timer measuring the time from the time instant where the Boolean input became true"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real X = 1 "Strike price";
  parameter Real r = 1 "Rate";
  parameter Real T = 1 "Excercise time";
  Modelica.Blocks.Interfaces.RealInput u "Stock price" annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealInput sigma "Volatility" annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, origin = {-0, -80}, rotation = 0), visible = true, iconTransformation(origin = {0, -80}, extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y "Option value" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
protected
  Real S "Stock price";
  Real C_E "Euro call value";
equation
  S = u;
  C_E = y;
  C_E = S * Modelica.Math.Distributions.Normal.cumulative(d_plus(S, X, T, r, time, sigma)) - X * exp(-r * (T - time)) * Modelica.Math.Distributions.Normal.cumulative(d_minus(S, X, T, r, time, sigma));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, 110}, {150, 150}}, textString = "%name"), Text(visible = true, origin = {-176.2, -125.4}, textColor = {64, 64, 64}, extent = {{-20.855, 110}, {20.855, 150}}, textString = "S(t)"), Text(visible = true, origin = {-190.181, -210}, textColor = {64, 64, 64}, extent = {{-38.051, 110}, {38.051, 150}}, textString = "sigma(t)")}));
end EuroCallOption;
