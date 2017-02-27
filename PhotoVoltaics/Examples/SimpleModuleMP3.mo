within PhotoVoltaics.Examples;
model SimpleModuleMP3
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleModuleSymmetric module(
    moduleData=moduleData,
    T=298.15,
    useConstantIrradiance=false) annotation (Placement(visible=true, transformation(
        origin={-40,0},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 100, startTime = 100, height = 800, offset = 200) annotation (
    Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
  PhotoVoltaics.Components.Converters.QuasiStaticMultiPhaseConverter converter annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(VmpRef = moduleData.VmpRef, ImpRef = moduleData.ImpRef) annotation (
    Placement(transformation(extent = {{0, -60}, {20, -40}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
    Placement(transformation(extent = {{70, -70}, {90, -50}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource voltageSource(f = 50, V = fill(400 / sqrt(3), 3)) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, 0})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent = {{-20, 10}, {0, 30}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, -30})));
  parameter Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(transformation(extent = {{60, 60}, {80, 80}})));
equation
  connect(groundDC.p, module.n) annotation (
    Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
  connect(ramp.y, module.variableIrradiance) annotation (
    Line(points = {{-59, 0}, {-52, 0}}, color = {0, 0, 127}));
  connect(groundDC.p, converter.dc_n) annotation (
    Line(points = {{-40, -20}, {-40, -20}, {20, -20}, {20, -10}}, color = {0, 0, 255}));
  connect(mpTracker.vRef, converter.vDCRef) annotation (
    Line(points={{21,-50},{24,-50},{24,-12}},        color = {0, 0, 127}));
  connect(module.p, powerSensor.pc) annotation (
    Line(points = {{-40, 10}, {-40, 10}, {-40, 20}, {-20, 20}}, color = {0, 0, 255}));
  connect(powerSensor.nc, converter.dc_p) annotation (
    Line(points = {{0, 20}, {0, 20}, {20, 20}, {20, 10}}, color = {0, 0, 255}));
  connect(mpTracker.power, powerSensor.power) annotation (
    Line(points = {{-2, -50}, {-2, -50}, {-18, -50}, {-18, 9}}, color = {0, 0, 127}));
  connect(powerSensor.pc, powerSensor.pv) annotation (
    Line(points = {{-20, 20}, {-20, 30}, {-10, 30}}, color = {0, 0, 255}));
  connect(powerSensor.nv, groundDC.p) annotation (
    Line(points = {{-10, 10}, {-10, 10}, {-10, -18}, {-10, -20}, {-40, -20}}, color = {0, 0, 255}));
  connect(star.plug_p, voltageSource.plug_n) annotation (
    Line(points = {{80, -20}, {80, -15}, {80, -10}}, color = {85, 170, 255}));
  connect(star.pin_n, groundAC.pin) annotation (
    Line(points = {{80, -40}, {80, -40}, {80, -50}}, color = {85, 170, 255}));
  connect(converter.ac, voltageSource.plug_p) annotation (
    Line(points = {{40, 0}, {46, 0}, {46, 0}, {50, 0}, {50, 20}, {80, 20}, {80, 10}}, color = {85, 170, 255}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StopTime = 300, Interval = 0.1, Tolerance = 1e-06, StartTime = 0),
    __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
end SimpleModuleMP3;
