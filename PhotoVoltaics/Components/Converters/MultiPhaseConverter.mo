within PhotoVoltaics.Components.Converters;
model MultiPhaseConverter "Ideal multi phase DC/AC converter"

  import Modelica.Constants.pi;
  extends Modelica.Electrical.PowerConverters.Interfaces.DCAC.DCtwoPin;
  extends .PhotoVoltaics.Icons.Converter;

  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug ac "AC output"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput vDCRef(final unit = "V")
    "DC voltage"                                                             annotation (
    Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120}),  iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120})));

  parameter Modelica.SIunits.Frequency f = 50 "Frequency";
  parameter Modelica.SIunits.Voltage VRef = 400
    "Reference line to line voltage";
  parameter Modelica.SIunits.Time Ti = 1E-6
    "Internal integration time constant";
  Modelica.SIunits.Power powerDC = vDC * iDC "Power of DC side";

  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin={-100,0})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin={-100,60})));
  Modelica.Blocks.Math.Product product annotation (
    Placement(transformation(extent={{-80,70},{-60,90}})));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin={-70,50})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.FromPolar fromPolar annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation=0,    origin={-50,0})));
  Modelica.Blocks.Continuous.Integrator integrator(k=sqrt(3)/VRef/Ti)      annotation (
    Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,20})));
  Modelica.Blocks.Math.Gain gain(final k=1)    annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation=180,   origin={-40,50})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.FromSpacePhasor fromSpacePhasor(m=3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,30})));
  Modelica.Blocks.Sources.Constant zeroConst(final k=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={30,0})));
  Modelica.Electrical.MultiPhase.Sources.SignalCurrent signalCurrent
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,50})));
  Modelica.Electrical.MultiPhase.Basic.Star star annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{50,-34},{70,-14}})));
  Modelica.Blocks.Sources.Constant constOmega(final k=2*pi*f) annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Blocks.Math.RectangularToPolar rectangularToPolar
    annotation (Placement(transformation(extent={{20,-70},{0,-50}})));

  Modelica.Electrical.MultiPhase.Sensors.VoltageSensor voltageSensorAC(final m=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,50})));
  Modelica.Blocks.Math.Product productPower[3] annotation (Placement(transformation(extent={{40,70},{20,90}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-22,-80},{-42,-60}})));
  Modelica.Blocks.Interfaces.RealInput phi "Phase angle of current with respect to voltage" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120})));

  Modelica.Blocks.Continuous.Integrator integratorOmega(final k=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,-40})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder[3](k=ones(3), T=fill(Ti, 3),
    initType=fill(Modelica.Blocks.Types.Init.InitialState, 3),
    y_start=fill(0, 3))                                                        annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotatorOut annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Math.Gain neg(final k=-1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={0,-20})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor annotation (Placement(transformation(extent={{90,-70},{70,-50}})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotatorIn annotation (Placement(transformation(extent={{60,-50},{40,-70}})));
  Modelica.Blocks.Math.Sum sum3(nin=3) annotation (Placement(transformation(extent={{10,70},{-10,90}})));
equation
  connect(currentSensor.n,signalVoltage. p) annotation (
    Line(points={{-100,50},{-100,50},{-100,10}},     color = {0, 0, 255}));
  connect(signalVoltage.v,vDCRef)  annotation (
    Line(points={{-93,-1.33227e-015},{-86,-1.33227e-015},{-86,-90},{-60,-90},{-60,
          -120}},                                                        color = {0, 0, 127}));
  connect(dc_p, currentSensor.p) annotation (Line(points={{-100,100},{-100,70}},
                     color={0,0,255}));
  connect(dc_n, signalVoltage.n) annotation (Line(points={{-100,-100},{-100,
          -10}},       color={0,0,255}));
  connect(product.y,feedback. u1) annotation (
    Line(points={{-59,80},{-50,80},{-50,64},{-50,64},{-50,64},{-70,64},{-70,58}},
                                                    color = {0, 0, 127}));
  connect(feedback.y,integrator. u) annotation (
    Line(points={{-70,41},{-70,38},{-70,32}},                                             color = {0, 0, 127}));
  connect(gain.y,feedback. u2) annotation (
    Line(points={{-51,50},{-51,50},{-62,50}},      color = {0, 0, 127}));
  connect(product.u1, currentSensor.i) annotation (Line(points={{-82,86},{
          -90,86},{-90,60}},          color={0,0,127}));
  connect(product.u2, vDCRef) annotation (Line(points={{-82,74},{-86,74},{-86,-10},
          {-86,-90},{-60,-90},{-60,-120}},      color={0,0,127}));
  connect(star.plug_p, signalCurrent.plug_p)
    annotation (Line(points={{60,10},{60,16},{60,40}},
                                               color={0,0,255}));
  connect(ground.p, star.pin_n)
    annotation (Line(points={{60,-14},{60,-12},{60,-10}},
                                                       color={0,0,255}));
  connect(fromSpacePhasor.zero, zeroConst.y) annotation (Line(points={{8,18},{8,0},{19,0}}, color={0,0,127}));
  connect(integrator.y, fromPolar.u[1]) annotation (Line(points={{-70,9},{-70,0},{-62,0}},
                                     color={0,0,127}));
  connect(voltageSensorAC.plug_n, star.plug_p) annotation (Line(points={{90,40},{90,10},{60,10}}, color={0,0,255}));
  connect(voltageSensorAC.plug_p, ac) annotation (Line(points={{90,60},{100,60},{100,0}}, color={0,0,255}));
  connect(rectangularToPolar.y_arg, add.u1) annotation (Line(points={{-1,-66},{-10,-66},{-10,-64},{-20,-64}},
                                    color={0,0,127}));
  connect(add.y, fromPolar.u[2]) annotation (Line(points={{-43,-70},{-43,-70},{-70,-70},{-70,0},{-62,0}},
                                   color={0,0,127}));
  connect(constOmega.y, integratorOmega.u) annotation (Line(points={{-39,-40},{-34,-40},{-32,-40}}, color={0,0,127}));
  connect(fromSpacePhasor.y, firstOrder.u) annotation (Line(points={{6.66134e-16,41},{6.66134e-16,50},{18,50}},
                                                                                              color={0,0,127}));
  connect(firstOrder.y, signalCurrent.i) annotation (Line(points={{41,50},{53,50}},                 color={0,0,127}));
  connect(fromPolar.y, rotatorOut.u) annotation (Line(points={{-39,0},{-32,0}},   color={0,0,127}));
  connect(neg.y, rotatorOut.angle) annotation (Line(points={{-11,-20},{-11,-20},{-14,-20},{-20,-20},{-20,-12}},     color={0,0,127}));
  connect(rotatorIn.u, toSpacePhasor.y) annotation (Line(points={{62,-60},{62,-60},{69,-60}}, color={0,0,127}));
  connect(rotatorIn.angle, integratorOmega.y) annotation (Line(points={{50,-48},{50,-44},{50,-40},{-9,-40}}, color={0,0,127}));
  connect(neg.u, integratorOmega.y) annotation (Line(points={{12,-20},{20,-20},{20,-40},{-9,-40}}, color={0,0,127}));
  connect(rotatorOut.y, fromSpacePhasor.u) annotation (Line(points={{-9,0},{-9,0},{-8.88178e-16,0},{-8.88178e-16,18}},
                                                                                                   color={0,0,127}));
  connect(rectangularToPolar.u_re, rotatorIn.y[1]) annotation (Line(points={{22,-54},{22,-54},{32,-54},{32,-60},{39,-60}}, color={0,0,127}));
  connect(rectangularToPolar.u_im, rotatorIn.y[2]) annotation (Line(points={{22,-66},{32,-66},{32,-60},{39,-60}}, color={0,0,127}));
  connect(sum3.y, gain.u) annotation (Line(points={{-11,80},{-12,80},{-20,80},{-20,50},{-28,50}},
                                                                                  color={0,0,127}));
  connect(productPower.u2, voltageSensorAC.v) annotation (Line(points={{42,74},{42,74},{76,74},{76,72},{76,50},{79,50}},
                                                                                                                 color={0,0,127}));
  connect(sum3.u, productPower.y) annotation (Line(points={{12,80},{19,80}},         color={0,0,127}));
  connect(firstOrder.y, productPower.u1) annotation (Line(points={{41,50},{48,50},{48,86},{42,86}}, color={0,0,127}));
  connect(signalCurrent.plug_n, voltageSensorAC.plug_p) annotation (Line(points={{60,60},{60,60},{60,70},{90,70},{90,60}}, color={0,0,255}));
  connect(voltageSensorAC.v, toSpacePhasor.u) annotation (Line(points={{79,50},{76,50},{76,-38},{76,-40},{100,-40},{100,-60},{92,-60}}, color={0,0,127}));
  connect(add.u2, phi) annotation (Line(points={{-20,-76},{-16,-76},{-10,-76},{-10,-90},{60,-90},{60,-120}}, color={0,0,127}));
  annotation (
defaultComponentName = "converter",
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
         graphics={                                                                                                                                                                 Text(extent={{
              -100,40},{-40,-40}},                                                                                                    lineColor = {0, 0, 255}, textString = "="), Text(extent={{
              40,40},{100,-40}},                                                                                                    lineColor = {0, 0, 255}, textString = "~"), Text(extent={{
              -150,150},{150,110}},                                                                                                    lineColor = {0, 0, 255}, textString = "%name"),
                                                                                                Text(extent={{-80,90},{20,50}},    lineColor=
              {0,0,255},                                                                                                    pattern=
              LinePattern.Dash,                                                                                                    fillColor=
              {0,0,255},
            fillPattern=FillPattern.Solid,
          textString="DC"),                                                                                                    Text(extent={{-20,-50},{80,-90}},
                                                                                                                                     lineColor=
              {0,0,255},                                                                                                    pattern=
              LinePattern.Dash,                                                                                                    fillColor=
              {0,0,255},
            fillPattern=FillPattern.Solid,
          textString="3ph AC"),                                                                                                                                                                                                        Text(extent={{-150,-110},{-90,-150}},   lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "vDCRef"),
                                                                                                                                                                                                        Text(extent={{90,-110},{150,-150}},     lineColor={0,0,255},     pattern=LinePattern.Dash,   fillColor={0,0,255},     fillPattern=FillPattern.Solid,
          textString="phi")}),                                                                                                       Documentation(info="<html>
<p>This is an ideal DC/AC converter.<p>

<p>
The multi phase converter is characterized by:
</p> 
<ul>
<li>Losses are not considered</li> 
<li>The AC output current is determined based on power balance, calculating with instantaneous values: 
    <code>vDC*iDC + v1*i1 + v2*i2 + v3*i3 = 0<code></li>
<li>The DC input voltage <code>vDCRef</code> is applied to the DC side without limitations</li>
<li>The phase angle input <code>phi</code> influences the AC reactive power as shown in the figure below,
    where underlined voltages and currents represent complex voltage and current phasors</li>
<li>A negative angle <code>phi</code> may supply a capacitive load (see figure below)</li>
<li>A positive angle <code>phi</code> may supply an inductive load</li>
</ul>
<p>
<img src=\"modelica://PhotoVoltaics/Resources/Images/MultiPhaseConverter.png\">
</p></html>"));
end MultiPhaseConverter;
