within PhotoVoltaics.Components.Converters.ConvertersWithSampleMPTracker;
model DCConverter "DC converter with sampled maximum power tracking"
  import PhotoVoltaics;
  extends Modelica.Electrical.PowerConverters.Interfaces.DCDC.DCtwoPin1;
  extends Modelica.Electrical.PowerConverters.Interfaces.DCDC.DCtwoPin2;
  extends PhotoVoltaics.Icons.Converter;
  extends PhotoVoltaics.Icons.MPTrackerSmall;

  parameter Modelica.Units.SI.Voltage VRef=48 "Reference DC source voltage"
    annotation (Dialog(group="Converter"));
  parameter Modelica.Units.SI.Time Ti=1E-6 "Internal integration time constant"
    annotation (Dialog(group="Converter"));

  parameter Modelica.Units.SI.Time startTime=0 "Start time"
    annotation (Dialog(group="MP tracker"));
  parameter Modelica.Units.SI.Time samplePeriod=1 "Sample period"
    annotation (Dialog(group="MP tracker"));
  parameter Modelica.Units.SI.Voltage VmpRef
    "Reference maximum power power of plant"
    annotation (Dialog(group="MP tracker"));
  parameter Modelica.Units.SI.Current ImpRef
    "Reference maximum power current of plant"
    annotation (Dialog(group="MP tracker"));
  parameter Integer n = 100 "Number of voltage and power discretizations" annotation(Dialog(group="MP tracker"));

  PhotoVoltaics.Components.Converters.DCConverter converter(final Ti=Ti, final VRef=VRef) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(
    final startTime=startTime,
    final samplePeriod=samplePeriod,
    final VmpRef=VmpRef,
    final ImpRef=ImpRef,
    final n=n) annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
equation
  connect(dc_p1, powerSensor.pc) annotation (Line(points={{-100,60},{-70,60},{-40,60}}, color={0,0,255}));
  connect(powerSensor.nc, converter.dc_p1) annotation (Line(points={{-20,60},{20,60},{20,6},{40,6}}, color={0,0,255}));
  connect(converter.dc_p2, dc_p2) annotation (Line(points={{60,6},{80,6},{80,60},{100,60}}, color={0,0,255}));
  connect(dc_n1, converter.dc_n1) annotation (Line(points={{-100,-60},{-40,-60},{20,-60},{20,-6},{40,-6}}, color={0,0,255}));
  connect(converter.dc_n2, dc_n2) annotation (Line(points={{60,-6},{80,-6},{80,-60},{100,-60}}, color={0,0,255}));
  connect(powerSensor.pc, powerSensor.pv) annotation (Line(points={{-40,60},{-40,70},{-30,70}}, color={0,0,255}));
  connect(powerSensor.nv, dc_n1) annotation (Line(points={{-30,50},{-30,50},{-30,-44},{-30,-60},{-100,-60}}, color={0,0,255}));
  connect(mpTracker.vRef, converter.vDCRef) annotation (Line(points={{11,-80},{24,-80},{44,-80},{44,-12}}, color={0,0,127}));
  connect(mpTracker.power, powerSensor.power) annotation (Line(points={{-12,-80},{-24,-80},{-38,-80},{-38,49}}, color={0,0,127}));
  annotation (
    defaultComponentName = "converter",Icon(coordinateSystem(preserveAspectRatio=false), graphics={                                                                                                                                                                       Text(extent={{-100,40},{-40,-40}},      lineColor = {0, 0, 255}, textString = "="),                                                                                                                                                                                                        Text(extent={{-80,90},{20,50}},      lineColor={0,0,255},     pattern=LinePattern.Dash,   fillColor={0,0,255},     fillPattern=FillPattern.Solid,
          textString="PV"),                                                                                                                                                                                                        Text(extent={{-40,-50},{60,-90}},      lineColor={0,0,255},     pattern=LinePattern.Dash,   fillColor={0,0,255},     fillPattern=
              FillPattern.Solid,
          textString="bat"),                                                                                                                                                                                                        Text(extent={{40,40},{100,-40}},        lineColor = {0, 0, 255}, textString = "=")}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This is DC/DC <a href=\"modelica://PhotoVoltaics.Components.Converters.DCConverter\">converter</a>
   with integrated power measurement and sampled
   <a href=\"modelica://PhotoVoltaics.Components.Blocks.MPTrackerSample\">maxmimum power tracking</a>.
</p></html>"));
end DCConverter;
