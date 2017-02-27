within PhotoVoltaics.Sources.Irradiance;
model IrradianceFixedSun "Simple solar irradiance with fixed sun position"
  import Modelica.Constants.pi;
  parameter Modelica.SIunits.Irradiance irradianceRef = 1000 "Reference solar irradiance";
  parameter Modelica.SIunits.Angle sunHeight "Sun height";
  parameter Modelica.SIunits.Angle sunAzimuth "Sun azimuth";
  Modelica.SIunits.Angle angleOfIncidence "Angle of incidence between a vector in sun direction and a normal vector";
  Modelica.SIunits.Irradiance directIrradianceHorizontal "Direct irradiance on the horizontal";
  Modelica.SIunits.Irradiance directIrradianceInclined "Direct irradiance on the inclined plane";
  Modelica.Blocks.Interfaces.RealOutput irradiance annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Interfaces.RealInput gamma annotation(Placement(visible = true, transformation(origin={-120,60},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-120,60},    extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput azimuth annotation(Placement(visible = true, transformation(origin={-120,-60},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-120,-60},    extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  angleOfIncidence = acos((-cos(sunHeight) * sin(gamma) * cos(sunAzimuth - azimuth)) + sin(sunHeight) * cos(gamma));
  directIrradianceHorizontal = if sunHeight < 0 then 0 else irradianceRef * sin(sunHeight);
  directIrradianceInclined = if angleOfIncidence > pi / 2 then 0 else if abs(sin(sunHeight)) < 1E-5 then 0 else directIrradianceHorizontal * (cos(angleOfIncidence) / sin(sunHeight));
  irradiance = directIrradianceInclined;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {28, 108, 200}),
        Ellipse(
          extent={{-40,40},{40,-40}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{30,48},{80,80},{38,36},{30,48}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{48,-14},{90,-48},{40,-28},{48,-14}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{34,-38},{84,-92},{22,-48},{34,-38}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-10,50},{0,80},{12,50},{-10,50}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-42,30},{-84,78},{-30,42},{-42,30}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-54,-6},{-86,10},{-52,12},{-54,-6}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,-34},{-92,-62},{-50,-18},{-40,-34}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-4,-48},{-28,-92},{-22,-42},{-4,-48}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{46,20},{92,24},{50,6},{46,20}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,100},{0,-100}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Line(
          points={{60,100},{60,-100}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Line(
          points={{-60,100},{-60,-100}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Line(
          points={{-100,0},{100,0}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Line(
          points={{-100,60},{100,60}},
          color={0,0,0},
          pattern=LinePattern.Dash),
        Line(
          points={{-100,-60},{100,-60}},
          color={0,0,0},
          pattern=LinePattern.Dash),                                                                                                                                                                                                        Text(extent={{-150,150},{150,110}},      lineColor = {0, 0, 255}, textString = "%name")}),
                                                                                                                                                                                                        Diagram(coordinateSystem(preserveAspectRatio = false)));
end IrradianceFixedSun;
