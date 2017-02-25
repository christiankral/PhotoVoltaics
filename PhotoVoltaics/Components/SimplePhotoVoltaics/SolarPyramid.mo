within PhotoVoltaics.Components.SimplePhotoVoltaics;
model SolarPyramid "Solar pyramid "
  import Modelica.Constants.pi;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(T = 298.15);
  parameter Records.ModuleData moduleData "Module parameters" annotation (choicesAllMatching = true, Placement(transformation(extent={{60,72},{80,92}})));
  parameter Modelica.SIunits.Angle sunAzimuth = 0 "Azimuth of sun";
  parameter Modelica.SIunits.Angle sunHeight = 1.0471975511965976 "Height of sun";
  parameter Modelica.SIunits.Irradiance irradiance = 1000 "Irradiance";
  Modelica.Blocks.Sources.Constant const(k=Modelica.Constants.pi/2) annotation(Placement(visible = true, transformation(origin={-40,-60},   extent={{-10,10},{10,-10}},      rotation=180)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin={-50,50},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin={-50,10},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin={-50,-30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SimpleModuleSymmetric module1(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort) annotation (Placement(visible=true, transformation(
        origin={20,80},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  SimpleModuleSymmetric module2(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort) annotation (Placement(visible=true, transformation(
        origin={20,40},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  SimpleModuleSymmetric module3(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort) annotation (Placement(visible=true, transformation(
        origin={20,0},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  SimpleModuleSymmetric module4(
    final useConstantIrradiance=false,
    final moduleData=moduleData,
    final useHeatPort=useHeatPort) annotation (Placement(visible=true, transformation(
        origin={20,-40},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter1(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-10,80},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter2(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-10,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter3(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-10,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sources.Irradiance.IrradianceFixedSun irradianceParameter4(
    final irradianceRef=irradiance,
    final sunHeight = sunHeight,
    final sunAzimuth = sunAzimuth)
    annotation (Placement(visible=true, transformation(
        origin={-10,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin p1 "Positive pin of PV panel 1" annotation (Placement(transformation(extent={{90,90},{110,110}}), iconTransformation(extent={{90,90},{110,110}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p2 "Positive pin of PV panel 2" annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p3 "Positive pin of PV panel 3" annotation (Placement(transformation(extent={{90,10},{110,30}}), iconTransformation(extent={{90,10},{110,30}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p4 "Positive pin of PV panel 4" annotation (Placement(transformation(extent={{90,-30},{110,-10}}), iconTransformation(extent={{90,-30},{110,-10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Common negative pin of all four PV panels" annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Blocks.Interfaces.RealInput azimuth "Azimuth of first solar panel" annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput gamma "Angle of inclination of each solar panel" annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  // Voltages
  Modelica.SIunits.Voltage v1 = module1.v "Voltage of module 1";
  Modelica.SIunits.Voltage v2 = module2.v "Voltage of module 2";
  Modelica.SIunits.Voltage v3 = module3.v "Voltage of module 3";
  Modelica.SIunits.Voltage v4 = module4.v "Voltage of module 4";
  // Currents
  Modelica.SIunits.Current i1 = module1.i "Current of module 1";
  Modelica.SIunits.Current i2 = module2.i "Current of module 2";
  Modelica.SIunits.Current i3 = module3.i "Current of module 3";
  Modelica.SIunits.Current i4 = module4.i "Current of module 4";
  Modelica.SIunits.Current iGenerating1 = module1.iGenerating "Negativ current of module 1 (generating)";
  Modelica.SIunits.Current iGenerating2 = module2.iGenerating "Negativ current of module 2 (generating)";
  Modelica.SIunits.Current iGenerating3 = module3.iGenerating "Negativ current of module 3 (generating)";
  Modelica.SIunits.Current iGenerating4 = module4.iGenerating "Negativ current of module 4 (generating)";
  // Power
  Modelica.SIunits.Power power1 = module1.power "Power of module 1";
  Modelica.SIunits.Power power2 = module2.power "Power of module 2";
  Modelica.SIunits.Power power3 = module3.power "Power of module 3";
  Modelica.SIunits.Power power4 = module4.power "Power of module 4";
  Modelica.SIunits.Power powerGenerating1 = module1.powerGenerating "Negative power consumption (generating) of module 1";
  Modelica.SIunits.Power powerGenerating2 = module2.powerGenerating "Negative power consumption (generating) of module 2";
  Modelica.SIunits.Power powerGenerating3 = module3.powerGenerating "Negative power consumption (generating) of module 3";
  Modelica.SIunits.Power powerGenerating4 = module4.powerGenerating "Negative power consumption (generating) of module 4";

equation
  connect(const.y,add1. u2) annotation(Line(points={{-51,-60},{-70,-60},{-70,70},{-56,70},{-56,62}}, color = {0, 0, 127}));
  connect(const.y,add2. u2) annotation(Line(points={{-51,-60},{-70,-60},{-70,30},{-56,30},{-56,22}}, color = {0, 0, 127}));
  connect(const.y,add3. u2) annotation(Line(points={{-51,-60},{-70,-60},{-70,-10},{-56,-10},{-56,-18}},  color = {0, 0, 127}));
  connect(irradianceParameter3.gamma,irradianceParameter4. gamma) annotation(Line(points={{-22,6},{-30,6},{-30,-34},{-26,-34},{-22,-34}},                    color = {0, 0, 127}));
  connect(irradianceParameter2.gamma,irradianceParameter3. gamma) annotation(Line(points={{-22,46},{-30,46},{-30,6},{-22,6}},                     color = {0, 0, 127}));
  connect(irradianceParameter1.gamma,irradianceParameter2. gamma) annotation(Line(points={{-22,86},{-30,86},{-30,46},{-22,46}},              color = {0, 0, 127}));
  connect(add3.y,irradianceParameter4. azimuth) annotation(Line(points={{-50,-41},{-50,-42},{-50,-46},{-22,-46}},                                          color = {0, 0, 127}));
  connect(add2.y,irradianceParameter3. azimuth) annotation(Line(points={{-50,-1},{-50,-2},{-50,-6},{-22,-6}},                                            color = {0, 0, 127}));
  connect(add1.y,irradianceParameter2. azimuth) annotation(Line(points={{-50,39},{-50,39},{-50,34},{-50,34},{-22,34}},                            color = {0, 0, 127}));
  connect(irradianceParameter4.irradiance,module4. variableIrradiance) annotation(Line(points={{1,-40},{1,-40},{8,-40}},                      color = {0, 0, 127}));
  connect(irradianceParameter3.irradiance,module3. variableIrradiance) annotation(Line(points={{1,0},{6,0},{6,6.66134e-16},{8,6.66134e-16}},  color = {0, 0, 127}));
  connect(irradianceParameter2.irradiance,module2. variableIrradiance) annotation(Line(points={{1,40},{8,40}},                                      color = {0, 0, 127}));
  connect(irradianceParameter1.irradiance, module1.variableIrradiance) annotation (Line(points={{1,80},{1,80},{8,80}},    color={0,0,127}));
  connect(add3.u1,add2. y) annotation(Line(points={{-44,-18},{-44,-6},{-50,-6},{-50,-1}},                                     color = {0, 0, 127}));
  connect(add2.u1,add1. y) annotation(Line(points={{-44,22},{-44,22},{-44,34},{-50,34},{-50,39}},                       color = {0, 0, 127}));
  connect(module1.p, p1) annotation (Line(points={{20,90},{20,90},{20,100},{100,100}}, color={0,0,255}));
  connect(module2.p, p2) annotation (Line(points={{20,50},{20,50},{20,52},{20,60},{100,60}},
                                                                                     color={0,0,255}));
  connect(module3.p, p3) annotation (Line(points={{20,10},{20,20},{100,20}}, color={0,0,255}));
  connect(module4.p, p4) annotation (Line(points={{20,-30},{20,-30},{20,-22},{20,-20},{100,-20}},  color={0,0,255}));
  connect(module4.n, n) annotation (Line(points={{20,-50},{20,-50},{20,-56},{100,-56},{100,-86},{100,-86},{100,-100},{100,-100}},
                                                                                                   color={0,0,255}));
  connect(irradianceParameter1.azimuth, azimuth) annotation (Line(points={{-22,74},{-80,74},{-80,-60},{-120,-60}},          color={0,0,127}));
  connect(azimuth, add1.u1) annotation (Line(points={{-120,-60},{-80,-60},{-80,74},{-50,74},{-44,74},{-44,62}}, color={0,0,127}));
  connect(irradianceParameter1.gamma, gamma) annotation (Line(points={{-22,86},{-92,86},{-92,60},{-120,60}},color={0,0,127}));
  connect(module3.n, n) annotation (Line(points={{20,-10},{20,-10},{20,-16},{40,-16},{40,-56},{100,-56},{100,-100},{100,-100}},
                                                                                                            color={0,0,255}));
  connect(module2.n, n) annotation (Line(points={{20,30},{20,30},{20,24},{40,24},{40,-56},{100,-56},{100,-100}},
                                                                                                        color={0,0,255}));
  connect(module1.n, n) annotation (Line(points={{20,70},{20,70},{20,64},{40,64},{40,-56},{100,-56},{100,-100}},
                                                                                                        color={0,0,255}));
  connect(internalHeatPort, internalHeatPort) annotation (Line(points={{-100,-80},{-100,-80}}, color={191,0,0}));
  connect(internalHeatPort, module4.heatPort) annotation (Line(points={{-100,-80},{-96,-80},{-86,-80},{-86,-100},{-40,-100},{50,-100},{50,-30},{30,-30}},          color={191,0,0}));
  connect(module3.heatPort, module4.heatPort) annotation (Line(points={{30,10},{50,10},{50,-30},{30,-30}}, color={191,0,0}));
  connect(module2.heatPort, module4.heatPort) annotation (Line(points={{30,50},{50,50},{50,-30},{30,-30}}, color={191,0,0}));
  connect(module1.heatPort, module4.heatPort) annotation (Line(points={{30,90},{50,90},{50,-30},{30,-30}}, color={191,0,0}));
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
          fillPattern=FillPattern.Solid)}),                      Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
Model of a symmetric solar pyramid as used for a 
<a href=\"https://images.sciencedaily.com/2011/04/110425081301-medium.jpg\">Mars rover</a>
prototype. This model consists of four symmetrical photovoltaic panels. 
The center position of can be moved vertically, such that the four panels are moved altogether. 
The angle of inclination of each panel, <code>gamma</code>, is an input to this model.
The second input is the azimuth of one of the fore panels. The remaining three panels are 
displaced by 90 degrees, each.
</html>"));
end SolarPyramid;
