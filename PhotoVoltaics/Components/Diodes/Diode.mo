within PhotoVoltaics.Components.Diodes;
model Diode "Diode with one exponential function"
  extends .PhotoVoltaics.Interfaces.PartialDiode;
equation
  i = Ids * (exp(v / m / Vt) - 1) + v / R;
  annotation (
    defaultComponentName = "diode",
    Documentation(info="<html>
<<p>The simple model of a diode solely considers an exponental replationship between current and voltage. The diode formula is:
<pre>                v/Vt
  i  =  Ids ( e      - 1).</pre>

<p>The temperature dependence of the temperature voltage <code>Vt</code> and saturation current of the diode are
considered consistently in the <a href=\"modelica://PhotoVoltaics.Interfaces.PartialDiode\">partial diodel</a> model.
</p></html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end Diode;
