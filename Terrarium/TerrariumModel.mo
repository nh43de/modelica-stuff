model TerrariumModel
  LedBlinker ledBlinker annotation(Placement(visible = true, transformation(origin = {85, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime = 1.5) annotation(Placement(visible = true, transformation(origin = {-100, 65}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(booleanStep.y, ledBlinker.u) annotation(Line(visible = true, origin = {-8, 65}, points = {{-81, 0}, {81, 0}}, color = {190, 52, 178}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TerrariumModel;
