within PhotoVoltaics.Components.Converters;
model QuasiStaticMultiPhaseConverter "Ideal quasi stastic multi phase DC/AC converter"
  extends Modelica.Electrical.PowerConverters.Interfaces.DCAC.DCtwoPin;
  extends .PhotoVoltaics.Interfaces.QuasiStatic.ACplug;
  extends .PhotoVoltaics.Icons.Converter;
  parameter Modelica.SIunits.Voltage VRef = 400 "Reference line to line voltage";
  parameter Modelica.SIunits.Time Ti = 1E-6 "Internal integration time constant";
  Modelica.SIunits.Power powerDC = vDC * iDC "Power of DC side";
  Modelica.SIunits.Power powerAC = Modelica.ComplexMath.real(vAC * Modelica.ComplexMath.conj(iAC)) "Complex apparent power of AC side";
  Modelica.Blocks.Interfaces.RealInput vDCRef(final unit = "V") "DC voltage" annotation (
    Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120}),  iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-90, 0})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin={-90,40})));
  Modelica.Blocks.Math.Product product annotation (
    Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {-30, 0})));
  Sources.Electrical.VariableUnrootedMultiPhaseCurrentSource variableCurrentSource(final m = m) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {50, 30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(final m = m) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {50, 0})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor powerSensor(final m = m) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {50, 60})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PotentialSensor potentialSensor(final m = m) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, -10})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Blocks.ToSpacePhasor toSpacePhasor(final m = m) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {60, -50})));
  Modelica.ComplexBlocks.ComplexMath.ComplexToReal complexToReal annotation (
    Placement(transformation(extent = {{20, 60}, {0, 80}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Blocks.FromSpacePhasor fromSpacePhasor(final m = m) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {10, 10})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.FromPolar fromPolar annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {10, -20})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToPolar toPolar annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {30, -50})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground annotation (
    Placement(transformation(extent = {{40, -40}, {60, -20}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=sqrt(3)/VRef/Ti)      annotation (
    Placement(transformation(extent = {{-30, -60}, {-10, -40}})));
  Modelica.Blocks.Math.Gain gain(final k = -1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-10, 40})));
equation
  connect(signalVoltage.n, dc_n) annotation (
    Line(points={{-90,-10},{-90,-60},{-100,-60}},                      color = {0, 0, 255}));
  connect(currentSensor.p, dc_p) annotation (
    Line(points={{-90,50},{-90,60},{-100,60}},                                color = {0, 0, 255}));
  connect(currentSensor.n, signalVoltage.p) annotation (
    Line(points={{-90,30},{-90,10}},                 color = {0, 0, 255}));
  connect(signalVoltage.v, vDCRef) annotation (
    Line(points={{-78,-1.33227e-15},{-70,-1.33227e-15},{-70,-80},{-60,-80},{-60,-120}},
                                                                         color = {0, 0, 127}));
  connect(currentSensor.i, product.u1) annotation (
    Line(points={{-79,40},{-70,40},{-70,36},{-62,36}},                     color = {0, 0, 127}));
  connect(vDCRef, product.u2) annotation (
    Line(points={{-60,-120},{-60,-120},{-60,-86},{-60,-86},{-60,-80},{-66,-80},{-70,-80},{-70,24},{-62,24}},color = {0, 0, 127}));
  connect(product.y, feedback.u1) annotation (
    Line(points = {{-39, 30}, {-30, 30}, {-30, 8}}, color = {0, 0, 127}));
  connect(powerSensor.currentP, powerSensor.voltageP) annotation (
    Line(points = {{50, 70}, {60, 70}, {60, 60}}, color = {85, 170, 255}));
  connect(powerSensor.voltageN, star.plug_p) annotation (
    Line(points = {{40, 60}, {30, 60}, {30, 10}, {50, 10}}, color = {85, 170, 255}));
  connect(potentialSensor.y, toSpacePhasor.u) annotation (
    Line(points = {{80, -21}, {80, -50}, {72, -50}}, color = {85, 170, 255}));
  connect(complexToReal.u, powerSensor.y) annotation (
    Line(points={{22,70},{30,70},{30,70},{39,70}},          color = {85, 170, 255}));
  connect(fromSpacePhasor.y, variableCurrentSource.I) annotation (
    Line(points = {{10, 21}, {10, 30}, {40, 30}}, color = {85, 170, 255}));
  connect(fromSpacePhasor.u, fromPolar.y) annotation (
    Line(points = {{10, -2}, {10, -9}}, color = {0, 0, 127}));
  connect(integrator.y, fromPolar.u[1]) annotation (
    Line(points = {{-9, -50}, {10, -50}, {10, -32}}, color = {0, 0, 127}));
  connect(toSpacePhasor.y, toPolar.u) annotation (
    Line(points = {{49, -50}, {49, -50}, {42, -50}}, color = {0, 0, 127}));
  connect(toPolar.y[2], fromPolar.u[2]) annotation (
    Line(points = {{19, -50}, {19, -50}, {10, -50}, {10, -32}, {10, -32}}, color = {0, 0, 127}));
  connect(star.pin_n, ground.pin) annotation (
    Line(points = {{50, -10}, {50, -20}}, color = {85, 170, 255}));
  connect(powerSensor.currentP, ac) annotation (
    Line(points = {{50, 70}, {50, 90}, {100, 90}, {100, 0}}, color = {85, 170, 255}));
  connect(potentialSensor.plug_p, ac) annotation (
    Line(points = {{80, 0}, {100, 0}}, color = {85, 170, 255}));
  connect(feedback.y, integrator.u) annotation (
    Line(points = {{-30, -9}, {-30, -9}, {-30, -20}, {-50, -20}, {-50, -50}, {-32, -50}}, color = {0, 0, 127}));
  connect(powerSensor.currentN, variableCurrentSource.plug_n) annotation (
    Line(points = {{50, 50}, {50, 45}, {50, 40}}, color = {85, 170, 255}));
  connect(variableCurrentSource.plug_p, star.plug_p) annotation (
    Line(points = {{50, 20}, {50, 15}, {50, 10}}, color = {85, 170, 255}));
  connect(gain.u, complexToReal.re) annotation (
    Line(points = {{-10, 52}, {-10, 76}, {-2, 76}}, color = {0, 0, 127}));
  connect(gain.y, feedback.u2) annotation (
    Line(points = {{-10, 29}, {-10, 0}, {-22, 0}}, color = {0, 0, 127}));
  annotation (
    defaultComponentName = "converter",
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={                                                                                                                                                                 Text(extent = {{-100, 40}, {-40, -40}}, lineColor = {0, 0, 255}, textString = "="), Text(extent = {{40, 40}, {100, -40}}, lineColor = {0, 0, 255}, textString = "~"), Text(extent = {{-150, 150}, {150, 110}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent={{-150,-112},{-90,-152}},   lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "vDCRef"), Text(extent={{-80,90},{20,50}},      lineColor={0,0,255},     pattern=LinePattern.Dash,   fillColor={0,0,255},     fillPattern=FillPattern.Solid,
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
    </code><u><code>v</code></u><code>1*</code><u><code>i</code></u><code>1</code><sup><code>*</code></sup> 
  + </code><u><code>v</code></u><code>2*</code><u><code>i</code></u><code>2</code><sup><code>*</code></sup> 
  + </code><u><code>v</code></u><code>3*</code><u><code>i</code></u><code>3</code><sup><code>*</code></sup> 
    <code>)= 0</code></li>
<li>The DC input voltage <code>vDCRef</code> is applied to the DC side without limitations</li>
</ul>
</html>"));
end QuasiStaticMultiPhaseConverter;
