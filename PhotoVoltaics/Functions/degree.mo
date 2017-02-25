within PhotoVoltaics.Functions;
function degree
  input Real rad "Angle in rad";
  output Real degree "Angle in degree";
algorithm
  degree := rad * 180 / Modelica.Constants.pi;
end degree;
