within PhotoVoltaics.Components.SimplePhotoVoltaics;
model SimplePlantSymmetric "Simple plant consisting of symmetric series and parallel connected modules"
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
      final nsModule=nsModule,
      final npModule=npModule), signalCurrent(
      final irradianceRef=moduleData.irradianceRef,
      final alphaRef=moduleData.alphaIsc,
      final IRef=npModule*IphRef));
  parameter Integer nsModule(final min = 1) = 1 "Number of series connected modules";
  parameter Integer npModule(final min = 1) = 1 "Number of parallel connected modules";
  final parameter Real m(start = 2, fixed = false) "Ideality factor of diode";
  final parameter Modelica.Units.SI.Current IsdRef(start=1E-4, fixed=false)
    "Reference saturation current of cell";
  final parameter Modelica.Units.SI.Current IphRef=moduleData.IscRef
    "Reference photo current of cell";
  Modelica.Units.SI.Voltage vCell=v/moduleData.ns/nsModule "Cell voltage";
  Modelica.Units.SI.Current iCell=i/npModule "Cell current";
  Modelica.Units.SI.Current iCellGenerating=-iCell
    "Negative cell current (generating)";
  Modelica.Units.SI.Power powerCell=vCell*iCell "Cell power";
  Modelica.Units.SI.Power powerCellGenerating=vCell*iCellGenerating
    "Negative power consumption (generating)";
  Modelica.Units.SI.Voltage vModule=v/nsModule "Module voltage";
  Modelica.Units.SI.Current iModule=i/npModule "Modile current";
  Modelica.Units.SI.Current iModuleGenerating=-iModule
    "Negative module current (generating)";
  Modelica.Units.SI.Power powerModule=vModule*iModule "Module power";
  Modelica.Units.SI.Power powerModuleGenerating=vModule*iModuleGenerating
    "Negative module power (generating)";
initial equation
  IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
  IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
  annotation (
    Icon(graphics={  Rectangle(extent = {{-84, 82}, {-8, 8}}, lineColor = {0, 0, 0}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255}), Rectangle(extent = {{-76, 74}, {-16, 16}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-46, 76}, {-46, 16}}, color = {255, 255, 255}), Line(points = {{-76, 46}, {-16, 46}}, color = {255, 255, 255}), Rectangle(extent = {{8, 82}, {84, 8}}, lineColor = {0, 0, 0}), Rectangle(extent = {{16, 74}, {76, 16}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{46, 76}, {46, 16}}, color = {255, 255, 255}), Line(points = {{16, 46}, {76, 46}}, color = {255, 255, 255}), Rectangle(extent = {{-84, -8}, {-8, -82}}, lineColor = {0, 0, 0}), Rectangle(extent = {{-76, -16}, {-16, -74}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-46, -14}, {-46, -74}}, color = {255, 255, 255}), Line(points = {{-76, -44}, {-16, -44}}, color = {255, 255, 255}), Rectangle(extent = {{8, -8}, {84, -82}}, lineColor = {0, 0, 0}), Rectangle(extent = {{16, -16}, {76, -74}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{46, -16}, {46, -74}}, color = {255, 255, 255}), Line(points = {{16, -44}, {76, -44}}, color = {255, 255, 255})}));
end SimplePlantSymmetric;
