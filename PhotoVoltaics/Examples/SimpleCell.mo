within PhotoVoltaics.Examples;
model SimpleCell
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
  PhotoVoltaics.Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell(moduleData=moduleData) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cell.p, variableResistor.p) annotation (
    Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
  connect(ground.p, cell.n) annotation (
    Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
  connect(ground.p, variableResistor.n) annotation (
    Line(points = {{0, -20}, {14, -20}, {40, -20}, {40, -10}}, color = {0, 0, 255}));
  connect(variableResistor.R, powerRamp.y) annotation (
    Line(points = {{51, -2.22045e-15}, {49.5, -2.22045e-15}, {49.5, 0}, {59, 0}}, color = {0, 0, 127}));
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
end SimpleCell;
