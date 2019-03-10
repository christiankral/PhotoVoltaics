within PhotoVoltaics_TGM;
model TGM_Trina_Measurement_20160808 "Measured irradiance model on 2016-08-08; Trina modules at TGM building in Vienna, Austria"
  extends Modelica.Icons.Example;
  parameter Integer nsModule = 8 "Number of series connected modules";
  parameter Integer npModule = 1 "Number of parallel connected modules";
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/Resources/WeatherData/TGM_Trina_20160808.txt") "File name";
  parameter String csvFileName = "TGM_Trina_Measurement_20160808_power.csv";
  Modelica.SIunits.Irradiance irradiance = combiTimeTable.y[1] "Measured irradiance";
  Modelica.SIunits.Power powerAC = combiTimeTable.y[2] "Measured AC power";
  Modelica.SIunits.Voltage VAC = combiTimeTable.y[3] "Measured AC voltage";
  Modelica.SIunits.Current IAC = combiTimeTable.y[4] "Measured AC current";
  Modelica.SIunits.Power powerDC = combiTimeTable.y[5] "Measured DC power";
  Modelica.SIunits.Voltage VDC = combiTimeTable.y[6] "Measured DC voltage";
  Modelica.SIunits.Current IDC = combiTimeTable.y[7] "Measured DC current";
  Modelica.SIunits.Temperature T1 = combiTimeTable.y[8] "Temperature of ambient";
  Modelica.SIunits.Temperature T2 = combiTimeTable.y[9] "Temperature of PV modules";
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimplePlantSymmetric plant(
    moduleData=moduleData,
    npModule=npModule,
    nsModule=nsModule,
    useConstantIrradiance=false,
    useHeatPort=false,
    shadow=0.1) annotation (Placement(visible=true, transformation(
        origin={-50,-10},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.Converters.QuasiStaticSinglePhaseConverter converter annotation (
    Placement(transformation(extent = {{10, -20}, {30, 0}})));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(VmpRef = nsModule * moduleData.VmpRef, ImpRef = npModule * moduleData.ImpRef, samplePeriod = 10) annotation (
    Placement(transformation(extent = {{-10, -70}, {10, -50}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
    Placement(transformation(extent = {{60, -50}, {80, -30}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(f = 50, V = 230, phi = 0,
    gamma(start=0, fixed=true))                                                                                 annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {70, -10})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent = {{-30, 0}, {-10, 20}})));
  Modelica.Blocks.Continuous.Integrator integrator(y(unit = "J")) annotation (
    Placement(transformation(extent = {{-50, -70}, {-70, -50}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(tableOnFile = true, tableName = "trina", fileName = fileName, columns = 2:10) annotation (
    Placement(transformation(extent = {{-100, -20}, {-80, 0}})));
  PhotoVoltaics_TGM.WriteCSV writeCSV(samplePeriod = 60, inputQuantity = "power(W)", fileName = csvFileName) annotation (
    Placement(transformation(extent = {{-10, -100}, {10, -80}})));
  parameter PhotoVoltaics.Records.TSM_230_PC05 moduleData annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground.p, plant.n) annotation (
    Line(points = {{-50, -30}, {-50, -20}}, color = {0, 0, 255}));
  connect(mpTracker.vRef, converter.vDCRef) annotation (
    Line(points={{11,-60},{14,-60},{14,-22}},        color = {0, 0, 127}));
  connect(converter.ac_n, groundAC.pin) annotation (
    Line(points = {{30, -20}, {30, -30}, {70, -30}}, color = {85, 170, 255}));
  connect(groundAC.pin, voltageSource.pin_n) annotation (
    Line(points = {{70, -30}, {70, -30}, {70, -20}}, color = {85, 170, 255}));
  connect(powerSensor.nc, converter.dc_p) annotation (
    Line(points={{-10,10},{-10,10},{10,10},{10,-4}},         color = {0, 0, 255}));
  connect(mpTracker.power, powerSensor.power) annotation (
    Line(points={{-12,-60},{-12,-60},{-30,-60},{-30,-1}},          color = {0, 0, 127}));
  connect(powerSensor.pc, powerSensor.pv) annotation (
    Line(points = {{-30, 10}, {-30, 20}, {-20, 20}}, color = {0, 0, 255}));
  connect(converter.ac_p, voltageSource.pin_p) annotation (
    Line(points = {{30, 0}, {30, 0}, {30, 10}, {70, 10}, {70, 0}}, color = {85, 170, 255}));
  connect(plant.p, powerSensor.pc) annotation (
    Line(points = {{-50, 0}, {-50, 10}, {-30, 10}}, color = {0, 0, 255}));
  connect(powerSensor.nv, ground.p) annotation (
    Line(points = {{-20, 0}, {-20, 0}, {-20, -24}, {-20, -30}, {-50, -30}}, color = {0, 0, 255}));
  connect(ground.p, converter.dc_n) annotation (
    Line(points={{-50,-30},{10,-30},{10,-16}},        color = {0, 0, 255}));
  connect(integrator.u, powerSensor.power) annotation (
    Line(points={{-48,-60},{-48,-60},{-30,-60},{-30,-1}},          color = {0, 0, 127}));
  connect(writeCSV.u, powerSensor.power) annotation (
    Line(points={{-12,-90},{-30,-90},{-30,-1}},        color = {0, 0, 127}));
  connect(combiTimeTable.y[1], plant.variableIrradiance) annotation (
    Line(points = {{-79, -10}, {-62, -10}}, color = {0, 0, 127}));
  annotation (
    experiment(StopTime = 86400, Interval = 60, Tolerance = 1e-08, __Dymola_Algorithm = "Rkfix4"),
    Documentation(revisions = "<html>
</html>",
        info="<html>
<p>This example uses measured irradiance data to supply the photovoltaic modules.</p>
</html>"));
end TGM_Trina_Measurement_20160808;
