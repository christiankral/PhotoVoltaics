within PhotoVoltaics.Components.SimplePhotoVoltaics;
model SimpleModuleSymmetric "Simple module consisting of symmetric series connected cells"
  extends .PhotoVoltaics.Interfaces.PartialCell(diode(
      final m=m,
      final R=1E8,
      final Bv=moduleData.BvCell,
      final Ibv=moduleData.Ibv,
      final Nbv=moduleData.Nbv,
      final IRef=moduleData.IscRef,
      final alphaI=moduleData.alphaIsc,
      final alphaV=moduleData.alphaVoc,
      final ns=moduleData.ns,
      final VRef=moduleData.VocCellRef,
      final nsModule=1,
      final npModule=1), signalCurrent(
      final IRef=IphRef,
      final irradianceRef=moduleData.irradianceRef,
      final alphaRef=moduleData.alphaIsc));

  final parameter Real m(start = 2, fixed = false) "Ideality factor of diode";
  final parameter Modelica.Units.SI.Current IsdRef(start=1E-4, fixed=false)
    "Reference saturation current of cell";
  final parameter Modelica.Units.SI.Current IphRef=moduleData.IscRef
    "Reference photo current of cell";
  Modelica.Units.SI.Voltage vCell=v/moduleData.ns "Cell voltage";
  Modelica.Units.SI.Current iCell=i "Cell current";
  Modelica.Units.SI.Current iCellGenerating=-iCell
    "Negative cell current (generating)";
  Modelica.Units.SI.Power powerCell=vCell*iCell "Cell power";
  Modelica.Units.SI.Power powerCellGenerating=vCell*iCellGenerating
    "Negative power consumption (generating)";
initial equation
  IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
  IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
  annotation (
    defaultComponentName = "module",
    Icon(graphics={  Rectangle(lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-76, 76}, {76, -76}}, fillColor = {85, 85, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {255, 255, 255}), Rectangle(extent = {{-84, 84}, {84, -84}}, lineColor = {0, 0, 0}), Polygon(points = {{-84, 76}, {-76, 84}, {-68, 76}, {-76, 68}, {-84, 76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-24, 76}, {-24, -76}}, color = {255, 255, 255}), Polygon(points = {{-8, 76}, {0, 84}, {8, 76}, {0, 68}, {-8, 76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 76}, {76, 84}, {84, 76}, {76, 68}, {68, 76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 0}, {76, 8}, {84, 0}, {76, -8}, {68, 0}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, -76}, {76, -68}, {84, -76}, {76, -84}, {68, -76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, -76}, {-76, -68}, {-68, -76}, {-76, -84}, {-84, -76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-54, 76}, {-54, -76}}, color = {255, 255, 255}), Polygon(points = {{-84, 0}, {-76, 8}, {-68, 0}, {-76, -8}, {-84, 0}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, 0}, {0, 8}, {8, 0}, {0, -8}, {-8, 0}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, -76}, {0, -68}, {8, -76}, {0, -84}, {-8, -76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{0, 76}, {0, -76}}, color = {255, 255, 255}), Line(points = {{24, 76}, {24, -76}}, color = {255, 255, 255}), Line(points = {{54, 76}, {54, -76}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}));
end SimpleModuleSymmetric;
