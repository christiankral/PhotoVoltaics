within PhotoVoltaics.Functions;

function exlin "Exponential function linearly continued for x > Maxexp"
  extends Modelica.Icons.Function;
  input Real x;
  input Real Maxexp;
  output Real z;
algorithm
  z := if x > Maxexp then exp(Maxexp)*(1 + x - Maxexp) else exp(x);
end exlin;