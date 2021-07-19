within PhotoVoltaics.ComponentTesting;
model PolyphaseVoltageControlledConverter
  "Test of voltage current controlled converter"
  extends Modelica.Icons.Example;
  PhotoVoltaics.Components.Converters.QuasiStaticPolyphaseConverter
    converter
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-40, 20})));
  Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
    Placement(transformation(extent = {{-50, -20}, {-30, 0}})));
  Modelica.Electrical.QuasiStatic.Polyphase.Sources.VoltageSource
    voltageSource(f=50, V=fill(400/sqrt(3), 3)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Ground groundAC
    annotation (Placement(transformation(extent={{30,-70},{50,-50}})));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.6, startTime = 0.2, height = 200, offset = -100) annotation (
    Placement(transformation(extent = {{-60, -60}, {-40, -40}})));
  Modelica.Electrical.QuasiStatic.Polyphase.Basic.Star star annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-30})));
equation
  connect(constantCurrent.n, converter.dc_p) annotation (
    Line(points={{-40,30},{-10,30},{-10,26}},        color = {0, 0, 255}));
  connect(constantCurrent.p, converter.dc_n) annotation (
    Line(points={{-40,10},{-10,10},{-10,14}},        color = {0, 0, 255}));
  connect(groundDC.p, constantCurrent.p) annotation (
    Line(points = {{-40, 0}, {-40, 10}}, color = {0, 0, 255}));
  connect(ramp.y, converter.vDCRef) annotation (
    Line(points={{-39,-50},{-20,-50},{-6,-50},{-6,8}},        color = {0, 0, 127}));
  connect(star.pin_n, groundAC.pin) annotation (
    Line(points = {{40, -40}, {40, -50}, {40, -50}}, color = {85, 170, 255}));
  connect(star.plug_p, voltageSource.plug_n) annotation (
    Line(points = {{40, -20}, {40, -10}}, color = {85, 170, 255}));
  connect(converter.ac, voltageSource.plug_p) annotation (
    Line(points = {{10, 20}, {16, 20}, {20, 20}, {40, 20}, {40, 10}}, color = {85, 170, 255}));
  annotation (
    experiment(StopTime = 180));
end PolyphaseVoltageControlledConverter;
