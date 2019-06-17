block ReflectingLimIntegrator "Integrator with limited value of the output"
  extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
  parameter Real k(unit = "1") = 1 "Integrator gain";
  parameter Real y_start = 0 "Initial or guess value of output (must be in the limits outMin .. outMax)" annotation(Dialog(group = "Initialization"));
  parameter Real y_min = 0;
  parameter Real y_max = 1;
  Real y_raw = y_start;
  Real test1;
  Real test2;
  Real test3;
  Real r = 0;
  Boolean reflected = false;
initial equation
  y = y_start;
equation
  der(y_raw) = u;
  der(r) = (if reflected then -2.0 else 0.0) * k * u * test1 * test2 * test3;
  y = y_raw + r;
  when y < y_min or y > y_max then
    reflected = not reflected;
    reinit(r, pre(r));
  end when;
  //☻☻☻☻☻☻☻☻☻☻☻☻
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
end ReflectingLimIntegrator;
