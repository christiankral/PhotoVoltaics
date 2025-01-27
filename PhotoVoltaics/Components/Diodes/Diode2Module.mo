within PhotoVoltaics.Components.Diodes;
model Diode2Module "Diode model with four different sections including breakthrough"
  extends .PhotoVoltaics.Interfaces.PartialDiode;
  parameter Modelica.Units.SI.Voltage Bv=5.1 "Breakthrough voltage";
  parameter Modelica.Units.SI.Current Ibv=0.7 "Breakthrough knee current";
  parameter Real Nbv = 0.74 "Breakthrough emission coefficient";
  parameter Integer ns = 1 "Number of series connected cells per module";
  parameter Integer nsModule(final min = 1) = 1 "Number of series connected modules";
  parameter Integer npModule(final min = 1) = 1 "Number of parallel connected modules";
  final parameter Modelica.Units.SI.Voltage VtRef=Modelica.Constants.k*
      TRef/Q "Reference voltage equivalent of temperature";
  final parameter Modelica.Units.SI.Voltage VBv=(-m*Nbv*log(IdsRef*Nbv/
      Ibv)*VtRef) - Bv "Voltage limit of approximation of breakthrough";
  final parameter Modelica.Units.SI.Current IdsRef=IRef/(exp(VRef/m/VtRef)
       - 1) "Reference saturation current";
  final parameter Modelica.Units.SI.Voltage VNegLin=(-VRef/m/VtRef*(Nbv*m*
      VtRef)) - Bv "Limit of linear range left of breakthrough";
  Modelica.Units.SI.Voltage VNeg "Limit of linear negative voltage range";
  Modelica.Units.SI.Voltage vCell=v/ns/nsModule "Cell voltage";
  Modelica.Units.SI.Voltage vModule=v/nsModule "Module voltage";
  Modelica.Units.SI.Current iModule=i/npModule "Module current";
  constant Integer MaxExp = 30;
equation
  // Voltage limit of negative range
  VNeg = m * Vt * log(Vt / VtRef);
  // Current approximation
  i / npModule = smooth(1, if v / ns / nsModule > VNeg then Ids * (Functions.exlin(v / ns / nsModule / m / Vt, MaxExp) - 1) + v / ns / nsModule / R elseif v / ns / nsModule > VBv then Ids * v / ns / nsModule / m / VtRef + v / ns / nsModule / R
   elseif v / ns / nsModule > VNegLin then (-Ibv * Functions.exlin(-(v / ns / nsModule + Bv) / (Nbv * m * Vt), MaxExp)) + Ids * VBv / m / VtRef + v / ns / nsModule / R else Ids * v / ns / nsModule / m / Vt - Ibv * Functions.exlin(VRef / m / VtRef, MaxExp) * (1 - (v / ns / nsModule + Bv) / (Nbv * m * Vt) - VRef / m / VtRef) + v / ns / nsModule / R);
  annotation (
    defaultComponentName = "diode",
    Documentation(info="<html>
<p>This model consists of four different regions:<p>
<ul>
<li>Forward direction: exponential function, see <a href=\"modelica://PhotoVoltaics.Components.Diodes.Diode2exp\">Diode2exp</a></li>
<li>Backwards direction: linear, before reaching backwards breakthrough region<li>
<li>Breaktrough: exponential function, see <a href=\"modelica://PhotoVoltaics.Components.Diodes.Diode2exp\">Diode2exp</a></li>
<li>Beyond breakthrough: linear region in order to limit magnitude of exponential breakthrough</li>
</ul>

<p>One particular feature of this scalable model is that this diode can be used to model cells, symmetric modules and symmetric plants,
as </p>
<ul>
<li>the number of series connections of a module,</li>
<li>the number of series connections of a plant,</li>
<li>the number of parallel connections of a plant</li>
</ul>
<p>can be considered.</p>

<p>The breakthrough parameters are basically taken from
<a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>.
</p>

<p>The temperature dependence of the temperature voltage <code>Vt</code> and saturation current of the diode are
considered consistently in the <a href=\"modelica://PhotoVoltaics.Interfaces.PartialDiode\">partial diodel</a> model.
</p></html>"),
  Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot), Polygon(points = {{-8, 46}, {-68, 86}, {-68, 6}, {-8, 46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{-8, 86}, {-8, 6}}, color = {0, 0, 255}), Polygon(points = {{72, 46}, {12, 86}, {12, 6}, {72, 46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{72, 86}, {72, 6}}, color = {0, 0, 255}), Polygon(points = {{-8, -46}, {-68, -6}, {-68, -86}, {-8, -46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{-8, -6}, {-8, -86}}, color = {0, 0, 255}), Polygon(points = {{72, -46}, {12, -6}, {12, -86}, {72, -46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{72, -6}, {72, -86}}, color = {0, 0, 255}), Line(points = {{100, 46}, {100, -46}}, color = {28, 108, 200}), Line(points = {{-100, 46}, {-100, -46}}, color = {28, 108, 200}), Line(points = {{-100, 46}, {100, 46}}, color = {0, 0, 255}), Line(points = {{-100, -46}, {100, -46}}, color = {0, 0, 255})}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end Diode2Module;
