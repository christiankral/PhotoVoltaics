package PhotoVoltaics_TGM
  extends Modelica.Icons.Package;

  model TGM_Comax_WeatherData_OneYear "This example illustrates how to use PV panel models"
    extends Modelica.Icons.Example;
    parameter Integer nsModule = 6 "Number of series connected modules";
    parameter Integer npModule = 1 "Number of parallel connected modules";

    Buildings.BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil(
      til=0.17453292519943,
      lat=0.84264496286286,
      azi=0)                                                                                                                                    "Diffuse irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-60,70},{-40,90}},      rotation = 0)));
    Buildings.BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil(
      til=0.17453292519943,
      lat=0.84264496286286,
      azi=0)                                                                                                                                           "Direct irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-60,40},{-40,60}},      rotation = 0)));
    Modelica.Blocks.Math.Add G "Total irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-20,50},{0,70}},       rotation = 0)));
    PhotoVoltaics.Components.SimplePlantSymmetric plant(
      useConstantIrradiance=false,
      moduleData=moduleData,
      npModule=1,
      nsModule=6) annotation (Placement(visible=true, transformation(
          origin={-50,-10},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Electrical.Analog.Basic.Ground ground annotation (
      Placement(visible = true, transformation(origin={-50,-40},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter PhotoVoltaics.Records.TSM_200_DC01A
                                    moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Buildings.BoundaryConditions.WeatherData.ReaderTMY3
                                              weaDat(
        computeWetBulbTemperature=false, filNam="modelica://PhotoVoltaics/Resources/WeatherData/AUT_Vienna.Schwechat.110360_IWEC.mos")
      annotation (Placement(transformation(extent={{-100,70},{-80,90}})));
    PhotoVoltaics.Components.SinglePhaseVoltageControlledConverter
                                                     converter annotation (Placement(transformation(extent={{10,-20},{30,0}})));
    PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(
      VmpRef=nsModule*moduleData.VmpRef,
      ImpRef=npModule*moduleData.ImpRef,
      samplePeriod=60)                   annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(
      f=50,
      V=230,
      phi=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-10})));
    Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
    Modelica.Blocks.Continuous.Integrator integrator(y(unit="J")) annotation (Placement(transformation(extent={{-50,-70},{-70,-50}})));
    WriteCSV writeCSV(fileName=Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/TGM_Comax_WeatherData_OneYear_energy.csv"), inputQuantity="energy(J)")
                      annotation (Placement(transformation(extent={{-80,-70},{-100,-50}})));
  equation
    connect(HDirTil.H, G.u2) annotation (
      Line(points={{-39,50},{-30,50},{-30,54},{-22,54}},          color = {0, 0, 127}));
    connect(HDifTil.H, G.u1) annotation (
      Line(points={{-39,80},{-30,80},{-30,66},{-22,66}},          color = {0, 0, 127}));
    connect(G.y, plant.variableIrradiance) annotation (Line(points={{1,60},{10,60},{10,30},{-70,30},{-70,-10},{-62,-10}},
                                                                                      color={0,0,127}));
    connect(ground.p, plant.n) annotation (Line(points={{-50,-30},{-50,-20}},     color={0,0,255}));
    connect(weaDat.weaBus, HDifTil.weaBus) annotation (Line(
        points={{-80,80},{-70,80},{-60,80}},
        color={255,204,51},
        thickness=0.5));
    connect(weaDat.weaBus, HDirTil.weaBus) annotation (Line(
        points={{-80,80},{-70,80},{-70,50},{-60,50}},
        color={255,204,51},
        thickness=0.5));
    connect(mpTracker.vRef,converter. vDCRef) annotation (Line(points={{11,-60},{20,-60},{20,-22}}, color={0,0,127}));
    connect(converter.ac_n,groundAC. pin) annotation (Line(points={{30,-20},{30,-30},{70,-30}}, color={85,170,255}));
    connect(groundAC.pin,voltageSource. pin_n) annotation (Line(points={{70,-30},{70,-20}},          color={85,170,255}));
    connect(powerSensor.nc,converter. dc_p) annotation (Line(points={{-10,10},{-10,10},{10,10},{10,0}},
                                                                                                     color={0,0,255}));
    connect(mpTracker.power,powerSensor. power) annotation (Line(points={{-12,-60},{-12,-60},{-28,-60},{-28,-1}},
                                                                                                               color={0,0,127}));
    connect(powerSensor.pc,powerSensor. pv) annotation (Line(points={{-30,10},{-30,20},{-20,20}}, color={0,0,255}));
    connect(converter.ac_p,voltageSource. pin_p) annotation (Line(points={{30,0},{30,0},{30,10},{70,10},{70,0}},    color={85,170,255}));
    connect(plant.p, powerSensor.pc) annotation (Line(points={{-50,0},{-50,10},{-30,10}},     color={0,0,255}));
    connect(powerSensor.nv, ground.p) annotation (Line(points={{-20,0},{-20,0},{-20,-24},{-20,-30},{-50,-30}},               color={0,0,255}));
    connect(ground.p, converter.dc_n) annotation (Line(points={{-50,-30},{10,-30},{10,-20}}, color={0,0,255}));
    connect(integrator.u, powerSensor.power) annotation (Line(points={{-48,-60},{-48,-60},{-28,-60},{-28,-1}},  color={0,0,127}));
    connect(writeCSV.u, integrator.y) annotation (Line(points={{-78,-60},{-71,-60}}, color={0,0,127}));
    annotation (
      experiment(
        StopTime=3.1536e+07,
        Interval=60,
        Tolerance=1e-08,
        __Dymola_Algorithm="Rkfix4",
        __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS")),
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
  end TGM_Comax_WeatherData_OneYear;

  model TGM_Comax_Analytical_OneDay "This example illustrates how to use PV panel models"
    extends Modelica.Icons.Example;
    parameter Integer nsModule = 6 "Number of series connected modules";
    parameter Integer npModule = 1 "Number of parallel connected modules";

    PhotoVoltaics.Components.SimplePlantSymmetric plant(
      useConstantIrradiance=false,
      moduleData=moduleData,
      npModule=1,
      nsModule=6) annotation (Placement(visible=true, transformation(
          origin={-50,-10},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Electrical.Analog.Basic.Ground ground annotation (
      Placement(visible = true, transformation(origin={-50,-40},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter PhotoVoltaics.Records.TSM_200_DC01A
                                    moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));
    PhotoVoltaics.Components.SinglePhaseVoltageControlledConverter
                                                     converter annotation (Placement(transformation(extent={{10,-20},{30,0}})));
    PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(
      VmpRef=nsModule*moduleData.VmpRef,
      ImpRef=npModule*moduleData.ImpRef,
      samplePeriod=10)                   annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(
      f=50,
      V=230,
      phi=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-10})));
    Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
    Modelica.Blocks.Continuous.Integrator integrator(y(unit="J")) annotation (Placement(transformation(extent={{-50,-70},{-70,-50}})));
    PhotoVoltaics.Sources.Irradiance.Irradiance irradiance(startDay=29, startMonth=06) annotation (Placement(visible=true, transformation(
          origin={-90,-10},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    WriteCSV writeCSV(
      fileName=Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/TGM_Comax_Analytical_OneDay_power.csv"),
      samplePeriod=60,
      inputQuantity="power(W)") annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
  equation
    connect(ground.p, plant.n) annotation (Line(points={{-50,-30},{-50,-20}},     color={0,0,255}));
    connect(mpTracker.vRef,converter. vDCRef) annotation (Line(points={{11,-60},{20,-60},{20,-22}}, color={0,0,127}));
    connect(converter.ac_n,groundAC. pin) annotation (Line(points={{30,-20},{30,-30},{70,-30}}, color={85,170,255}));
    connect(groundAC.pin,voltageSource. pin_n) annotation (Line(points={{70,-30},{70,-30},{70,-20}}, color={85,170,255}));
    connect(powerSensor.nc,converter. dc_p) annotation (Line(points={{-10,10},{-10,10},{10,10},{10,0}},
                                                                                                     color={0,0,255}));
    connect(mpTracker.power,powerSensor. power) annotation (Line(points={{-12,-60},{-12,-60},{-28,-60},{-28,-1}},
                                                                                                               color={0,0,127}));
    connect(powerSensor.pc,powerSensor. pv) annotation (Line(points={{-30,10},{-30,20},{-20,20}}, color={0,0,255}));
    connect(converter.ac_p,voltageSource. pin_p) annotation (Line(points={{30,0},{30,0},{30,10},{70,10},{70,0}},    color={85,170,255}));
    connect(plant.p, powerSensor.pc) annotation (Line(points={{-50,0},{-50,10},{-30,10}},     color={0,0,255}));
    connect(powerSensor.nv, ground.p) annotation (Line(points={{-20,0},{-20,0},{-20,-24},{-20,-30},{-50,-30}},               color={0,0,255}));
    connect(ground.p, converter.dc_n) annotation (Line(points={{-50,-30},{10,-30},{10,-20}}, color={0,0,255}));
    connect(integrator.u, powerSensor.power) annotation (Line(points={{-48,-60},{-48,-60},{-28,-60},{-28,-1}},  color={0,0,127}));
    connect(irradiance.irradiance, plant.variableIrradiance) annotation (Line(points={{-79,-10},{-62,-10}}, color={0,0,127}));
    connect(writeCSV.u, powerSensor.power) annotation (Line(points={{-12,-90},{-28,-90},{-28,-1}}, color={0,0,127}));
    annotation (
      experiment(
        StopTime=86400,
        Interval=60,
        Tolerance=1e-08,
        __Dymola_Algorithm="Rkfix4"),
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
  end TGM_Comax_Analytical_OneDay;

  model TGM_Comax_Analytical_OneYear "This example illustrates how to use PV panel models"
    extends Modelica.Icons.Example;
    parameter Integer nsModule = 6 "Number of series connected modules";
    parameter Integer npModule = 1 "Number of parallel connected modules";

    PhotoVoltaics.Components.SimplePlantSymmetric plant(
      useConstantIrradiance=false,
      moduleData=moduleData,
      npModule=1,
      nsModule=6) annotation (Placement(visible=true, transformation(
          origin={-50,-10},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Electrical.Analog.Basic.Ground ground annotation (
      Placement(visible = true, transformation(origin={-50,-40},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter PhotoVoltaics.Records.TSM_200_DC01A
                                    moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));
    PhotoVoltaics.Components.SinglePhaseVoltageControlledConverter
                                                     converter annotation (Placement(transformation(extent={{10,-20},{30,0}})));
    PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(
      VmpRef=nsModule*moduleData.VmpRef,
      ImpRef=npModule*moduleData.ImpRef,
      samplePeriod=10)                   annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
    Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(
      f=50,
      V=230,
      phi=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-10})));
    Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
    Modelica.Blocks.Continuous.Integrator integrator(y(unit="J")) annotation (Placement(transformation(extent={{-50,-70},{-70,-50}})));
    PhotoVoltaics.Sources.Irradiance.Irradiance irradiance(startDay=01, startMonth=01) annotation (Placement(visible=true, transformation(
          origin={-90,-10},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    WriteCSV writeCSV(fileName=Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/TGM_Comax_Analytical_OneYear_energy.csv"), inputQuantity="energy(J)") annotation (Placement(transformation(extent={{-80,-70},{-100,-50}})));
  equation
    connect(ground.p, plant.n) annotation (Line(points={{-50,-30},{-50,-20}},     color={0,0,255}));
    connect(mpTracker.vRef,converter. vDCRef) annotation (Line(points={{11,-60},{20,-60},{20,-22}}, color={0,0,127}));
    connect(converter.ac_n,groundAC. pin) annotation (Line(points={{30,-20},{30,-30},{70,-30}}, color={85,170,255}));
    connect(groundAC.pin,voltageSource. pin_n) annotation (Line(points={{70,-30},{70,-30},{70,-20}}, color={85,170,255}));
    connect(powerSensor.nc,converter. dc_p) annotation (Line(points={{-10,10},{-10,10},{10,10},{10,0}},
                                                                                                     color={0,0,255}));
    connect(mpTracker.power,powerSensor. power) annotation (Line(points={{-12,-60},{-12,-60},{-28,-60},{-28,-1}},
                                                                                                               color={0,0,127}));
    connect(powerSensor.pc,powerSensor. pv) annotation (Line(points={{-30,10},{-30,20},{-20,20}}, color={0,0,255}));
    connect(converter.ac_p,voltageSource. pin_p) annotation (Line(points={{30,0},{30,0},{30,10},{70,10},{70,0}},    color={85,170,255}));
    connect(plant.p, powerSensor.pc) annotation (Line(points={{-50,0},{-50,10},{-30,10}},     color={0,0,255}));
    connect(powerSensor.nv, ground.p) annotation (Line(points={{-20,0},{-20,0},{-20,-24},{-20,-30},{-50,-30}},               color={0,0,255}));
    connect(ground.p, converter.dc_n) annotation (Line(points={{-50,-30},{10,-30},{10,-20}}, color={0,0,255}));
    connect(integrator.u, powerSensor.power) annotation (Line(points={{-48,-60},{-48,-60},{-28,-60},{-28,-1}},  color={0,0,127}));
    connect(irradiance.irradiance, plant.variableIrradiance) annotation (Line(points={{-79,-10},{-62,-10}}, color={0,0,127}));
    connect(writeCSV.u, integrator.y) annotation (Line(points={{-78,-60},{-71,-60}}, color={0,0,127}));
    annotation (
      experiment(
        StopTime=3.1536e+07,
        Interval=60,
        Tolerance=1e-08,
        __Dymola_Algorithm="Rkfix4",
        __OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS")),
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
  end TGM_Comax_Analytical_OneYear;

  model WriteCSV
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter String fileName=Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/time_energy.csv");
    parameter String inputQuantity="energy(J)" "Header to be written to CSV file";
    parameter Modelica.SIunits.Time startTime = 0 "Start time";
    parameter Modelica.SIunits.Time samplePeriod = 86400 "Sample time (86400s = 1d)";
    output Boolean sampleTrigger "True, if sample time instant";
    output Boolean firstTrigger(start=false, fixed=true) "Rising edge signals first sample instant";
    Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  algorithm

    sampleTrigger :=sample(startTime, samplePeriod);
    when sampleTrigger then
      firstTrigger :=time <= startTime + samplePeriod/2;
      if firstTrigger then
        Modelica.Utilities.Files.remove(fileName);
        Modelica.Utilities.Streams.print("time(s)\t"+inputQuantity,fileName);
        Modelica.Utilities.Streams.print(String(time)+"\t"+String(u),fileName);
      else
        Modelica.Utilities.Streams.print(String(time)+"\t"+String(u),fileName);
      end if;
    end when;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false),graphics={Text(
            extent={{-60,-60},{60,60}},
            lineColor={0,0,0},
            textString="CSV"),Text(
            extent={{-150,-150},{150,-110}},
            lineColor={0,0,255},
            textString="%inputQuantity")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end WriteCSV;
  annotation (
    version="0.X.X",
    versionBuild=1,
    versionDate="2017-XX-XX",
    uses(Modelica(version="3.2.2"),Buildings(version="4.0.0"),
      PhotoVoltaics(version="0.X.X")),
    Documentation(info="<html>
<p>This library is based on the 
<a href=\"https://github.com/christiankral/PhotoVoltaics\">PhotoVoltaics</a> and the 
<a href=\"https://github.com/lbl-srg/modelica-buildings\">Buildings</a> 
library.</p></html>"));
end PhotoVoltaics_TGM;
