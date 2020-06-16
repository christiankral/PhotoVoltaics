within PhotoVoltaics.Examples;
model SimpleModuleMPTable "Simple module with table data supplies quasi static single phase AC grid with maximum power tracker"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleModuleSymmetric module(moduleData = moduleData, T = 298.15, useConstantIrradiance = false) annotation (
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  PhotoVoltaics.Components.Converters.QuasiStaticSinglePhaseConverter converter annotation (
    Placement(transformation(extent = {{20, -10}, {40, 10}})));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(VmpRef = moduleData.VmpRef, ImpRef = moduleData.ImpRef) annotation (
    Placement(transformation(extent = {{0, -60}, {20, -40}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
    Placement(transformation(extent = {{70, -40}, {90, -20}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(f = 50, V = 230, phi = 0, gamma(fixed = true, start = 0)) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, 0})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent = {{-20, 10}, {0, 30}})));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(transformation(extent = {{60, 60}, {80, 80}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table = [0, 0; 3600, 0; 7200, 0; 10800, 0; 14400, 1.791; 18000, 181.785; 21600, 447.07; 25200, 706.85; 28800, 906.39; 32400, 876.01; 36000, 912.06; 39600, 943.667; 43200, 929.95; 46800, 866.84; 50400, 754.391; 54000, 605.701; 57600, 431.762; 61200, 243.718; 64800, 74.584; 68400, 0; 72000, 0; 75600, 0; 79200, 0; 82800, 0; 86400, 0]) annotation (
    Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
equation
  connect(groundDC.p, module.n) annotation (
    Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
  connect(groundDC.p, converter.dc_n) annotation (
    Line(points = {{-40, -20}, {-40, -20}, {20, -20}, {20, -10}}, color = {0, 0, 255}));
  connect(mpTracker.vRef, converter.vDCRef) annotation (
    Line(points = {{21, -50}, {24, -50}, {24, -12}}, color = {0, 0, 127}));
  connect(converter.ac_n, groundAC.pin) annotation (
    Line(points = {{40, -6}, {40, -20}, {80, -20}}, color = {85, 170, 255}));
  connect(groundAC.pin, voltageSource.pin_n) annotation (
    Line(points = {{80, -20}, {80, -20}, {80, -10}}, color = {85, 170, 255}));
  connect(module.p, powerSensor.pc) annotation (
    Line(points = {{-40, 10}, {-40, 10}, {-40, 20}, {-20, 20}}, color = {0, 0, 255}));
  connect(powerSensor.nc, converter.dc_p) annotation (
    Line(points = {{0, 20}, {0, 20}, {20, 20}, {20, 10}}, color = {0, 0, 255}));
  connect(mpTracker.power, powerSensor.power) annotation (
    Line(points={{-2,-50},{-18,-50},{-18,9}},                   color = {0, 0, 127}));
  connect(powerSensor.pc, powerSensor.pv) annotation (
    Line(points = {{-20, 20}, {-20, 30}, {-10, 30}}, color = {0, 0, 255}));
  connect(powerSensor.nv, groundDC.p) annotation (
    Line(points = {{-10, 10}, {-10, 10}, {-10, -18}, {-10, -20}, {-40, -20}}, color = {0, 0, 255}));
  connect(converter.ac_p, voltageSource.pin_p) annotation (
    Line(points = {{40, 6}, {40, 6}, {40, 20}, {80, 20}, {80, 10}}, color = {85, 170, 255}));
  connect(combiTimeTable.y[1], module.variableIrradiance) annotation (
    Line(points = {{-59, 0}, {-52, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StopTime = 86400, Tolerance = 1e-6, StartTime = 0, Interval = 172.8),
    __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
end SimpleModuleMPTable;
