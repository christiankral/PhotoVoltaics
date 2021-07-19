within PhotoVoltaics.Interfaces;
partial model PartialDiode "Diode with one exponential function"
  extends Modelica.Electrical.Analog.Interfaces.OnePort(v(start = 0));
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
  constant Modelica.Units.SI.Charge Q=1.6021766208E-19
    "Elementary charge of electron";
  parameter Real m = 1 "Ideality factor of diode";
  parameter Modelica.Units.SI.Resistance R=1E8 "Parallel ohmic resistance";
  parameter Modelica.Units.SI.Temperature TRef=298.15 "Reference temperature"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.Voltage VRef(min=Modelica.Constants.small) =
    0.6292 "Reference voltage > 0, i.e. open circuit voltage, at TRef"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.Current IRef(min=Modelica.Constants.small) =
    8.540 "Reference current > 0, i.e. short circuit current, at TRef"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alphaI=+0.00053
    "Temperature coefficient of reference current at TRef"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alphaV=-0.00340
    "Temperature coefficient of reference voltage at TRef*"
    annotation (Dialog(group="Reference data"));
  Modelica.Units.SI.Voltage Vt "Voltage equivalent of temperature (k*T/Q)";
  Modelica.Units.SI.Voltage VRefActual
    "Reference voltage w.r.t. actual temperature";
  Modelica.Units.SI.Current IRefActual
    "Reference current w.r.t. actual temperature";
  Modelica.Units.SI.Current Ids "Saturation current";
equation
  // Temperature dependent voltage
  Vt = Modelica.Constants.k * T_heatPort / Q;
  // Re-calculate reference voltage and current with respect to reference temperature
  VRefActual = VRef * (1 + alphaV * (T_heatPort - TRef));
  IRefActual = IRef * (1 + alphaI * (T_heatPort - TRef));
  // Actual temperature dependent saturation current is determined from reference voltage and current
  Ids = IRefActual / (exp(VRefActual / m / Vt) - 1);
  LossPower = v * i;
  annotation (
    defaultComponentName = "diode",
    Documentation(info="<html>
<p>This partial model of the diode does not yet contain any current versus voltage characteristic. In this model the
temperature dependencies of the temperature voltage, the saturation current, etc. are defined.</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end PartialDiode;
