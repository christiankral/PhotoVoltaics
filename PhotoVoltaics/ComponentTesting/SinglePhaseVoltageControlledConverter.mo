within PhotoVoltaics.ComponentTesting;
model SinglePhaseVoltageControlledConverter "Test of voltage current controlled converter"
  extends Modelica.Icons.Example;
  PhotoVoltaics.Components.Converters.QuasiStaticSinglePhaseConverter converter annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-40, 0})));
  Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
    Placement(transformation(extent = {{-50, -40}, {-30, -20}})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Sources.VoltageSource
    voltageSource(
    f=50,
    V=100,
    phi=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Ground groundAC
    annotation (Placement(transformation(extent={{30,-38},{50,-18}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.6, startTime = 0.2, height = 200, offset = -100) annotation (
    Placement(transformation(extent = {{-60, -80}, {-40, -60}})));
equation
  connect(constantCurrent.n, converter.dc_p) annotation (
    Line(points = {{-40, 10}, {-26, 10}, {-10, 10}}, color = {0, 0, 255}));
  connect(constantCurrent.p, converter.dc_n) annotation (
    Line(points = {{-40, -10}, {-26, -10}, {-10, -10}}, color = {0, 0, 255}));
  connect(groundDC.p, constantCurrent.p) annotation (
    Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
  connect(converter.ac_p, voltageSource.pin_p) annotation (
    Line(points = {{10, 10}, {40, 10}}, color = {85, 170, 255}));
  connect(converter.ac_n, voltageSource.pin_n) annotation (
    Line(points = {{10, -10}, {25, -10}, {40, -10}}, color = {85, 170, 255}));
  connect(groundAC.pin, voltageSource.pin_n) annotation (
    Line(points = {{40, -18}, {40, -14}, {40, -10}}, color = {85, 170, 255}));
  connect(ramp.y, converter.vDCRef) annotation (
    Line(points={{-39,-70},{-39,-70},{-6,-70},{-6,-12}},        color = {0, 0, 127}));
  annotation (
    experiment(StopTime = 180));
end SinglePhaseVoltageControlledConverter;
