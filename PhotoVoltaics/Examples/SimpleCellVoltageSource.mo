within PhotoVoltaics.Examples;
model SimpleCellVoltageSource
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp rampCurrent(duration = 0.6, height = moduleData.VocCellRef + moduleData.BvCell, offset = -moduleData.BvCell, startTime = 0.2) annotation (
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell(moduleData=moduleData) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(signalVoltage.n, ground.p) annotation (
    Line(points = {{40, -10}, {40, -10}, {40, -20}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(signalVoltage.p, cell.p) annotation (
    Line(points = {{40, 10}, {40, 10}, {40, 20}, {0, 20}, {0, 10}, {0, 10}}, color = {0, 0, 255}));
  connect(ground.p, cell.n) annotation (
    Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
  connect(signalVoltage.v, rampCurrent.y) annotation (
    Line(points = {{47, 0}, {59, 0}, {59, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
end SimpleCellVoltageSource;
