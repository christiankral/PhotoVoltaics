within PhotoVoltaics.Components.Diodes;
model Diode "Diode with one exponential function"
  extends .PhotoVoltaics.Interfaces.PartialDiode;
equation
  i = Ids * (exp(v / m / Vt) - 1) + v / R;
  annotation (
    defaultComponentName = "diode",
    Documentation(info="<html>
<p>The simple model of a Zener diode is derived from 
<a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. 
It consists of the diode including parallel ohmic resistance <code>R</code>. The diode formula is:</p>
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ) + v / R</pre>

<p>
This diode model consists of the superposition of two exponential curves, one of the forward and one of the backwards direction.</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end Diode;
