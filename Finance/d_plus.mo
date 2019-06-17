function d_plus "From black scholes"
  extends Modelica.Icons.Function;
  input Real S "Stock price";
  input Real X "Strike price";
  input Real T "Excercise time";
  input Real r "Rate";
  input Real sigma "Volatility";
  output Real y;
algorithm
  y := (ln(S / X) + (r + 1 / 2 * sigma ^ 2) * (T - t)) / (sigma * sqrt(T - t));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end d_plus;
