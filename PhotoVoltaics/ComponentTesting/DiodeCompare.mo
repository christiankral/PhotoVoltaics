within PhotoVoltaics.ComponentTesting;
model DiodeCompare "Compare different diode models"
  extends Modelica.Icons.Example;
  parameter Integer ns = 10 "Number of series connected cells";
  parameter Integer nsModule = 2 "Number of series connected modules";
  parameter Integer npModule = 2 "Number of parallel connected modules";
  parameter Modelica.SIunits.Voltage Vmin = -5.30 "Minimum voltage range";
  parameter Modelica.SIunits.Voltage Vmax = +0.75 "Maximum voltage range";
  Modelica.Electrical.Analog.Semiconductors.ZDiode zDiode(useHeatPort = true, R = 1E8, Maxexp = 0.6292 / 0.04, Ids = 1.26092E-6, T = 298.15) annotation (
    Placement(transformation(extent = {{-40, -40}, {-20, -20}})));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(duration = 1, startTime = 0, V = Vmax - Vmin, offset = Vmin) annotation (
    Placement(transformation(extent = {{-40, -70}, {-20, -50}})));
  PhotoVoltaics.Components.Diodes.Diode2exp diode(m = 40 / 25.69, useHeatPort = true) annotation (
    Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
  parameter Records.ModuleData moduleData annotation (
    Placement(transformation(extent = {{-10, 80}, {10, 100}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 318.15) annotation (
    Placement(transformation(extent = {{-90, -20}, {-70, 0}})));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltagem(duration = 1, startTime = 0, V = nsModule * ns * (Vmax - Vmin), offset = nsModule * ns * Vmin) annotation (
    Placement(transformation(extent = {{60, -70}, {80, -50}})));
  Modelica.Electrical.Analog.Basic.Ground groundm annotation (
    Placement(transformation(extent = {{80, -90}, {100, -70}})));
  PhotoVoltaics.Components.Diodes.Diode2Module diodexm(m = 40 / 25.69, useHeatPort = true, nsModule = nsModule, npModule = npModule, ns = ns) annotation (
    Placement(transformation(extent = {{60, 20}, {80, 40}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));
equation
  connect(rampVoltage.p, zDiode.p) annotation (
    Line(points = {{-40, -60}, {-50, -60}, {-50, -30}, {-40, -30}}, color = {0, 0, 255}));
  connect(zDiode.n, rampVoltage.n) annotation (
    Line(points = {{-20, -30}, {-10, -30}, {-10, -60}, {-20, -60}}, color = {0, 0, 255}));
  connect(rampVoltage.p, diode.p) annotation (
    Line(points = {{-40, -60}, {-50, -60}, {-50, 0}, {-40, 0}}, color = {0, 0, 255}));
  connect(rampVoltage.n, diode.n) annotation (
    Line(points = {{-20, -60}, {-16, -60}, {-10, -60}, {-10, 0}, {-20, 0}}, color = {0, 0, 255}));
  connect(fixedTemperature.port, diode.heatPort) annotation (
    Line(points = {{-70, -10}, {-30, -10}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, zDiode.heatPort) annotation (
    Line(points = {{-70, -10}, {-70, -10}, {-60, -10}, {-60, -40}, {-30, -40}}, color = {191, 0, 0}));
  connect(rampVoltagem.n, groundm.p) annotation (
    Line(points = {{80, -60}, {90, -60}, {90, -70}}, color = {0, 0, 255}));
  connect(diodexm.p, rampVoltagem.p) annotation (
    Line(points = {{60, 30}, {50, 30}, {50, -60}, {60, -60}}, color = {0, 0, 255}));
  connect(diodexm.heatPort, fixedTemperature.port) annotation (
    Line(points = {{70, 20}, {70, 20}, {-48, 20}, {-60, 20}, {-60, -10}, {-70, -10}}, color = {191, 0, 0}));
  connect(diodexm.n, groundm.p) annotation (
    Line(points = {{80, 30}, {90, 30}, {90, -70}}, color = {0, 0, 255}));
  connect(ground.p, rampVoltage.n) annotation (Line(points={{-10,-72},{-10,-60},{-20,-60}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end DiodeCompare;
