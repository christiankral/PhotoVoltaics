within PhotoVoltaics.Examples;
model SimpleModuleShadow "Simple module with load resistor, partially shadowed"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleModule module(
    moduleData=moduleData,
    T=298.15,
    shadow=cat(
            1,
            fill(0.2, 1),
            fill(0, moduleData.ns - 1)),
    cell(v(start=zeros(moduleData.ns))),
    diode(i(start=fill(1E-11, moduleData.nb)))) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  PhotoVoltaics.Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(powerRamp.y, variableResistor.R) annotation (
    Line(points={{59,0},{52,0}},      color = {0, 0, 127}));
  connect(variableResistor.n, ground.p) annotation (
    Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
  connect(module.p, variableResistor.p) annotation (
    Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
  connect(ground.p, module.n) annotation (
    Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.0001),
    __OpenModelica_simulationFlags(s = "dassl", lv = "LOG_STATS", jacobian = "coloredNumerical", nls = "newton", nlssMaxDensity = "0", variableFilter = ".*"));
end SimpleModuleShadow;