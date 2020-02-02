within PhotoVoltaics.Sources.Electrical;
model SignalCurrent "Generic current source using the input signal as source current"
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
  parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature";
  parameter Modelica.SIunits.Current IRef = 1 "Reference current at reference irradiance and reference temperature";
  parameter Modelica.SIunits.Irradiance irradianceRef = 1000 "Reference solar irradiance";
  parameter Modelica.SIunits.LinearTemperatureCoefficient alphaRef = 0 "Temperature coefficient of reference current at TRref";
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (
    Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (
    Placement(transformation(extent = {{110, -10}, {90, 10}})));
  Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
  Modelica.SIunits.Current i "Current flowing from pin p to pin n as input signal";
  Modelica.Blocks.Interfaces.RealInput irradiance(unit = "W/m2") "Irradiance" annotation (
    Placement(transformation(origin = {0, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
equation
  i = IRef * (irradiance / irradianceRef + alphaRef * (T_heatPort - TRef));
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
  LossPower = 0;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -90}, {150, -50}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-96, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255})}),
    Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>",
    info="<html>
<p>The signal current source is a converter of real valued irradiance signal into a source current.
Depending on the actual temperature the current is adjusted through a linear temperature coeffficient.</p>
<pre>
i = IRef * (irradiance / irradianceRef + alphaRef * (T_heatPort - TRef))
</pre>
</html>"));
end SignalCurrent;
