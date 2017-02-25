within PhotoVoltaics.Interfaces;
partial model PartialCell "Partial cell model"
  extends PhotoVoltaics.Interfaces.PartialComponent;
  parameter Real shadow = 0 "Shadow based on: 0 = full sun, 1 = full shadow";
  PhotoVoltaics.Components.Diodes.Diode2Module diode(final useHeatPort = useHeatPort, final T = T, final TRef = moduleData.TRef) annotation (
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Sources.Electrical.SignalCurrent signalCurrent(final useHeatPort = useHeatPort, final T = T, final TRef = moduleData.TRef) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
Modelica.Blocks.Math.Gain gain(final k=PhotoVoltaics.Functions.limit(1-shadow,0,1)) annotation (
    Placement(visible = true, transformation(origin = {0, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(gain.y, signalCurrent.irradiance) annotation (
    Line(points={{0,21},{0,21},{0,7},{0,7}},          color = {0, 0, 127}));
  connect(irradiance, gain.u) annotation (
    Line(points = {{0, 70}, {0, 70}, {0, 44}, {0, 44}}, color = {0, 0, 127}));
  connect(signalCurrent.p, n) annotation (
    Line(points = {{10, 0}, {100, 0}, {100, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(p, signalCurrent.n) annotation (
    Line(points = {{-100, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(diode.p, signalCurrent.n) annotation (
    Line(points = {{-10, -30}, {-20, -30}, {-20, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(signalCurrent.heatPort, internalHeatPort) annotation (
    Line(points = {{0, -10}, {-100, -10}, {-100, -80}}, color = {191, 0, 0}));
  connect(diode.n, signalCurrent.p) annotation (
    Line(points = {{10, -30}, {20, -30}, {20, 0}, {15, 0}, {15, 0}, {10, 0}}, color = {0, 0, 255}));
  connect(diode.heatPort, internalHeatPort) annotation (
    Line(points = {{0, -40}, {-100, -40}, {-100, -80}}, color = {191, 0, 0}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false)));
end PartialCell;
