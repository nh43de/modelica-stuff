model LedBlinker
  extends Modelica.Blocks.Interfaces.partialBooleanSI;
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue = 255) annotation(Placement(visible = true, transformation(origin = {50, 21.78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RedGreenSignalBus redGreenSignalBus annotation(Placement(visible = true, transformation(origin = {120, 53.135}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-33.589, -33.589}, {33.589, 33.589}}, rotation = 0)));
  TriggeredEventTimer2 triggeredEventTimer2 annotation(Placement(visible = true, transformation(origin = {-25, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(booleanToReal.y, redGreenSignalBus.RedSignal) "Red signal" annotation(Line(visible = true, origin = {93.75, 37.457}, points = {{-32.75, -15.678}, {3.25, -15.678}, {3.25, 15.678}, {26.25, 15.678}}, color = {1, 37, 163}));
  connect(u, triggeredEventTimer2.u) annotation(Line(visible = true, origin = {-78.5, 0}, points = {{-41.5, 0}, {41.5, 0}}, color = {190, 52, 178}));
  connect(triggeredEventTimer2.y, booleanToReal.u) annotation(Line(visible = true, origin = {10.568, 27.5}, points = {{-24.568, -27.5}, {7.189, -27.5}, {7.189, 27.5}, {27.432, -5.72}}, color = {190, 52, 178}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end LedBlinker;
