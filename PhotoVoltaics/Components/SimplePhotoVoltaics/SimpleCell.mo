within PhotoVoltaics.Components.SimplePhotoVoltaics;
model SimpleCell "Simple cell model"
  extends .PhotoVoltaics.Interfaces.PartialCell(signalCurrent(
      final irradianceRef=moduleData.irradianceRef,
      final alphaRef=moduleData.alphaIsc,
      final IRef=IphRef), diode(
      final Bv=moduleData.BvCell,
      final Ibv=moduleData.Ibv,
      final Nbv=moduleData.Nbv,
      final VRef=moduleData.VocCellRef,
      final IRef=moduleData.IscRef,
      final alphaI=moduleData.alphaIsc,
      final alphaV=moduleData.alphaVoc,
      final R=1E8,
      final m=m,
      final ns=1,
      final nsModule=1,
      final npModule=1));
  final parameter Real m(start = 2, fixed = false) "Ideality factor of diode";
  final parameter Modelica.SIunits.Current IsdRef(start = 1E-4, fixed = false) "Reference saturation current of cell";
  final parameter Modelica.SIunits.Current IphRef = moduleData.IscRef "Reference photo current of cell";
initial equation
  IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
  IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
  annotation (
    defaultComponentName = "cell",
    Icon(coordinateSystem, graphics={  Polygon(points = {{-80, 60}, {-60, 80}, {60, 80}, {80, 60}, {80, -60}, {60, -80}, {-60, -80}, {-80, -60}, {-80, 60}}, pattern = LinePattern.None, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-40, 80}, {-40, -80}}, color = {255, 255, 255}), Line(points = {{40, 80}, {40, -80}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}),
    Documentation(info="<html>
<p>The basic simple cell model consists of a scalable
<a href=\"modelica://PhotoVoltaics.Components.Diodes.Diode2Module\">diode</a> model and a
<a href=\"modelica://PhotoVoltaics.Sources.Electrical.SignalCurrent\">signal current source</a> with temperature
dependency in order to consider the temperature coefficient of the short circuit of PV cell.</p>

</p>
The diode model used an exponential curve when forward conducting. This exponential curve is parameterized by</p>
<ul>
<li>the ideality factor of the diode, <code>m</code>,</li>
<li>the photo current <code>IphRef</code> at reference conditions (reference temperature and irradiance)</li>
</ul>

<p>
These parameters are determined from the characteristic of the cell, given by the
<a href=\"modelica://PhotoVoltaics.Components.Diodes.Diode\">diode equation</a> and the node equation of the equivalent circuit of Fig. 3(a) of
<a href=\"modelica://PhotoVoltaics.UsersGuide.References\">[Brkic2019]</a> for (1) the open circuit condition and (2) the maximum power point.
</p>

<pre>
  (1)  IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
  (2)  IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
</pre>

<p>
These two equations are evaluated in the <code>initial equation</code> section of this model.
</p>

<p>
The solar irradiance of the model can eithe be constant or provided by signal input. The current of current source
is determined linearely dependent of irradiance.</p>

</html>"));
end SimpleCell;
