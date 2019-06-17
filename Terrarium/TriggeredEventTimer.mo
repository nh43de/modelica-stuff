block TriggeredEventTimer "Timer measuring the time from the time instant where the Boolean input became true"
  extends Modelica.Blocks.Interfaces.BooleanSISO;
  parameter Boolean pre_u_start = false "Start value of pre(u) at initial time";
  parameter Real waitDuration = 2 "The duration that the system waits before enabling the signal.";
  parameter Real onDuration = 0.5 "The duration that the signal is on for.";
protected
  Boolean isEnabled(start = false, fixed = true);
initial equation
  pre(u) = pre_u_start;
algorithm
  when initial() then
    isEnabled := u;
  elsewhen edge(u) then
    isEnabled := true;
  end when;
equation
  y = if isEnabled then true else false;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-90, -70}, {82, -70}}, color = {128, 128, 128}), Line(visible = true, points = {{-80, 68}, {-80, -80}}, color = {128, 128, 128}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(visible = true, points = {{-80, -70}, {-60, -70}, {-60, -26}, {38, -26}, {38, -70}, {66, -70}}, color = {190, 53, 179}), Line(visible = true, points = {{-80, 0}, {-62, 0}, {40, 90}, {40, 0}, {68, 0}}, color = {0, 36, 164})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-90, -70}, {82, -70}}, color = {128, 128, 128}), Line(visible = true, points = {{-80, 68}, {-80, -80}}, color = {128, 128, 128}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(visible = true, points = {{-80, -68}, {-60, -68}, {-60, -40}, {-50, -40}, {-50, -68}, {60, -68}}, color = {190, 53, 179}), Text(visible = true, textColor = {128, 128, 128}, extent = {{-88, -4}, {-54, 6}}, textString = "y"), Text(visible = true, textColor = {128, 128, 128}, extent = {{48, -88}, {84, -80}}, textString = "time"), Text(visible = true, textColor = {128, 128, 128}, extent = {{-88, -46}, {-54, -36}}, textString = "u"), Line(visible = true, origin = {0, 58}, points = {{-80, -68}, {30, -68}, {30, -40}, {40, -40}, {40, -68}, {60, -68}}, color = {190, 53, 179})}), Documentation(info = "<html>
<p> When the Boolean input \"u\" becomes <b>true</b>, the timer is started
and the output \"y\" is the time from the time instant where u became true.
The timer is stopped and the output is reset to zero, once the
input becomes false.
</p>
</html>"));
end TriggeredEventTimer;
