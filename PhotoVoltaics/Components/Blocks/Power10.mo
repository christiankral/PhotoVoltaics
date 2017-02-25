within PhotoVoltaics.Components.Blocks;
model Power10
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real k "Gain";
equation
  y = k * 10 ^ u;
  annotation (
    Icon(coordinateSystem, graphics={  Polygon(origin = {-10, -40}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}), Line(origin = {10, -40}, points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Line(origin = {-18, 14}, rotation = 180, points = {{-79.6, -46}, {-76.8, -21.3}, {-75.2, -11.4}, {-72.8, -1.31}, {-69.5, 8.08}, {-64.7, 17.9}, {-57.5, 28}, {-47, 38.1}, {-31.8, 48.1}, {-10.1, 58}, {22.1, 66}, {62.7, 72.1}}, smooth = Smooth.Bezier), Polygon(origin = {80, -8}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(origin = {80, 0}, points = {{-80, -80}, {-80, 68}}, color = {192, 192, 192}), Text(origin = {-16, 62}, lineColor = {192, 192, 192}, extent = {{-30, -22}, {60, -70}}, textString = "10^")}),
    Documentation(info = "<html>
<p>This block calculates <code>y = k * 10^u</code> and
represents thus the inverse of 
<a href=\"modelica://Modelica.Blocks.Math.Log10\">Log10</a>.
</html>"),
    Diagram);
end Power10;
