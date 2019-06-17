block VariableLimIntegrator "Integrator with limited value of the output"
  import Modelica.Blocks.Types.Init;
  parameter Real k(unit = "1") = 1 "Integrator gain";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialState "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Boolean limitsAtInit = true "= false, if limits are ignored during initialization (i.e., der(y)=k*u)" annotation(Evaluate = true, Dialog(group = "Initialization"));
  parameter Real y_start = 0 "Initial or guess value of output (must be in the limits y_min .. y_max)" annotation(Dialog(group = "Initialization"));
  parameter Boolean strict = false "= true, if strict limits with noEvent(..)" annotation(Evaluate = true, choices(checkBox = true), Dialog(tab = "Advanced"));
  extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
  Modelica.Blocks.Interfaces.RealInput y_max annotation(Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 64.881}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput y_min annotation(Placement(visible = true, transformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -67.424}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
initial equation
  if initType == Init.SteadyState then
    der(y) = 0;
  elseif initType == Init.InitialState or initType == Init.InitialOutput then
    y = y_start;
  end if;
equation
  if initial() and not limitsAtInit then
    der(y) = k * u;
    assert(y >= y_min - 0.001 * abs(y_max - y_min) and y <= y_max + 0.001 * abs(y_max - y_min), "LimIntegrator: During initialization the limits have been ignored.\n" + "However, the result is that the output y is not within the required limits:\n" + "  y = " + String(y) + ", y_min = " + String(y_min) + ", y_max = " + String(y_max));
  elseif strict then
    der(y) = noEvent(if y < y_min and k * u < 0 or y > y_max and k * u > 0 then 0 else k * u);
  else
    der(y) = if y < y_min and k * u < 0 or y > y_max and k * u > 0 then 0 else k * u;
  end if;
  annotation(Documentation(info = "<html>
<p>
This blocks computes <b>y</b> (element-wise) as <i>integral</i>
of the input <b>u</b> multiplied with the gain <i>k</i>. If the
integral reaches a given upper or lower <i>limit</i> and the
input will drive the integral outside of this bound, the
integration is halted and only restarted if the input drives
the integral away from the bounds.
</p>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

<p>
If parameter <b>limitAtInit</b> = <b>false</b>, the limits of the
integrator are removed from the initialization problem which
leads to a much simpler equation system. After initialization has been
performed, it is checked via an assert whether the output is in the
defined limits. For backward compatibility reasons
<b>limitAtInit</b> = <b>true</b>. In most cases it is best
to use <b>limitAtInit</b> = <b>false</b>.
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-80, 78}, {-80, -90}}, color = {128, 128, 128}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(visible = true, points = {{-90, -80}, {82, -80}}, color = {128, 128, 128}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{90, -80}, {68, -72}, {68, -88}, {90, -80}}), Line(visible = true, points = {{-80, -80}, {20, 20}, {80, 20}}, color = {0, 36, 164}), Text(visible = true, textColor = {128, 128, 128}, extent = {{0, -65}, {60, -15}}, textString = "I"), Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, -150}, {150, -110}}, textString = "k=%k"), Line(visible = strict, points = {{20, 20}, {80, 20}}, color = {10, 90, 224})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 36, 164}, extent = {{-60, -60}, {60, 60}}), Text(visible = true, textColor = {64, 64, 64}, extent = {{-54, -48}, {-4, 46}}, textString = "lim"), Line(visible = true, points = {{-100, 0}, {-60, 0}}, color = {0, 36, 164}), Line(visible = true, points = {{60, 0}, {100, 0}}, color = {0, 36, 164}), Text(visible = true, textColor = {64, 64, 64}, extent = {{-8, 2}, {60, 60}}, textString = "k"), Text(visible = true, textColor = {64, 64, 64}, extent = {{-8, -60}, {60, -2}}, textString = "s"), Line(visible = true, points = {{4, 0}, {46, 0}}, color = {64, 64, 64})}));
end VariableLimIntegrator;
