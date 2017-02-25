within PhotoVoltaics.Components.SimplePhotoVoltaics;
model SimpleCell
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
    Icon(coordinateSystem, graphics={  Polygon(points = {{-80, 60}, {-60, 80}, {60, 80}, {80, 60}, {80, -60}, {60, -80}, {-60, -80}, {-80, -60}, {-80, 60}}, pattern = LinePattern.None, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-40, 80}, {-40, -80}}, color = {255, 255, 255}), Line(points = {{40, 80}, {40, -80}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}));
end SimpleCell;
