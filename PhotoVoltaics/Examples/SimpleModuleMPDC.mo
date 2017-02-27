within PhotoVoltaics.Examples;
model SimpleModuleMPDC
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
  Components.Converters.DCConverter converter annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(VmpRef = moduleData.VmpRef, ImpRef = moduleData.ImpRef,
    samplePeriod=10)                                                                                                annotation (
    Placement(transformation(extent = {{0, -60}, {20, -40}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent = {{-20, 10}, {0, 30}})));
  parameter Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(transformation(extent = {{60, 60}, {80, 80}})));
  Sources.Electrical.IdealBattery battery(
    ns=4,
    np=1,
    V1Cell=14,
    V0Cell=11,
    ECell=12*100*3600,
    allowOvercharge=true,
    allowUndercharge=true,
    ViniCell=11) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,0})));
  Sources.Irradiance.Irradiance irradiance annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
equation
  connect(groundDC.p, module.n) annotation (
    Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
  connect(mpTracker.vRef, converter.vDCRef) annotation (
    Line(points = {{21, -50}, {30, -50}, {30, -12}}, color = {0, 0, 127}));
  connect(module.p, powerSensor.pc) annotation (
    Line(points = {{-40, 10}, {-40, 10}, {-40, 20}, {-20, 20}}, color = {0, 0, 255}));
  connect(mpTracker.power, powerSensor.power) annotation (
    Line(points = {{-2, -50}, {-2, -50}, {-18, -50}, {-18, 9}}, color = {0, 0, 127}));
  connect(powerSensor.pc, powerSensor.pv) annotation (
    Line(points = {{-20, 20}, {-20, 30}, {-10, 30}}, color = {0, 0, 255}));
  connect(powerSensor.nv, groundDC.p) annotation (
    Line(points = {{-10, 10}, {-10, 10}, {-10, -18}, {-10, -20}, {-40, -20}}, color = {0, 0, 255}));
  connect(battery.pin_n, ground.p) annotation (Line(points={{80,-10},{80,-15},{80,-20}}, color={0,0,255}));
  connect(irradiance.irradiance, module.variableIrradiance) annotation (Line(points={{-69,0},{-52,0}}, color={0,0,127}));
  connect(groundDC.p, converter.dc_n1) annotation (Line(points={{-40,-20},{-16,-20},{10,-20},{10,-6},{20,-6}}, color={0,0,255}));
  connect(converter.dc_p1, powerSensor.nc) annotation (Line(points={{20,6},{10,6},{10,20},{0,20}}, color={0,0,255}));
  connect(converter.dc_p2, battery.pin_p) annotation (Line(points={{40,6},{50,6},{50,20},{80,20},{80,10}}, color={0,0,255}));
  connect(converter.dc_n2, ground.p) annotation (Line(points={{40,-6},{50,-6},{50,-20},{80,-20}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StopTime = 300, Interval = 0.1, Tolerance = 1e-06, StartTime = 0),
    __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
end SimpleModuleMPDC;
