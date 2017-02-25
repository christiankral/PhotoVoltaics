within PhotoVoltaics.Interfaces;
partial model PartialDiode "Diode with one exponential function"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
  constant Modelica.SIunits.Charge Q = 1.6021766208E-19 "Elementary charge of electron";
  parameter Real m = 1 "Ideality factor of diode";
  parameter Modelica.SIunits.Resistance R = 1E8 "Parallel ohmic resistance";
  parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature" annotation (
    Dialog(group = "Reference data"));
  parameter Modelica.SIunits.Voltage VRef(min = Modelica.Constants.small) = 0.6292 "Reference voltage > 0 at TRef" annotation (
    Dialog(group = "Reference data"));
  parameter Modelica.SIunits.Current IRef(min = Modelica.Constants.small) = 8.540 "Reference current > 0 at TRef" annotation (
    Dialog(group = "Reference data"));
  parameter Modelica.SIunits.LinearTemperatureCoefficient alphaI = +0.00053 "Temperature coefficient of reference current at TRef" annotation (
    Dialog(group = "Reference data"));
  parameter Modelica.SIunits.LinearTemperatureCoefficient alphaV = -0.00340 "Temperature coefficient of reference voltage at TRef*" annotation (
    Dialog(group = "Reference data"));
  Modelica.SIunits.Voltage Vt "Voltage equivalent of temperature (k*T/Q)";
  Modelica.SIunits.Voltage VRefActual "Reference voltage w.r.t. actual temperature";
  Modelica.SIunits.Current IRefActual "Reference current w.r.t. actual temperature";
  Modelica.SIunits.Current Ids "Saturation current";
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
    Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
end PartialDiode;
