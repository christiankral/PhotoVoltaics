within PhotoVoltaics.Functions;
function rad
  input Real deg "Angle in degree";
  output Real rad "Angle in rad";
algorithm
  rad := deg * Modelica.Constants.pi / 180;
end rad;
