model TestModel2
  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime = 1) annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RecycleTimer recycleTimer(recycle = false) annotation(Placement(visible = true, transformation(origin = {2.129, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(booleanStep.y, recycleTimer.u) annotation(Line(visible = true, origin = {-44.436, 30}, points = {{-34.564, 0}, {34.564, 0}}, color = {190, 52, 178}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TestModel2;
