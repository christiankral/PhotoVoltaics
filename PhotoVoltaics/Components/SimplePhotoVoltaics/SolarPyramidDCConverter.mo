within PhotoVoltaics.Components.SimplePhotoVoltaics;
model SolarPyramidDCConverter "Solar pyramid with DC/DC converters"
  import Modelica.Constants.pi;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(T = 298.15);
  extends Modelica.Electrical.PowerConverters.Interfaces.ACDC.DCtwoPin;
  parameter Records.ModuleData moduleData "Module parameters" annotation (choicesAllMatching = true, Placement(transformation(extent={{40,-88},{60,-68}})));
  parameter Modelica.SIunits.Angle sunAzimuth = 0 "Azimuth of sun" annotation(Dialog(group="Irradiance"));
  parameter Modelica.SIunits.Angle sunHeight = 1.0471975511965976 "Height of sun" annotation(Dialog(group="Irradiance"));
  parameter Modelica.SIunits.Irradiance irradiance = 1000 "Irradiance" annotation(Dialog(group="Irradiance"));

  parameter Modelica.SIunits.Voltage VRef = 48 "Reference DC source voltage" annotation(Dialog(group="Converter"));
  parameter Modelica.SIunits.Time Ti = 1E-6 "Internal integration time constant" annotation(Dialog(group="Converter"));

  parameter Modelica.SIunits.Time startTime = 0 "Start time" annotation(Dialog(group="MP tracker"));
  parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period" annotation(Dialog(group="MP tracker"));
  parameter Modelica.SIunits.Voltage VmpRef "Reference maximum power power of plant" annotation(Dialog(group="MP tracker"));
  parameter Modelica.SIunits.Current ImpRef "Reference maximum power current of plant" annotation(Dialog(group="MP tracker"));
  parameter Integer n = 100 "Number of voltage and power discretizations" annotation(Dialog(group="MP tracker"));

  parameter Real shadow1(final min=0, final max=1)=0 "Shadow of module 1";
  parameter Real shadow2(final min=0, final max=1)=0 "Shadow of module 2";
  parameter Real shadow3(final min=0, final max=1)=0 "Shadow of module 3";
  parameter Real shadow4(final min=0, final max=1)=0 "Shadow of module 4";

  Modelica.Blocks.Sources.Constant const(k=Modelica.Constants.pi/2) annotation(Placement(visible = true, transformation(origin={-30,-70},   extent={{-10,10},{10,-10}},      rotation=180)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin={-70,50},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin={-70,10},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin={-70,-30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SimpleModuleSymmetric module1(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort,
    final T=T,
    final shadow=shadow1)          annotation (Placement(visible=true, transformation(
        origin={0,80},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  SimpleModuleSymmetric module2(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort,
    final T=T,
    final shadow=shadow2)          annotation (Placement(visible=true, transformation(
        origin={0,40},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  SimpleModuleSymmetric module3(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort,
    final T=T,
    final shadow=shadow3)          annotation (Placement(visible=true, transformation(
        origin={0,0},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  SimpleModuleSymmetric module4(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort,
    final T=T,
    final shadow=shadow4)          annotation (Placement(visible=true, transformation(
        origin={0,-40},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter1(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-30,80},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter2(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-30,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter3(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-30,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter4(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-30,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin nModule "Common negative pin of all four PV modules (needs ground)" annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Blocks.Interfaces.RealInput azimuth "Azimuth of first solar panel" annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput gamma "Angle of inclination of each solar panel" annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  // Voltages
  Modelica.SIunits.Voltage v1 = module1.v "Voltage of module 1";
  Modelica.SIunits.Voltage v2 = module2.v "Voltage of module 2";
  Modelica.SIunits.Voltage v3 = module3.v "Voltage of module 3";
  Modelica.SIunits.Voltage v4 = module4.v "Voltage of module 4";
  // Currents
  Modelica.SIunits.Current i1(start=0) = module1.i "Current of module 1";
  Modelica.SIunits.Current i2(start=0) = module2.i "Current of module 2";
  Modelica.SIunits.Current i3(start=0) = module3.i "Current of module 3";
  Modelica.SIunits.Current i4(start=0) = module4.i "Current of module 4";
  Modelica.SIunits.Current iGenerating1 = module1.iGenerating "Negativ current of module 1 (generating)";
  Modelica.SIunits.Current iGenerating2 = module2.iGenerating "Negativ current of module 2 (generating)";
  Modelica.SIunits.Current iGenerating3 = module3.iGenerating "Negativ current of module 3 (generating)";
  Modelica.SIunits.Current iGenerating4 = module4.iGenerating "Negativ current of module 4 (generating)";
  // Power
  Modelica.SIunits.Power power1 = module1.power "Power of module 1";
  Modelica.SIunits.Power power2 = module2.power "Power of module 2";
  Modelica.SIunits.Power power3 = module3.power "Power of module 3";
  Modelica.SIunits.Power power4 = module4.power "Power of module 4";
  Modelica.SIunits.Power power = power1+power2+power3+power4 "Total power of all four modules";

  Modelica.SIunits.Power powerGenerating1 = module1.powerGenerating "Negative power consumption (generating) of module 1";
  Modelica.SIunits.Power powerGenerating2 = module2.powerGenerating "Negative power consumption (generating) of module 2";
  Modelica.SIunits.Power powerGenerating3 = module3.powerGenerating "Negative power consumption (generating) of module 3";
  Modelica.SIunits.Power powerGenerating4 = module4.powerGenerating "Negative power consumption (generating) of module 4";
  Modelica.SIunits.Power powerGenerating = powerGenerating1+powerGenerating2+powerGenerating3+powerGenerating4 "Total negative power consumption (generating) of all four modules";

  Converters.ConvertersWithSampleMPTracker.DCConverter dcConverter1(
    final VRef=VRef,
    final Ti=Ti,
    final startTime=startTime,
    final samplePeriod=samplePeriod,
    final VmpRef=VmpRef,
    final ImpRef=ImpRef,
    final n=n)
    annotation (Placement(transformation(extent={{40,70},{60,90}})));
  Converters.ConvertersWithSampleMPTracker.DCConverter dcConverter2(
    final VRef=VRef,
    final Ti=Ti,
    final startTime=startTime,
    final samplePeriod=samplePeriod,
    final VmpRef=VmpRef,
    final ImpRef=ImpRef,
    final n=n)
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Converters.ConvertersWithSampleMPTracker.DCConverter dcConverter3(
    final VRef=VRef,
    final Ti=Ti,
    final startTime=startTime,
    final samplePeriod=samplePeriod,
    final VmpRef=VmpRef,
    final ImpRef=ImpRef,
    final n=n)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Converters.ConvertersWithSampleMPTracker.DCConverter dcConverter4(
    final VRef=VRef,
    final Ti=Ti,
    final startTime=startTime,
    final samplePeriod=samplePeriod,
    final VmpRef=VmpRef,
    final ImpRef=ImpRef,
    final n=n)
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
equation
  connect(const.y,add1. u2) annotation(Line(points={{-41,-70},{-50,-70},{-50,-60},{-90,-60},{-90,70},{-76,70},{-76,62}}, color = {0, 0, 127}));
  connect(const.y,add2. u2) annotation(Line(points={{-41,-70},{-50,-70},{-50,-60},{-90,-60},{-90,30},{-76,30},{-76,22}}, color = {0, 0, 127}));
  connect(const.y,add3. u2) annotation(Line(points={{-41,-70},{-50,-70},{-50,-60},{-90,-60},{-90,-10},{-76,-10},{-76,-18}}, color = {0, 0, 127}));
  connect(irradianceParameter3.gamma,irradianceParameter4. gamma) annotation(Line(points={{-42,6},{-50,6},{-50,-34},{-46,-34},{-42,-34}},                    color = {0, 0, 127}));
  connect(irradianceParameter2.gamma,irradianceParameter3. gamma) annotation(Line(points={{-42,46},{-50,46},{-50,6},{-42,6}},                     color = {0, 0, 127}));
  connect(irradianceParameter1.gamma,irradianceParameter2. gamma) annotation(Line(points={{-42,86},{-50,86},{-50,46},{-42,46}},              color = {0, 0, 127}));
  connect(add3.y,irradianceParameter4. azimuth) annotation(Line(points={{-70,-41},{-70,-42},{-70,-46},{-42,-46}}, color = {0, 0, 127}));
  connect(add2.y,irradianceParameter3. azimuth) annotation(Line(points={{-70,-1},{-70,-2},{-70,-6},{-42,-6}}, color = {0, 0, 127}));
  connect(add1.y,irradianceParameter2. azimuth) annotation(Line(points={{-70,39},{-70,39},{-70,34},{-42,34}}, color = {0, 0, 127}));
  connect(irradianceParameter4.irradiance,module4. variableIrradiance) annotation(Line(points={{-19,-40},{-19,-40},{-12,-40}},                color = {0, 0, 127}));
  connect(irradianceParameter3.irradiance,module3. variableIrradiance) annotation(Line(points={{-19,0},{-14,0},{-14,6.66134e-16},{-12,6.66134e-16}}, color = {0, 0, 127}));
  connect(irradianceParameter2.irradiance,module2. variableIrradiance) annotation(Line(points={{-19,40},{-12,40}}, color = {0, 0, 127}));
  connect(irradianceParameter1.irradiance, module1.variableIrradiance) annotation (Line(points={{-19,80},{-19,80},{-12,80}}, color={0,0,127}));
  connect(add3.u1,add2. y) annotation(Line(points={{-64,-18},{-64,-6},{-70,-6},{-70,-1}}, color = {0, 0, 127}));
  connect(add2.u1,add1. y) annotation(Line(points={{-64,22},{-64,22},{-64,34},{-70,34},{-70,39}}, color = {0, 0, 127}));
  connect(module4.n, nModule) annotation (Line(points={{-4.44089e-16,-50},{0,-50},{0,-56},{16,-56},{16,-100},{8,-100},{0,-100}},          color={0,0,255}));
  connect(irradianceParameter1.azimuth, azimuth) annotation (Line(points={{-42,74},{-96,74},{-96,-60},{-120,-60}},          color={0,0,127}));
  connect(azimuth, add1.u1) annotation (Line(points={{-120,-60},{-96,-60},{-96,74},{-96,74},{-64,74},{-64,62}}, color={0,0,127}));
  connect(irradianceParameter1.gamma, gamma) annotation (Line(points={{-42,86},{-100,86},{-100,60},{-120,60}}, color={0,0,127}));
  connect(module3.n, nModule) annotation (Line(points={{-6.66134e-16,-10},{0,-10},{0,-16},{16,-16},{16,-56},{16,-100},{0,-100}}, color={0,0,255}));
  connect(module2.n, nModule) annotation (Line(points={{0,30},{0,30},{0,24},{16,24},{16,-56},{16,-100},{0,-100}}, color={0,0,255}));
  connect(module1.n, nModule) annotation (Line(points={{0,70},{0,70},{0,64},{16,64},{16,-56},{16,-100},{0,-100}}, color={0,0,255}));
  connect(module3.heatPort, module4.heatPort) annotation (Line(points={{10,10},{24,10},{24,-30},{10,-30}}, color={191,0,0}));
  connect(module2.heatPort, module4.heatPort) annotation (Line(points={{10,50},{24,50},{24,-30},{10,-30}}, color={191,0,0}));
  connect(module1.heatPort, module4.heatPort) annotation (Line(points={{10,90},{24,90},{24,-30},{10,-30}}, color={191,0,0}));
  connect(module1.n, dcConverter1.dc_n1) annotation (Line(points={{0,70},{0,64},{30,64},{30,74},{40,74}}, color={0,0,255}));
  connect(module1.p, dcConverter1.dc_p1) annotation (Line(points={{0,90},{0,96},{30,96},{30,86},{40,86}}, color={0,0,255}));
  connect(internalHeatPort, module4.heatPort) annotation (Line(points={{-100,-80},{-86,-80},{-86,-100},{-40,-100},{-40,-86},{24,-86},{24,-30},{10,-30}}, color={191,0,0}));
  connect(module2.p, dcConverter2.dc_p1) annotation (Line(points={{0,50},{0,56},{30,56},{30,46},{40,46}}, color={0,0,255}));
  connect(module2.n, dcConverter2.dc_n1) annotation (Line(points={{0,30},{0,30},{0,24},{30,24},{30,34},{40,34}},        color={0,0,255}));
  connect(module3.p, dcConverter3.dc_p1) annotation (Line(points={{0,10},{0,16},{30,16},{30,6},{40,6}}, color={0,0,255}));
  connect(module3.n, dcConverter3.dc_n1) annotation (Line(points={{0,-10},{0,-10},{0,-16},{30,-16},{30,-6},{40,-6}},         color={0,0,255}));
  connect(module4.p, dcConverter4.dc_p1) annotation (Line(points={{0,-30},{0,-24},{30,-24},{30,-34},{40,-34}}, color={0,0,255}));
  connect(module4.n, dcConverter4.dc_n1) annotation (Line(points={{0,-50},{0,-50},{0,-56},{30,-56},{30,-46},{40,-46}}, color={0,0,255}));
  connect(dcConverter1.dc_p2, dc_p) annotation (Line(points={{60,86},{70,86},{80,86},{80,60},{100,60}}, color={0,0,255}));
  connect(dcConverter1.dc_n2, dc_n) annotation (Line(points={{60,74},{70,74},{70,-60},{100,-60}}, color={0,0,255}));
  connect(dcConverter2.dc_p2, dc_p) annotation (Line(points={{60,46},{80,46},{80,60},{100,60}}, color={0,0,255}));
  connect(dcConverter3.dc_p2, dc_p) annotation (Line(points={{60,6},{80,6},{80,60},{100,60}}, color={0,0,255}));
  connect(dcConverter4.dc_p2, dc_p) annotation (Line(points={{60,-34},{80,-34},{80,60},{100,60}}, color={0,0,255}));
  connect(dcConverter2.dc_n2, dc_n) annotation (Line(points={{60,34},{70,34},{70,-60},{100,-60}}, color={0,0,255}));
  connect(dcConverter3.dc_n2, dc_n) annotation (Line(points={{60,-6},{70,-6},{70,-60},{100,-60}}, color={0,0,255}));
  connect(dcConverter4.dc_n2, dc_n) annotation (Line(points={{60,-46},{70,-46},{70,-60},{100,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{-88,80},{-8,0},{-88,-80},{-88,80}},
          lineColor={0,0,127},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{88,80},{8,0},{88,-80},{88,80}},
          lineColor={0,0,127},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-8},{-80,-88},{80,-88},{0,-8}},
          lineColor={0,0,127},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,8},{-80,88},{80,88},{0,8}},
          lineColor={0,0,127},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-42,10},{-22,-10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-62,30},{-42,10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-62,10},{-42,-10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-62,-10},{-42,-30}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-82,50},{-62,30}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-82,30},{-62,10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-82,10},{-62,-10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-82,-10},{-62,-30}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-82,-30},{-62,-50}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,42},{10,22}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-30,62},{-10,42}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,62},{10,42}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,42},{30,62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-50,82},{-30,62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-30,82},{-10,62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,62},{10,82}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,62},{30,82}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{30,62},{50,82}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{22,-10},{42,10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{42,10},{62,30}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{42,-10},{62,10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{42,-30},{62,-10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{62,-50},{82,-30}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{62,-30},{82,-10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{62,-10},{82,10}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{62,10},{82,30}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{62,30},{82,50}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,-42},{10,-22}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-30,-62},{-10,-42}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,-62},{10,-42}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,-62},{30,-42}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-50,-82},{-30,-62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-30,-82},{-10,-62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,-82},{10,-62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,-82},{30,-62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{30,-82},{50,-62}},
          lineColor={255,255,255},
          fillColor={85,85,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-8,8},{8,-8}},
          lineColor={255,255,255},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),                                             Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
Model of a symmetric solar pyramid as used for a
<a href=\"https://images.sciencedaily.com/2011/04/110425081301-medium.jpg\">Mars rover</a>
prototype. This model consists of four symmetrical photovoltaic panels.
The center position of can be moved vertically, such that the four panels are moved altogether.
The angle of inclination of each panel, <code>gamma</code>, is an input to this model.
The second input is the azimuth of one of the fore panels. The remaining three panels are
displaced by 90 degrees, each.
</p>
<p>This model includes four DC/DC converters</p>
</html>"));
end SolarPyramidDCConverter;
