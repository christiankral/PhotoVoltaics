within PhotoVoltaics.Functions;
function limit "Limit input u by uMin and uMax"
  extends Modelica.Icons.Function;
  input Real u "Input to be limited";
  input Real uMin "Minimum of input";
  input Real uMax "Maximum of input";
  output Real y "Limited input";
algorithm
  y := if u > uMax then uMax else if u < uMin then uMin else u;
  annotation (Documentation(info="<html>
<p>Limit input by lower and upper limit</p>
</html>"));
end limit;
