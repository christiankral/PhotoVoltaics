within PhotoVoltaics.Examples;
model SolarPyramidBatteryCharge "Solar pyramid charging a battery"
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;

  Components.SimplePhotoVoltaics.SolarPyramidDCConverter solarPyramid(
    moduleData=moduleData,
    VRef=moduleData.VmpRef,
    VmpRef=moduleData.VmpRef,
    ImpRef=moduleData.ImpRef,
    samplePeriod=0.5,
    sunHeight=0.38397243543875) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Sources.Ramp gammaRamp(
    offset=0,
    height=60*pi/180,
    startTime=10,
    duration=480)
                 annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Sources.Constant azimuthConst(k=10*pi/180)
                                                     annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=24) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-2})));
  parameter Records.SHARP_NU_S5_E3E moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));

  Modelica.SIunits.Conversions.NonSIunits.Angle_deg gamma_deg = Modelica.SIunits.Conversions.to_deg(solarPyramid.gamma);
equation
  connect(gammaRamp.y, solarPyramid.gamma) annotation (Line(points={{-59,20},{-54,20},{-54,6},{-42,6}}, color={0,0,127}));
  connect(azimuthConst.y, solarPyramid.azimuth) annotation (Line(points={{-59,-20},{-50,-20},{-50,-6},{-42,-6}}, color={0,0,127}));
  connect(ground.p, solarPyramid.nModule) annotation (Line(points={{-30,-20},{-30,-15},{-30,-10}}, color={0,0,255}));
  connect(solarPyramid.dc_n, ground.p) annotation (Line(points={{-20,-6},{-12,-6},{-12,-20},{-30,-20}}, color={0,0,255}));
  connect(solarPyramid.dc_p, constantVoltage.p) annotation (Line(points={{-20,6},{-16,6},{-12,6},{-12,20},{20,20},{20,8}}, color={0,0,255}));
  connect(solarPyramid.dc_n, constantVoltage.n) annotation (Line(points={{-20,-6},{-12,-6},{-12,-20},{20,-20},{20,-12}}, color={0,0,255}));
  annotation (experiment(StopTime=500, Interval=0.025));
end SolarPyramidBatteryCharge;
