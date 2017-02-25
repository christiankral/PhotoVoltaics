within PhotoVoltaics.Components.Diodes;
model Diode2exp "Diode with two superimposed exponential functions"
  extends .PhotoVoltaics.Interfaces.PartialDiode;
  parameter Modelica.SIunits.Voltage Bv = 5.1 "Breakthrough voltage";
  parameter Modelica.SIunits.Current Ibv = 0.7 "Breakthrough knee current";
  parameter Real Nbv = 0.74 "Breakthrough emission coefficient";
equation
  i = Ids * (exp(v / m / Vt) - 1) - Ibv * exp(-(v + Bv) / (Nbv * m * Vt)) + v / R;
  annotation (
    defaultComponentName = "diode",
    Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255}), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end Diode2exp;
