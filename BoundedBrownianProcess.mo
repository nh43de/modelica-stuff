model BoundedBrownianProcess
  extends Modelica.Blocks.Interfaces.PartialNoise;
  Modelica.Blocks.Noise.NormalNoise normalNoise(sigma = 1, mu = 0, useGlobalSeed = useGlobalSeed, useAutomaticLocalSeed = useAutomaticLocalSeed, fixedLocalSeed = fixedLocalSeed, startTime = startTime, enableNoise = enableNoise, y_off = y_off) annotation(Placement(visible = true, transformation(origin = {-45, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y "Bounded y" annotation(Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real y_start = 0;
  Modelica.Blocks.Interfaces.RealInput a "Lower limit" annotation(Placement(visible = true, transformation(origin = {-120, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput b "Upper limit" annotation(Placement(visible = true, transformation(origin = {-120, 55.302}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  VariableLimIntegrator variableLimIntegrator(y_start = y_start) annotation(Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(normalNoise.y, variableLimIntegrator.u) annotation(Line(visible = true, origin = {-4, 65}, points = {{-30, 5}, {4, 5}, {4, -5}, {22, -5}}, color = {1, 37, 163}));
  connect(variableLimIntegrator.y_max, b) annotation(Line(visible = true, origin = {-33.519, 60.895}, points = {{51.519, 5.593}, {17.481, 5.593}, {17.481, -5.593}, {-86.481, -5.593}}, color = {1, 37, 163}));
  connect(variableLimIntegrator.y_min, a) annotation(Line(visible = true, origin = {-73.775, 11.629}, points = {{91.775, 41.629}, {-22.775, 41.629}, {-22.775, -41.629}, {-46.225, -41.629}}, color = {1, 37, 163}));
  connect(variableLimIntegrator.y, y) annotation(Line(visible = true, origin = {75.5, 60}, points = {{-34.5, 0}, {34.5, 0}}, color = {1, 37, 163}));
end BoundedBrownianProcess;
