package PhotoVoltaics_TGM
  extends Modelica.Icons.Package;

  model TGM_Comax_WeatherData "This example illustrates how to use PV panel models"
    extends Modelica.Icons.Example;
    parameter Integer nsModule = 6 "Number of series connected modules";
    parameter Integer npModule = 1 "Number of parallel connected modules";

    Buildings.BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil(
      til=0.17453292519943,
      lat=0.84264496286286,
      azi=0)                                                                                                                                    "Diffuse irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-60,60},{-40,80}},      rotation = 0)));
    Buildings.BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil(
      til=0.17453292519943,
      lat=0.84264496286286,
      azi=0)                                                                                                                                           "Direct irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-60,30},{-40,50}},      rotation = 0)));
    Modelica.Blocks.Math.Add G "Total irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-20,40},{0,60}},       rotation = 0)));
    PhotoVoltaics.Components.SimplePlantSymmetric plant(
      useConstantIrradiance=false,
      moduleData=moduleData,
      npModule=1,
      nsModule=6) annotation (Placement(visible=true, transformation(
          origin={-50,-30},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Electrical.Analog.Basic.Ground ground annotation (
      Placement(visible = true, transformation(origin={-50,-60},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter PhotoVoltaics.Records.TSM_200_DC01A
                                    moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Buildings.BoundaryConditions.WeatherData.ReaderTMY3
                                              weaDat(
        computeWetBulbTemperature=false, filNam="modelica://PhotoVoltaics/Resources/WeatherData/AUT_Vienna.Schwechat.110360_IWEC.mos")
      annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
    PhotoVoltaics.Components.SinglePhaseVoltageControlledConverter
                                                     converter annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
    PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(
      VmpRef=nsModule*moduleData.VmpRef,
      ImpRef=npModule*moduleData.ImpRef,
      samplePeriod=60)                   annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (Placement(transformation(extent={{60,-70},{80,-50}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(
      f=50,
      V=230,
      phi=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-30})));
    Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
    Modelica.Blocks.Continuous.Integrator integrator(y(unit="J")) annotation (Placement(transformation(extent={{-60,-90},{-80,-70}})));
  equation
    connect(HDirTil.H, G.u2) annotation (
      Line(points={{-39,40},{-30,40},{-30,44},{-22,44}},          color = {0, 0, 127}));
    connect(HDifTil.H, G.u1) annotation (
      Line(points={{-39,70},{-30,70},{-30,56},{-22,56}},          color = {0, 0, 127}));
    connect(G.y, plant.variableIrradiance) annotation (Line(points={{1,50},{10,50},{10,20},{-70,20},{-70,-30},{-62,-30}},
                                                                                      color={0,0,127}));
    connect(ground.p, plant.n) annotation (Line(points={{-50,-50},{-50,-40}},     color={0,0,255}));
    connect(weaDat.weaBus, HDifTil.weaBus) annotation (Line(
        points={{-80,70},{-70,70},{-60,70}},
        color={255,204,51},
        thickness=0.5));
    connect(weaDat.weaBus, HDirTil.weaBus) annotation (Line(
        points={{-80,70},{-70,70},{-70,40},{-60,40}},
        color={255,204,51},
        thickness=0.5));
    connect(mpTracker.vRef,converter. vDCRef) annotation (Line(points={{11,-80},{20,-80},{20,-42}}, color={0,0,127}));
    connect(converter.ac_n,groundAC. pin) annotation (Line(points={{30,-40},{30,-50},{70,-50}}, color={85,170,255}));
    connect(groundAC.pin,voltageSource. pin_n) annotation (Line(points={{70,-50},{70,-50},{70,-40}}, color={85,170,255}));
    connect(powerSensor.nc,converter. dc_p) annotation (Line(points={{-10,-10},{-10,-10},{10,-10},{10,-20}},
                                                                                                     color={0,0,255}));
    connect(mpTracker.power,powerSensor. power) annotation (Line(points={{-12,-80},{-12,-80},{-28,-80},{-28,-21}},
                                                                                                               color={0,0,127}));
    connect(powerSensor.pc,powerSensor. pv) annotation (Line(points={{-30,-10},{-30,0},{-20,0}},  color={0,0,255}));
    connect(converter.ac_p,voltageSource. pin_p) annotation (Line(points={{30,-20},{30,-20},{30,-10},{70,-10},{70,-20}},
                                                                                                                    color={85,170,255}));
    connect(plant.p, powerSensor.pc) annotation (Line(points={{-50,-20},{-50,-10},{-30,-10}}, color={0,0,255}));
    connect(powerSensor.nv, ground.p) annotation (Line(points={{-20,-20},{-20,-20},{-20,-44},{-20,-44},{-20,-50},{-50,-50}}, color={0,0,255}));
    connect(ground.p, converter.dc_n) annotation (Line(points={{-50,-50},{10,-50},{10,-40}}, color={0,0,255}));
    connect(integrator.u, powerSensor.power) annotation (Line(points={{-58,-80},{-58,-80},{-28,-80},{-28,-21}}, color={0,0,127}));
    annotation (
      experiment(
        StopTime=2.592e+06,
        Interval=60,
        Tolerance=1e-05),
      Documentation(revisions="<html>
</html>", info="<html>
<p>This example is based on weather data taken from 
<a href=\"https://energyplus.net/weather-location/europe_wmo_region_6/AUT//AUT_Vienna.Schwechat.110360_IWEC\">https://energyplus.net</a>. 
The EPW file was converted using a java script provided by the 
<a href=\"\">Buildings</a> library.</p>
<p><code>
java -jar .../Buildings/Resources/bin/ConvertWeatherData.jar .../PhotoVoltaics/Resources/WeatherData/AUT_Vienna.Schwechat.110360_IWEC.epw
</code></p>

</html>"));
  end TGM_Comax_WeatherData;

  model PVPlant_OpenCircuit "This example illustrates how to use PV panel models"
    extends Modelica.Icons.Example;
    Buildings.BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil(
      til=0.17453292519943,
      lat=0.84264496286286,
      azi=0)                                                                                                                                    "Diffuse irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-50,30},{-30,50}},      rotation = 0)));
    Buildings.BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil(
      til=0.17453292519943,
      lat=0.84264496286286,
      azi=0)                                                                                                                                           "Direct irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-50,-10},{-30,10}},     rotation = 0)));
    Modelica.Blocks.Math.Add G "Total irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-10,10},{10,30}},      rotation = 0)));
    PhotoVoltaics.Components.SimplePlantSymmetric plant(
      useConstantIrradiance=false,
      moduleData=moduleData,
      npModule=1,
      nsModule=6) annotation (Placement(visible=true, transformation(
          origin={50,20},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Electrical.Analog.Basic.Ground ground annotation (
      Placement(visible = true, transformation(origin={50,-12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter PhotoVoltaics.Records.TSM_200_DC01A
                                    moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Buildings.BoundaryConditions.WeatherData.ReaderTMY3
                                              weaDat(
        computeWetBulbTemperature=false, filNam="modelica://PhotoVoltaics/Resources/WeatherData/AUT_Vienna.Schwechat.110360_IWEC.mos")
      annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
  equation
    connect(HDirTil.H, G.u2) annotation (
      Line(points={{-29,0},{-24,0},{-24,14},{-12,14}},            color = {0, 0, 127}));
    connect(HDifTil.H, G.u1) annotation (
      Line(points={{-29,40},{-24,40},{-24,26},{-12,26}},          color = {0, 0, 127}));
    connect(G.y, plant.variableIrradiance) annotation (Line(points={{11,20},{38,20}}, color={0,0,127}));
    connect(ground.p, plant.n) annotation (Line(points={{50,-2},{50,-2},{50,10}}, color={0,0,255}));
    connect(weaDat.weaBus, HDifTil.weaBus) annotation (Line(
        points={{-80,40},{-50,40}},
        color={255,204,51},
        thickness=0.5));
    connect(weaDat.weaBus, HDirTil.weaBus) annotation (Line(
        points={{-80,40},{-60,40},{-60,0},{-50,0}},
        color={255,204,51},
        thickness=0.5));
    annotation (
      experiment(
        StopTime=3.1536e+07,
        Intervals=3153600,
        Tolerance=1e-05),
      Documentation(revisions="<html>
</html>", info="<html>
<p>This example is based on weather data taken from 
<a href=\"https://energyplus.net/weather-location/europe_wmo_region_6/AUT//AUT_Vienna.Schwechat.110360_IWEC\">https://energyplus.net</a>. 
The EPW file was converted using a java script provided by the 
<a href=\"\">Buildings</a> library.</p>
<p><code>
java -jar .../Buildings/Resources/bin/ConvertWeatherData.jar .../PhotoVoltaics/Resources/WeatherData/AUT_Vienna.Schwechat.110360_IWEC.epw
</code></p>

</html>"));
  end PVPlant_OpenCircuit;

  annotation (
    version="0.1.0",
    versionBuild=1,
    versionDate="2016-12-31",
    uses(Modelica(version="3.2.2"),Buildings(version="4.0.0"),
      PhotoVoltaics(version="0.1.0")),
    Documentation(info="<html>
<p>This library is based on the 
<a href=\"https://github.com/christiankral/PhotoVoltaics\">PhotoVoltaics</a> and the 
<a href=\"https://github.com/lbl-srg/modelica-buildings\">Buildings</a> 
library.</p></html>"));
end PhotoVoltaics_TGM;
