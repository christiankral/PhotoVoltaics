within PhotoVoltaics.Examples;
model SimpleCellIrradianceCharacteristic "Voltage current characteristic for different irradiances"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell(useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  PhotoVoltaics.Sources.Blocks.TriangleAndStep triangleAndStep(T = 1, stepHeight = 1000, triangleHeight = 8, triangleOffset = -4) annotation (
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.Blocks.Power10 power10(k = moduleData.VocCellRef / moduleData.IscRef) annotation (
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(variableResistor.n, ground.p) annotation (
    Line(points = {{40, -10}, {40, -10}, {40, -20}, {0, -20}, {0, -30}}, color = {0, 0, 255}));
  connect(cell.p, variableResistor.p) annotation (
    Line(points = {{0, 10}, {0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
  connect(ground.p, cell.n) annotation (
    Line(points = {{0, -30}, {0, -18}, {0, -10}, {-1.77636e-15, -10}}, color = {0, 0, 255}));
  connect(triangleAndStep.step, cell.variableIrradiance) annotation (
    Line(points = {{-49, 6}, {-30, 6}, {-30, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(triangleAndStep.triangle, power10.u) annotation (
    Line(points = {{-49, -6}, {-30, -6}, {-30, -60}, {92, -60}, {92, 0}, {82, 0}}, color = {0, 0, 127}));
  connect(variableResistor.R, power10.y) annotation (
    Line(points={{52,0},{59,0}},      color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(initialScale = 0.1)),
    Documentation(info = "<html>
<p>This example demonstrates the dependency of the voltage current characteristic of photo voltaic cell
as a function of irradiance. Investigate the following plots:</p>
<ul>
<li><code>cell.iGenerating</code> on the vertical axis and <code>cell.v</code>
on the horizontal axis</li>
<li><code>cell.power</code> on the vertical axis and <code>cell.v</code>
on the horizontal axis</li>
</ul>
</html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.0001),
    __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
end SimpleCellIrradianceCharacteristic;
