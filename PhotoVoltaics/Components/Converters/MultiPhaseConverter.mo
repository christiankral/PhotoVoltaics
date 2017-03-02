within PhotoVoltaics.Components.Converters;
model MultiPhaseConverter "Ideal multi phase DC/AC converter"

  import Modelica.Constants.pi;
  extends Modelica.Electrical.PowerConverters.Interfaces.DCAC.DCtwoPin;
  extends .PhotoVoltaics.Icons.Converter;

  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug ac "AC output" annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput vDCRef(final unit = "V") "DC voltage" annotation (
    Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120}),  iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin={-60,-120})));

  parameter Modelica.SIunits.Frequency f = 50 "Frequency";
  parameter Modelica.SIunits.Voltage VRef = 400
    "Reference line to line voltage";
  parameter Modelica.SIunits.PerUnit Smax = 1 "Output apparent power";
  parameter Modelica.SIunits.Voltage VmpRef
    "Reference maximum power power of plant";
  parameter Modelica.SIunits.Current ImpRef
    "Reference maximum power current of plant";
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
  Modelica.Blocks.Continuous.Integrator integrator(k=sqrt(3)/VRef/Ti) annotation (
    Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,20})));
  Modelica.Blocks.Math.Gain gain(final k=1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation=180,   origin={-30,90})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.FromSpacePhasor fromSpacePhasor(m=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,60})));
  Modelica.Blocks.Sources.Constant zeroConst(final k=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={10,30})));
  Modelica.Electrical.MultiPhase.Sources.SignalCurrent signalCurrent annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,60})));
  Modelica.Electrical.MultiPhase.Basic.Star star annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,0})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(extent={{50,-34},{70,-14}})));
  Modelica.Blocks.Sources.Constant constOmega(final k=2*pi*f) annotation (Placement(transformation(extent={{-60,-64},
            {-40,-44}})));
  Modelica.Blocks.Math.RectangularToPolar rectangularToPolar annotation (Placement(transformation(extent={{20,-80},{0,-60}})));
  Modelica.Electrical.MultiPhase.Sensors.VoltageSensor voltageSensorAC(final m=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,60})));
  Modelica.Blocks.Math.Product productPower[3] annotation (Placement(transformation(extent={{40,80},
            {20,100}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-22,-92},{-42,-72}})));
  Modelica.Blocks.Interfaces.RealInput phi
    "Phase angle of current with respect to voltage"
                                                   annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120})));
  Modelica.Blocks.Continuous.Integrator integratorOmega(final k=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,-54})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder[3](k=ones(3), T=fill(Ti, 3)) annotation (Placement(transformation(extent={{20,50},
            {40,70}})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotatorOut annotation (Placement(transformation(extent={{-10,-10},
            {10,10}},
        rotation=90,
        origin={-30,46})));
  Modelica.Blocks.Math.Gain neg(final k=-1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={46,-38})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor annotation (Placement(transformation(extent={{90,-80},
            {70,-60}})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotatorIn annotation (Placement(transformation(extent={{60,-60},
            {40,-80}})));
  Modelica.Blocks.Math.Sum sum3(nin=3) annotation (Placement(transformation(extent={{10,80},
            {-10,100}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter(limitsAtInit=true) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,18})));
  Modelica.Blocks.Sources.Constant constOmega1(final k=(Smax*VmpRef*ImpRef/VRef)
        *(sqrt(2/3))) annotation (Placement(transformation(extent={{-60,-36},
            {-40,-16}})));
  Modelica.Blocks.Math.Add add1(k1=+1, k2=-1) annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
  Modelica.Blocks.Math.Gain neg1(final k=-1) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={26,6})));
  Modelica.Blocks.Math.Abs abs annotation (Placement(transformation(extent={{0,-30},{20,-10}})));

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
    Line(points={{-41,90},{-41,90},{-46,90},{-46,50},{-62,50}},
                                                   color = {0, 0, 127}));
  connect(product.u1, currentSensor.i) annotation (Line(points={{-82,86},{
          -90,86},{-90,60}},          color={0,0,127}));
  connect(product.u2, vDCRef) annotation (Line(points={{-82,74},{-86,74},{-86,-10},
          {-86,-90},{-60,-90},{-60,-120}},      color={0,0,127}));
  connect(star.plug_p, signalCurrent.plug_p)
    annotation (Line(points={{60,10},{60,10},{60,50}},
                                               color={0,0,255}));
  connect(ground.p, star.pin_n)
    annotation (Line(points={{60,-14},{60,-12},{60,-10}},
                                                       color={0,0,255}));
  connect(fromSpacePhasor.zero, zeroConst.y) annotation (Line(points={{-12,52},{
          -12,30},{-1,30}},                                                                 color={0,0,127}));
  connect(integrator.y, fromPolar.u[1]) annotation (Line(points={{-70,9},{-70,-1},
          {-62,-1}},                 color={0,0,127}));
  connect(voltageSensorAC.plug_n, star.plug_p) annotation (Line(points={{90,50},
          {90,10},{60,10}},                                                                       color={0,0,255}));
  connect(voltageSensorAC.plug_p, ac) annotation (Line(points={{90,70},{100,70},
          {100,0}},                                                                       color={0,0,255}));
  connect(rectangularToPolar.y_arg, add.u1) annotation (Line(points={{-1,-76},{-10,
          -76},{-20,-76}},          color={0,0,127}));
  connect(add.y, fromPolar.u[2]) annotation (Line(points={{-43,-82},{-43,-82},{-70,
          -82},{-70,1},{-62,1}},   color={0,0,127}));
  connect(constOmega.y, integratorOmega.u) annotation (Line(points={{-39,-54},{-39,
          -54},{-32,-54}},                                                                          color={0,0,127}));
  connect(fromSpacePhasor.y, firstOrder.u) annotation (Line(points={{11,60},{11,
          60},{18,60}},                                                                       color={0,0,127}));
  connect(firstOrder.y, signalCurrent.i) annotation (Line(points={{41,60},{53,60}},                 color={0,0,127}));
  connect(neg.y, rotatorOut.angle) annotation (Line(points={{46,-27},{46,45},{-18,
          45},{-18,46}},                                                                                            color={0,0,127}));
  connect(rotatorIn.u, toSpacePhasor.y) annotation (Line(points={{62,-70},{62,-70},
          {69,-70}},                                                                          color={0,0,127}));
  connect(rotatorIn.angle, integratorOmega.y) annotation (Line(points={{50,-58},
          {50,-58},{50,-54},{-9,-54}},                                                                       color={0,0,127}));
  connect(neg.u, integratorOmega.y) annotation (Line(points={{46,-50},{46,-50},{
          46,-54},{46,-54},{46,-54},{-9,-54}},                                                     color={0,0,127}));
  connect(rotatorOut.y, fromSpacePhasor.u) annotation (Line(points={{-30,57},{-30,
          60},{-12,60}},                                                                           color={0,0,127}));
  connect(rectangularToPolar.u_re, rotatorIn.y[1]) annotation (Line(points={{22,-64},
          {22,-64},{32,-64},{32,-69.5},{39,-69.5}},                                                                        color={0,0,127}));
  connect(rectangularToPolar.u_im, rotatorIn.y[2]) annotation (Line(points={{22,-76},
          {32,-76},{32,-70.5},{39,-70.5}},                                                                        color={0,0,127}));
  connect(sum3.y, gain.u) annotation (Line(points={{-11,90},{-12,90},{-20,90},{-18,
          90}},                                                                   color={0,0,127}));
  connect(productPower.u2, voltageSensorAC.v) annotation (Line(points={{42,84},{
          42,84},{76,84},{76,82},{76,60},{79,60}},                                                  color={0,0,127}));
  connect(sum3.u, productPower.y) annotation (Line(points={{12,90},{19,90}},         color={0,0,127}));
  connect(firstOrder.y, productPower.u1) annotation (Line(points={{41,60},{48,60},
          {48,96},{42,96}},                                                                         color={0,0,127}));
  connect(signalCurrent.plug_n, voltageSensorAC.plug_p) annotation (Line(points={{60,70},
          {60,70},{60,80},{90,80},{90,70}},                                                                                color={0,0,255}));
  connect(voltageSensorAC.v, toSpacePhasor.u) annotation (Line(points={{79,60},{
          76,60},{76,-28},{76,-30},{100,-30},{100,-70},{92,-70}},                                                                       color={0,0,127}));
  connect(add1.y, abs.u)
    annotation (Line(points={{-9,-20},{-4,-20},{-2,-20}}, color={0,0,127}));
  connect(add.u2, phi)
    annotation (Line(points={{-20,-88},{60,-88},{60,-120}}, color={0,0,127}));
  connect(constOmega1.y, add1.u2)
    annotation (Line(points={{-39,-26},{-36,-26},{-32,-26}}, color={0,0,127}));
  connect(add1.u1, fromPolar.y[1]) annotation (Line(points={{-32,-14},{-39,-14},
          {-39,-0.5}}, color={0,0,127}));
  connect(variableLimiter.u, fromPolar.y[2])
    annotation (Line(points={{-20,6},{-20,0.5},{-39,0.5}}, color={0,0,127}));
  connect(abs.y, variableLimiter.limit1) annotation (Line(points={{21,-20},{22,-20},
          {22,-8},{22,-4},{-28,-4},{-28,6}}, color={0,0,127}));
  connect(rotatorOut.u[1], fromPolar.y[1])
    annotation (Line(points={{-29,34},{-39,34},{-39,-0.5}}, color={0,0,127}));
  connect(variableLimiter.y, rotatorOut.u[2])
    annotation (Line(points={{-20,29},{-20,34},{-31,34}}, color={0,0,127}));
  connect(neg1.y, variableLimiter.limit2)
    annotation (Line(points={{15,6},{-12,6},{-12,6}}, color={0,0,127}));
  connect(neg1.u, abs.y) annotation (Line(points={{38,6},{40,6},{40,-8},{40,-20},
          {21,-20}}, color={0,0,127}));
  annotation (
defaultComponentName = "converter",
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
         graphics={                                                                                                    Text(extent={{
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
          textString="3ph AC"),                                                                                                    Text(extent={{-150,-110},{-90,-150}},   lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255},
            fillPattern =                                                                                                    FillPattern.Solid, textString = "vDCRef")}),
                                                                                                    Documentation(info="<html>
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
