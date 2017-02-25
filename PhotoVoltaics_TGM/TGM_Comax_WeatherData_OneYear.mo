within PhotoVoltaics_TGM;
model TGM_Comax_WeatherData_OneYear "One year based on real weather data; Comax modules at TGM building in Vienna, Austria"
  extends Modelica.Icons.Example;
  parameter Integer nsModule = 6 "Number of series connected modules";
  parameter Integer npModule = 1 "Number of parallel connected modules";
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/Resources/WeatherData/AUT_Vienna.Schwechat.110360_IWEC.mos") "File name";
  parameter String csvFileName = Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/TGM_Comax_WeatherData_2016_energy.csv");
  Buildings.BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil(til = 0.17453292519943, lat = 0.84264496286286, azi = 0) "Diffuse irradiation on tilted surface" annotation (
    Placement(visible = true, transformation(extent = {{-60, 70}, {-40, 90}}, rotation = 0)));
  Buildings.BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil(til = 0.17453292519943, lat = 0.84264496286286, azi = 0) "Direct irradiation on tilted surface" annotation (
    Placement(visible = true, transformation(extent = {{-60, 40}, {-40, 60}}, rotation = 0)));
  Modelica.Blocks.Math.Add G "Total irradiation on tilted surface" annotation (
    Placement(visible = true, transformation(extent = {{-20, 50}, {0, 70}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimplePlantSymmetric plant(
    useConstantIrradiance=false,
    moduleData=moduleData,
    npModule=npModule,
    nsModule=nsModule,
    shadow=0.1) annotation (Placement(visible=true, transformation(
        origin={-50,-10},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter PhotoVoltaics.Records.TSM_200_DC01A moduleData annotation (
    Placement(transformation(extent = {{60, 60}, {80, 80}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(computeWetBulbTemperature = false, filNam = fileName) annotation (
    Placement(transformation(extent = {{-100, 70}, {-80, 90}})));
  PhotoVoltaics.Components.Converters.QuasiStaticSinglePhaseConverter converter annotation (
    Placement(transformation(extent = {{10, -20}, {30, 0}})));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(VmpRef = nsModule * moduleData.VmpRef, ImpRef = npModule * moduleData.ImpRef, samplePeriod = 60) annotation (
    Placement(transformation(extent = {{-10, -70}, {10, -50}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
    Placement(transformation(extent = {{60, -50}, {80, -30}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(f = 50, V = 230, phi = 0) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {70, -10})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent = {{-30, 0}, {-10, 20}})));
  Modelica.Blocks.Continuous.Integrator integrator(y(unit = "J")) annotation (
    Placement(transformation(extent = {{-50, -70}, {-70, -50}})));
  PhotoVoltaics_TGM.WriteCSV writeCSV(inputQuantity = "energy(Ws)", fileName = csvFileName) annotation (
    Placement(transformation(extent = {{-80, -70}, {-100, -50}})));
equation
  connect(HDirTil.H, G.u2) annotation (
    Line(points = {{-39, 50}, {-30, 50}, {-30, 54}, {-22, 54}}, color = {0, 0, 127}));
  connect(HDifTil.H, G.u1) annotation (
    Line(points = {{-39, 80}, {-30, 80}, {-30, 66}, {-22, 66}}, color = {0, 0, 127}));
  connect(G.y, plant.variableIrradiance) annotation (
    Line(points = {{1, 60}, {10, 60}, {10, 30}, {-70, 30}, {-70, -10}, {-62, -10}}, color = {0, 0, 127}));
  connect(ground.p, plant.n) annotation (
    Line(points = {{-50, -30}, {-50, -20}}, color = {0, 0, 255}));
  connect(weaDat.weaBus, HDifTil.weaBus) annotation (
    Line(points = {{-80, 80}, {-70, 80}, {-60, 80}}, color = {255, 204, 51}, thickness = 0.5));
  connect(weaDat.weaBus, HDirTil.weaBus) annotation (
    Line(points = {{-80, 80}, {-70, 80}, {-70, 50}, {-60, 50}}, color = {255, 204, 51}, thickness = 0.5));
  connect(mpTracker.vRef, converter.vDCRef) annotation (
    Line(points = {{11, -60}, {20, -60}, {20, -22}}, color = {0, 0, 127}));
  connect(converter.ac_n, groundAC.pin) annotation (
    Line(points = {{30, -20}, {30, -30}, {70, -30}}, color = {85, 170, 255}));
  connect(groundAC.pin, voltageSource.pin_n) annotation (
    Line(points = {{70, -30}, {70, -20}}, color = {85, 170, 255}));
  connect(powerSensor.nc, converter.dc_p) annotation (
    Line(points = {{-10, 10}, {-10, 10}, {10, 10}, {10, 0}}, color = {0, 0, 255}));
  connect(mpTracker.power, powerSensor.power) annotation (
    Line(points = {{-12, -60}, {-12, -60}, {-28, -60}, {-28, -1}}, color = {0, 0, 127}));
  connect(powerSensor.pc, powerSensor.pv) annotation (
    Line(points = {{-30, 10}, {-30, 20}, {-20, 20}}, color = {0, 0, 255}));
  connect(converter.ac_p, voltageSource.pin_p) annotation (
    Line(points = {{30, 0}, {30, 0}, {30, 10}, {70, 10}, {70, 0}}, color = {85, 170, 255}));
  connect(plant.p, powerSensor.pc) annotation (
    Line(points = {{-50, 0}, {-50, 10}, {-30, 10}}, color = {0, 0, 255}));
  connect(powerSensor.nv, ground.p) annotation (
    Line(points = {{-20, 0}, {-20, 0}, {-20, -24}, {-20, -30}, {-50, -30}}, color = {0, 0, 255}));
  connect(ground.p, converter.dc_n) annotation (
    Line(points = {{-50, -30}, {10, -30}, {10, -20}}, color = {0, 0, 255}));
  connect(integrator.u, powerSensor.power) annotation (
    Line(points = {{-48, -60}, {-48, -60}, {-28, -60}, {-28, -1}}, color = {0, 0, 127}));
  connect(writeCSV.u, integrator.y) annotation (
    Line(points = {{-78, -60}, {-71, -60}}, color = {0, 0, 127}));
  annotation (
    experiment(StopTime = 3.1536e+07, Interval = 900, Tolerance = 1e-08, __Dymola_Algorithm = "Rkfix4"),
    Documentation(revisions = "<html>
</html>",
        info = "<html>
<p>This example is based on weather data taken from 
<a href=\"https://energyplus.net/weather-location/europe_wmo_region_6/AUT//AUT_Vienna.Schwechat.110360_IWEC\">https://energyplus.net</a>. 
The EPW file was converted using a Java script provided by the 
<a href=\"https://github.com/lbl-srg/modelica-buildings\">Buildings</a> library.</p>
<p><code>
java -jar .../Buildings/Resources/bin/ConvertWeatherData.jar .../PhotoVoltaics/Resources/WeatherData/AUT_Vienna.Schwechat.110360_IWEC.epw
</code></p>

</html>"));
end TGM_Comax_WeatherData_OneYear;
