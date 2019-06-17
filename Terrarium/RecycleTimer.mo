block RecycleTimer "Timer measuring the time from the time instant where the Boolean input became true"
  extends Modelica.Blocks.Interfaces.BooleanSISO;
  parameter Real offDuration = 2;
  parameter Real onDuration = 0.5;
  parameter Boolean startOn = false "Whether the system begins with the on cycle or off cycle. True indicates the system will start in the on state when triggered.";
  parameter Boolean recycle = true;
  //  Modelica.Blocks.Interfaces.BooleanInput u "Connector of Boolean input signal" annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, origin = {0, 0}, rotation = 0), visible = true, iconTransformation(origin = {0, 0}, extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
  //  Modelica.Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}, origin = {0, 0}, rotation = 0), visible = true, iconTransformation(origin = {0, 0}, extent = {{100, -10}, {120, 10}}, rotation = 0)));
protected
  Boolean isEnabled(start = false, fixed = true);
  discrete Modelica.SIunits.Time cycleBeginTime;
initial equation
  pre(u) = false;
  pre(cycleBeginTime) = time;
algorithm
  when initial() then
    isEnabled := u;
    cycleBeginTime := time;
  elsewhen u then
    isEnabled := true;
    cycleBeginTime := time;
  elsewhen not u then
    isEnabled := false;
    cycleBeginTime := time;
  elsewhen time > cycleBeginTime + onDuration + offDuration then
    if recycle then
      cycleBeginTime := time;
    else
      isEnabled := false;
    end if;
  end when;
equation
  if isEnabled then
    if startOn then
      y = if time - cycleBeginTime < onDuration then true else false;
    else
      y = if time - cycleBeginTime < offDuration then false else true;
    end if;
  else
    y = false;
  end if;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-90, -70}, {82, -70}}, color = {128, 128, 128}), Line(visible = true, points = {{-80, 68}, {-80, -80}}, color = {128, 128, 128}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(visible = true, points = {{-80, -70}, {-60, -70}, {-60, -26}, {38, -26}, {38, -70}, {66, -70}}, color = {190, 53, 179}), Line(visible = true, points = {{-80, 0}, {-62, 0}, {40, 90}, {40, 0}, {68, 0}}, color = {0, 36, 164})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-90, -70}, {82, -70}}, color = {128, 128, 128}), Line(visible = true, points = {{-80, 68}, {-80, -80}}, color = {128, 128, 128}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}), Polygon(visible = true, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(visible = true, points = {{-80, -68}, {-60, -68}, {-60, -40}, {-50, -40}, {-50, -68}, {60, -68}}, color = {190, 53, 179}), Text(visible = true, textColor = {128, 128, 128}, extent = {{-88, -4}, {-54, 6}}, textString = "y"), Text(visible = true, textColor = {128, 128, 128}, extent = {{48, -88}, {84, -80}}, textString = "time"), Text(visible = true, textColor = {128, 128, 128}, extent = {{-88, -46}, {-54, -36}}, textString = "u"), Line(visible = true, origin = {0, 58}, points = {{-80, -68}, {30, -68}, {30, -40}, {40, -40}, {40, -68}, {60, -68}}, color = {190, 53, 179})}), Documentation(info = "<html>
<p> When the Boolean input \"u\" becomes <b>true</b>, the timer is started
and the output \"y\" is the time from the time instant where u became true.
The timer is stopped and the output is reset to zero, once the
input becomes false.
</p>
</html>"));
end RecycleTimer;
