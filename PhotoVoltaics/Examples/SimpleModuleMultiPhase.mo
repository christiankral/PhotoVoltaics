within PhotoVoltaics.Examples;
model SimpleModuleMultiPhase "Simple module supplies transient three phase AC grid with maximum power tracker"

  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
    Placement(visible = true, transformation(origin={-60,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Electrical.MultiPhase.Basic.Star star annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-60})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{70,-96},{90,-76}})));
  Modelica.Electrical.MultiPhase.Sources.CosineVoltage cosineVoltage(
    freqHz=fill(50, 3),
    V=fill(400*sqrt(2/3), 3),
    phase=-Modelica.Electrical.MultiPhase.Functions.symmetricOrientation(3))
                                                   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-30})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-100,
    duration=2,
    offset=1000,
    startTime=1)                                                                                 annotation (
    Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.Constant powerfactor(k=-acos(0.9))
    annotation (Placement(transformation(extent={{-30,-52},{-10,-32}})));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleModuleSymmetric module(
    moduleData=moduleData,
    useConstantIrradiance=false,
    T=298.15) annotation (Placement(visible=true, transformation(
        origin={-60,30},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(VmpRef=moduleData.VmpRef, ImpRef=moduleData.ImpRef,
    samplePeriod=0.1)                                                                                           annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
  PhotoVoltaics.Components.Converters.MultiPhaseConverter converter annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica.Electrical.MultiPhase.Sensors.PowerSensor powerSensorGrid annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Modelica.Electrical.MultiPhase.Sensors.VoltageQuasiRMSSensor voltageQuasiRMSSensor(m=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-30})));
  Modelica.Electrical.MultiPhase.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor(final m=3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,10})));
  Modelica.Blocks.Math.Division powerFactorActual annotation (Placement(transformation(extent={{-70,-90},{-90,-70}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(extent={{30,-90},{10,-70}})));
  Modelica.Blocks.Math.Gain gain(final k=3)
                                 annotation (Placement(transformation(extent={{0,-90},{-20,-70}})));

  Modelica.SIunits.Power powerDC = powerSensor.power "DC power";
  Modelica.SIunits.Power powerAC = powerSensorGrid.power "AC real power";
  Modelica.SIunits.ApparentPower aparrentPowerAC = powerFactorActual.u2 "AC apparent power";
  Real powerFactorAC = powerFactorActual.y "Actual power factor";

  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Modelica.Constants.inf, uMin=Modelica.Constants.small) annotation (Placement(transformation(extent={{-28,-90},{-48,-70}})));
equation
  connect(powerSensor.pc,powerSensor. pv) annotation (
    Line(points={{-40,50},{-40,60},{-30,60}},        color = {0, 0, 255}));
  connect(powerSensor.nv,groundDC. p) annotation (
    Line(points={{-30,40},{-30,40},{-30,12},{-30,10},{-60,10}},               color = {0, 0, 255}));
  connect(ground.p,star. pin_n)
    annotation (Line(points={{80,-76},{80,-76},{80,-74},{80,-74},{80,-70},{80,-70}},
                                                        color={0,0,255}));
  connect(cosineVoltage.plug_n,star. plug_p)
    annotation (Line(points={{80,-40},{80,-46},{80,-50}}, color={0,0,255}));
  connect(module.variableIrradiance, ramp.y) annotation (Line(points={{-72,30},{-76,30},{-79,30}},
                                                             color={0,0,127}));
  connect(module.n, groundDC.p) annotation (Line(points={{-60,20},{-60,15},{-60,10}},
                      color={0,0,255}));
  connect(module.p, powerSensor.pc) annotation (Line(points={{-60,40},{-60,50},{-40,50}},
                         color={0,0,255}));
  connect(converter.dc_p, powerSensor.nc)
    annotation (Line(points={{-10,36},{-10,50},{-20,50}},
                                                      color={0,0,255}));
  connect(converter.dc_n, groundDC.p)
    annotation (Line(points={{-10,24},{-10,10},{-60,10}},color={0,0,255}));
  connect(mpTracker.power, powerSensor.power) annotation (Line(points={{-32,-10},{-40,-10},{-40,39}},
                                   color={0,0,127}));
  connect(mpTracker.vRef, converter.vDCRef)
    annotation (Line(points={{-9,-10},{-6,-10},{-6,18}},
                                                       color={0,0,127}));
  connect(powerfactor.y, converter.phi) annotation (Line(points={{-9,-42},{6,-42},{6,18}},     color={0,0,127}));
  connect(converter.ac, powerSensorGrid.pc) annotation (Line(points={{10,30},{16,30},{20,30}},
                                                                                            color={0,0,255}));
  connect(powerSensorGrid.pv, powerSensorGrid.pc) annotation (Line(points={{30,40},{20,40},{20,30}},color={0,0,255}));
  connect(powerSensorGrid.nv, star.plug_p) annotation (Line(points={{30,20},{30,20},{30,-2},{30,-50},{80,-50}}, color={0,0,255}));
  connect(powerSensorGrid.nc, currentQuasiRMSSensor.plug_p) annotation (Line(points={{40,30},{54,30},{80,30},{80,20}}, color={0,0,255}));
  connect(currentQuasiRMSSensor.plug_n, cosineVoltage.plug_p) annotation (Line(points={{80,0},{80,-6},{80,-20}},
                                                                                                         color={0,0,255}));
  connect(voltageQuasiRMSSensor.plug_n, star.plug_p) annotation (Line(points={{50,-40},{50,-50},{80,-50}}, color={0,0,255}));
  connect(voltageQuasiRMSSensor.plug_p, currentQuasiRMSSensor.plug_n) annotation (Line(points={{50,-20},{50,-10},{80,-10},{80,0}}, color={0,0,255}));
  connect(powerFactorActual.u1, powerSensorGrid.power) annotation (Line(points={{-68,-74},{-60,-74},{-60,-60},{20,-60},{20,19}}, color={0,0,127}));
  connect(gain.u, product.y) annotation (Line(points={{2,-80},{9,-80}},         color={0,0,127}));
  connect(product.u1, currentQuasiRMSSensor.I) annotation (Line(points={{32,-74},{32,-74},{34,-74},{34,-32},{34,10},{69,10}}, color={0,0,127}));
  connect(product.u2, voltageQuasiRMSSensor.V) annotation (Line(points={{32,-86},{38,-86},{38,-30},{39,-30}}, color={0,0,127}));
  connect(limiter.y, powerFactorActual.u2) annotation (Line(points={{-49,-80},{-60,-80},{-60,-84},{-60,-86},{-68,-86}}, color={0,0,127}));
  connect(limiter.u, gain.y) annotation (Line(points={{-26,-80},{-21,-80}}, color={0,0,127}));
  annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), experiment(StopTime=5, Interval=0.0001));
end SimpleModuleMultiPhase;
