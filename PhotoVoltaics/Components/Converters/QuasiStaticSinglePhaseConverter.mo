within PhotoVoltaics.Components.Converters;
model QuasiStaticSinglePhaseConverter "Ideal quasi static single phase DC/AC converter"
  extends Modelica.Electrical.PowerConverters.Interfaces.DCAC.DCtwoPin;
  extends .PhotoVoltaics.Interfaces.QuasiStatic.ACpins;
  extends .PhotoVoltaics.Icons.Converter;
  parameter Modelica.SIunits.Voltage VRef = 400 / sqrt(3) "Reference voltage";
  parameter Modelica.SIunits.Time Ti = 1E-6 "Internal integration time constant";
  Modelica.SIunits.Power powerDC = vDC * iDC "Power of DC side";
  Modelica.SIunits.Power powerAC = Modelica.ComplexMath.real(vAC * Modelica.ComplexMath.conj(iAC)) "Complex apparent power of AC side";
  Modelica.Blocks.Interfaces.RealInput vDCRef(final unit = "V") "DC voltage" annotation (
    Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120}),  iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-90, 0})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {-90, 60})));
  Modelica.Blocks.Math.Product product annotation (
    Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {-30, 0})));
  Sources.Electrical.VariableUnrootedSinglePhaseCurrentSource variableCurrentSource annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {90, 30})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {90, 60})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor potentialSensor annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {60, 10})));
  Modelica.ComplexBlocks.ComplexMath.ComplexToReal complexToReal annotation (
    Placement(transformation(extent = {{40, 60}, {20, 80}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1/VRef/Ti)      annotation (
    Placement(transformation(extent = {{-30, -60}, {-10, -40}})));
  Modelica.ComplexBlocks.ComplexMath.ComplexToPolar complexToPolar annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, -20})));
  Modelica.ComplexBlocks.ComplexMath.PolarToComplex polarToComplex annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {10, -20})));
  Modelica.Blocks.Math.Gain gain(final k = -1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-10, 50})));
equation
  connect(signalVoltage.n, dc_n) annotation (
    Line(points = {{-90, -10}, {-90, -70}, {-90, -100}, {-100, -100}}, color = {0, 0, 255}));
  connect(currentSensor.p, dc_p) annotation (
    Line(points = {{-90, 70}, {-90, 70}, {-90, 76}, {-90, 100}, {-100, 100}}, color = {0, 0, 255}));
  connect(currentSensor.n, signalVoltage.p) annotation (
    Line(points = {{-90, 50}, {-90, 50}, {-90, 10}}, color = {0, 0, 255}));
  connect(signalVoltage.v, vDCRef) annotation (
    Line(points={{-83,0},{-70,0},{-70,-80},{-60,-80},{-60,-120}},        color = {0, 0, 127}));
  connect(currentSensor.i, product.u1) annotation (
    Line(points = {{-80, 60}, {-76, 60}, {-70, 60}, {-70, 36}, {-62, 36}}, color = {0, 0, 127}));
  connect(vDCRef, product.u2) annotation (
    Line(points={{-60,-120},{-60,-120},{-60,-86},{-60,-86},{-60,-80},{-66,-80},{-70,-80},{-70,24},{-62,24}},
                                                                                                          color = {0, 0, 127}));
  connect(product.y, feedback.u1) annotation (
    Line(points = {{-39, 30}, {-30, 30}, {-30, 8}}, color = {0, 0, 127}));
  connect(powerSensor.currentP, powerSensor.voltageP) annotation (
    Line(points = {{90, 70}, {100, 70}, {100, 60}}, color = {85, 170, 255}));
  connect(complexToReal.u, powerSensor.y) annotation (
    Line(points = {{42, 70}, {42, 70}, {74, 70}, {74, 68}, {79, 68}}, color = {85, 170, 255}));
  connect(feedback.y, integrator.u) annotation (
    Line(points = {{-30, -9}, {-30, -9}, {-30, -20}, {-50, -20}, {-50, -50}, {-32, -50}}, color = {0, 0, 127}));
  connect(powerSensor.currentP, ac_p) annotation (
    Line(points = {{90, 70}, {90, 70}, {90, 88}, {90, 100}, {100, 100}}, color = {85, 170, 255}));
  connect(potentialSensor.pin_p, ac_p) annotation (
    Line(points = {{60, 20}, {60, 100}, {100, 100}}, color = {85, 170, 255}));
  connect(potentialSensor.pin_n, ac_n) annotation (
    Line(points = {{60, 0}, {60, -100}, {100, -100}}, color = {85, 170, 255}));
  connect(powerSensor.voltageN, ac_n) annotation (
    Line(points = {{80, 60}, {80, 60}, {74, 60}, {74, -100}, {100, -100}}, color = {85, 170, 255}));
  connect(complexToPolar.u, potentialSensor.y) annotation (
    Line(points = {{40, -8}, {40, 10}, {49, 10}}, color = {85, 170, 255}));
  connect(polarToComplex.y, variableCurrentSource.I) annotation (
    Line(points = {{10, -9}, {10, 30}, {80, 30}}, color = {85, 170, 255}));
  connect(integrator.y, polarToComplex.len) annotation (
    Line(points = {{-9, -50}, {4, -50}, {4, -32}}, color = {0, 0, 127}));
  connect(polarToComplex.phi, complexToPolar.phi) annotation (
    Line(points = {{16, -32}, {16, -50}, {34, -50}, {34, -32}}, color = {0, 0, 127}));
  connect(gain.u, complexToReal.re) annotation (
    Line(points = {{-10, 62}, {-10, 62}, {-10, 76}, {18, 76}}, color = {0, 0, 127}));
  connect(gain.y, feedback.u2) annotation (
    Line(points = {{-10, 39}, {-10, 39}, {-10, 2}, {-10, 0}, {-22, 0}}, color = {0, 0, 127}));
  connect(powerSensor.currentN, variableCurrentSource.pin_n) annotation (
    Line(points = {{90, 50}, {90, 40}, {90, 40}}, color = {85, 170, 255}));
  connect(variableCurrentSource.pin_p, ac_n) annotation (
    Line(points = {{90, 20}, {90, -100}, {100, -100}}, color = {85, 170, 255}));
  annotation (
    defaultComponentName = "converter",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={                                                                                                                                                                 Text(extent = {{-100, 40}, {-40, -40}}, lineColor = {0, 0, 255}, textString = "="), Text(extent = {{40, 40}, {100, -40}}, lineColor = {0, 0, 255}, textString = "~"), Text(extent = {{-150, 150}, {150, 110}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{20, -100}, {80, -140}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "vDCRef"), Text(extent={{-80,90},{20,50}},      lineColor={0,0,255},     pattern=LinePattern.Dash,   fillColor={0,0,255},     fillPattern=FillPattern.Solid,
          textString="PV"),                                                                                                                                                                                                        Text(extent={{-40,-50},{60,-90}},      lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "src")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Documentation(info="<html>
<p>This is an ideal DC/AC converter.</p>
<p>
The DC/AC converter is characterized by:
</p> 
<ul>
<li>Losses are not considered</li> 
<li>The AC output current is determined based on power balance, calculating with instantanteous DC and complex AC phasor values: 
    <code>vDC*iDC + real(
    </code><u><code>v</code></u><code>AC*</code><u><code>i</code></u><code>AC</code><sup><code>*</code></sup> 
    <code>)= 0</code></li>
<<li>The DC input voltage <code>vDCRef</code> is applied to the DC side without limitations</li>
</ul>
</html>"));
end QuasiStaticSinglePhaseConverter;
