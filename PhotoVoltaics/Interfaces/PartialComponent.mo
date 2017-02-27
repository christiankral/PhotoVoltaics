within PhotoVoltaics.Interfaces;
partial model PartialComponent "Partial cell or module"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(T = 298.15);
  parameter Boolean useConstantIrradiance = true "If false, signal input is used" annotation (
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
  parameter Modelica.SIunits.Irradiance constantIrradiance = 1000 "Constant solar irradiance, if useConstantIrradiance = true" annotation (
    Dialog(enable = useConstantIrradiance));
  parameter Records.ModuleData moduleData "Module parameters" annotation (
    choicesAllMatching = true,
    Placement(transformation(extent = {{60, 60}, {80, 80}})));
  Modelica.SIunits.Current i = p.i "Current";
  Modelica.SIunits.Current iGenerating = -i "Negative current (generating)";
  Modelica.SIunits.Power power = v * i "Power";
  Modelica.SIunits.Power powerGenerating = v * iGenerating "Negative power consumption (generating)";
  Modelica.Blocks.Interfaces.RealInput variableIrradiance(unit = "W/m2") if not useConstantIrradiance "Solar irradiance" annotation (
    Placement(transformation(extent = {{20, -20}, {-20, 20}}, rotation = 90, origin = {0, 120}), iconTransformation(extent = {{20, -20}, {-20, 20}}, rotation = 90, origin = {0, 120})));
  Modelica.Blocks.Sources.Constant const(final k = constantIrradiance) if useConstantIrradiance annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-30, 80})));
protected
  Modelica.Blocks.Interfaces.RealInput irradiance(unit = "W/m2") "Solar irradiance (either constant or signal input)" annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, 70})));
equation
  connect(irradiance, variableIrradiance) annotation (
    Line(points = {{0, 70}, {0, 70}, {0, 120}}, color = {0, 0, 127}));
  connect(const.y, irradiance) annotation (
    Line(points = {{-19, 80}, {-20, 80}, {-20, 80}, {0, 80}, {0, 80}, {0, 70}, {0, 70}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info="<html>
<p>This partial model contains the connectors and some parameters of photovoltaic components. Interfaces voltages,
currents and power terms are defined.</p>
</html>"));
end PartialComponent;
