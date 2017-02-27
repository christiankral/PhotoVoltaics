within PhotoVoltaics.Functions;
function degree
  input Real rad "Angle in rad";
  output Real degree "Angle in degree";
algorithm
  degree := rad * 180 / Modelica.Constants.pi;
  annotation (Documentation(info="<html>
<p>Converter angle in rad to angle in degree.</p>
</html>"));
end degree;
