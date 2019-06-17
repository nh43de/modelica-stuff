model AnalogLedModel
  extends Modelica.Blocks.Interfaces.partialBooleanSI;
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(visible = true, transformation(origin = {-35, 15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 255) annotation(Placement(visible = true, transformation(origin = {-85, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(Placement(visible = true, transformation(origin = {-82.631, -8.451}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput u annotation(Placement(visible = true, transformation(origin = {-168.447, 15}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput led_out annotation(Placement(visible = true, transformation(origin = {158.443, 16.73}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 4.002}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u, switch1.u2) annotation(Line(visible = true, origin = {-107.724, 15}, points = {{-60.723, 0}, {60.724, 0}}, color = {190, 52, 178}));
  connect(const.y, switch1.u1) annotation(Line(visible = true, origin = {-55.25, 31.5}, points = {{-18.75, 8.5}, {5.25, 8.5}, {5.25, -8.5}, {8.25, -8.5}}, color = {1, 37, 163}));
  connect(const1.y, switch1.u3) annotation(Line(visible = true, origin = {-54.658, -0.726}, points = {{-16.973, -7.726}, {4.658, -7.726}, {4.658, 7.726}, {7.658, 7.726}}, color = {1, 37, 163}));
  connect(led_out, switch1.y) annotation(Line(visible = true, origin = {23.111, 15.865}, points = {{135.332, 0.865}, {-44.111, 0.865}, {-44.111, -0.865}, {-47.111, -0.865}}, color = {1, 37, 163}));
  annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end AnalogLedModel;
