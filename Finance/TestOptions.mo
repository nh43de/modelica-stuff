model TestOptions
  EuroCallOption euroCallOption(X = 98, r = 0.03, T = 0.0494) annotation(Placement(visible = true, transformation(origin = {26.893, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Volatility(k = 0.31) annotation(Placement(visible = true, transformation(origin = {-110, 38.343}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant StockPrice(k = 107.88) annotation(Placement(visible = true, transformation(origin = {-135, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.TruncatedNormalNoise truncatedNormalNoise(samplePeriod = 1.90259e-6, y_min = 0.23, y_max = 0.38) annotation(Placement(visible = true, transformation(origin = {-110, 2.991}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.TruncatedNormalNoise truncatedNormalNoise1(samplePeriod = 30 * 1.90259e-6, y_min = 106.35 - 8, y_max = 106.35 + 8) annotation(Placement(visible = true, transformation(origin = {-75, 75}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k1 = -500, k2 = 480) annotation(Placement(visible = true, transformation(origin = {65, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.StandardDeviation standardDeviation(t_eps = 0.01) annotation(Placement(visible = true, transformation(origin = {-40, 47.577}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(truncatedNormalNoise1.y, euroCallOption.u) annotation(Line(visible = true, origin = {-6.33, 67.5}, points = {{-57.67, 7.5}, {18.223, 7.5}, {18.223, -7.5}, {21.223, -7.5}}, color = {1, 37, 163}));
  connect(euroCallOption.y, add.u1) annotation(Line(visible = true, origin = {47.723, 40.5}, points = {{-9.83, 19.5}, {2.277, 19.5}, {2.277, -19.5}, {5.277, -19.5}}, color = {1, 37, 163}));
  connect(truncatedNormalNoise1.y, add.u2) annotation(Line(visible = true, origin = {-11.24, 42}, points = {{-52.76, 33}, {-5.74, 33}, {-5.74, -33}, {64.24, -33}}, color = {1, 37, 163}));
  connect(truncatedNormalNoise1.y, standardDeviation.u) annotation(Line(visible = true, origin = {-56.5, 61.288}, points = {{-7.5, 13.712}, {1.5, 13.712}, {1.5, -13.712}, {4.5, -13.712}}, color = {1, 37, 163}));
  connect(standardDeviation.y, euroCallOption.sigma) annotation(Line(visible = true, origin = {2.42, 49.788}, points = {{-31.42, -2.212}, {9.473, -2.212}, {9.473, 2.212}, {12.473, 2.212}}, color = {1, 37, 163}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TestOptions;
