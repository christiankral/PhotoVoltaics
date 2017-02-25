within PhotoVoltaics.ComponentTesting;
model TestIrradiance "Testing irradiance model"
  extends Modelica.Icons.Example;
  PhotoVoltaics.Sources.Irradiance.Irradiance irradiance(startMonth = 12, startDay = 30) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(y(unit = "J/m2")) annotation (
    Placement(transformation(extent = {{20, -10}, {40, 10}})));
equation
  connect(irradiance.irradiance, integrator.u) annotation (
    Line(points = {{11, 0}, {14.5, 0}, {18, 0}}, color = {0, 0, 127}));
  annotation (
    experiment(StopTime = 3.1536e+07, Interval = 60, Tolerance = 1e-06));
end TestIrradiance;
