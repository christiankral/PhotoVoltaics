within PhotoVoltaics.Components.SimplePhotoVoltaics;
model SimpleModule "Simple module consisting of series connected cells"
  extends .PhotoVoltaics.Interfaces.PartialComponent;
  parameter Real shadow[moduleData.ns] = zeros(moduleData.ns) "Shadow vector based on: 0 = full sun, 1 = full shadow";
  SimpleCell cell[moduleData.ns](
    final useHeatPort=fill(useHeatPort, moduleData.ns),
    final T=fill(T, moduleData.ns),
    final constantIrradiance=fill(constantIrradiance, moduleData.ns),
    final moduleData=fill(moduleData, moduleData.ns),
    final useConstantIrradiance=fill(false, moduleData.ns),
    final shadow=shadow) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector collectorModule(final m = moduleData.ns) if useHeatPort annotation (
    Placement(transformation(extent = {{-10, -60}, {10, -40}})));
  Diodes.Diode diode[moduleData.nb](final useHeatPort = fill(useHeatPort, moduleData.nb), final T = fill(T, moduleData.nb), final m = fill(1, moduleData.nb), final R = fill(1E8, moduleData.nb), final TRef = fill(moduleData.TRef, moduleData.nb), final IRef = fill(moduleData.IscRef, moduleData.nb), final alphaI = fill(0, moduleData.nb), final alphaV = fill(0, moduleData.nb), final VRef = fill(0.5, moduleData.nb)) annotation (
    Placement(transformation(extent = {{-20, -30}, {-40, -10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector collectorByPass(final m = moduleData.nb) if useHeatPort annotation (
    Placement(transformation(extent = {{-40, -60}, {-20, -40}})));
  Modelica.Blocks.Routing.Replicator replicator(final nout=moduleData.ns) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,40})));

equation
  assert(mod(moduleData.ns, moduleData.nb) == 0, "Simple: number of bypassed cells cannot be determined unambiguously");
  // Connect cells to module
  connect(p, cell[1].p) annotation (
    Line(points = {{-100, 0}, {-100, 0}, {-10, 0}}, color = {0, 0, 255}));
  for k in 1:moduleData.ns - 1 loop
    connect(cell[k].n, cell[k + 1].p);
  end for;
  // Inter-module connections
  connect(cell[moduleData.ns].n, n) annotation (
    Line(points = {{10, 0}, {100, 0}}, color = {0, 0, 255}));
  connect(cell.heatPort, collectorModule.port_a) annotation (
    Line(points = {{-10, -10}, {-10, -18}, {-10, -30}, {0, -30}, {0, -40}}, color = {191, 0, 0}));
  connect(collectorModule.port_b, heatPort) annotation (
    Line(points = {{0, -60}, {0, -100}, {-100, -100}}, color = {191, 0, 0}));
  // Connect bypass diodes
  for k in 1:moduleData.nb loop
    connect(diode[k].n, cell[(k - 1) * div(moduleData.ns, moduleData.nb) + 1].p) annotation (
      Line(points = {{-40, -20}, {-50, -20}, {-60, -20}, {-60, 0}, {-10, 0}}, color = {0, 0, 255}));
    connect(diode[k].p, cell[k * div(moduleData.ns, moduleData.nb)].n) annotation (
      Line(points = {{-20, -20}, {20, -20}, {60, -20}, {60, 0}, {10, 0}}, color = {0, 0, 255}));
  end for;
  connect(collectorByPass.port_a, diode.heatPort) annotation (
    Line(points = {{-30, -40}, {-30, -30}}, color = {191, 0, 0}));
  connect(collectorByPass.port_b, heatPort) annotation (
    Line(points = {{-30, -60}, {-30, -60}, {-30, -96}, {-30, -100}, {-100, -100}}, color = {191, 0, 0}));
  connect(irradiance, replicator.u) annotation (Line(points={{0,70},{0,70},{0,52}}, color={0,0,127}));
  connect(replicator.y, cell.variableIrradiance) annotation (Line(points={{0,29},{0,20.5},{0,12}}, color={0,0,127}));
  annotation (
    defaultComponentName = "module",
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {0, 0, 0},
            fillPattern =                                                                                          FillPattern.VerticalCylinder, extent = {{-76, 76}, {76, -76}}, fillColor = {85, 85, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {255, 255, 255}), Rectangle(extent = {{-84, 84}, {84, -84}}, lineColor = {0, 0, 0}), Polygon(points = {{-84, 76}, {-76, 84}, {-68, 76}, {-76, 68}, {-84, 76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-24, 76}, {-24, -76}}, color = {255, 255, 255}), Polygon(points = {{-8, 76}, {0, 84}, {8, 76}, {0, 68}, {-8, 76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 76}, {76, 84}, {84, 76}, {76, 68}, {68, 76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 0}, {76, 8}, {84, 0}, {76, -8}, {68, 0}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, -76}, {76, -68}, {84, -76}, {76, -84}, {68, -76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, -76}, {-76, -68}, {-68, -76}, {-76, -84}, {-84, -76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-54, 76}, {-54, -76}}, color = {255, 255, 255}), Polygon(points = {{-84, 0}, {-76, 8}, {-68, 0}, {-76, -8}, {-84, 0}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, 0}, {0, 8}, {8, 0}, {0, -8}, {-8, 0}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, -76}, {0, -68}, {8, -76}, {0, -84}, {-8, -76}}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{0, 76}, {0, -76}}, color = {255, 255, 255}), Line(points = {{24, 76}, {24, -76}}, color = {255, 255, 255}), Line(points = {{54, 76}, {54, -76}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}));
end SimpleModule;
