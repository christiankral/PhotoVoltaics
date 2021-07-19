within PhotoVoltaics.Sources.Electrical;
model VariableUnrootedSinglePhaseCurrentSource "Unrooted variable polyphase AC current source"
  extends Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.OnePort;
  import Modelica.Constants.pi;
  Modelica.ComplexBlocks.Interfaces.ComplexInput I annotation (
    Placement(transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
equation
  i = I;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-60, 60}, {60, 60}}, color = {85, 170, 255}), Polygon(points = {{60, 60}, {30, 70}, {30, 50}, {60, 60}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 0}), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 0}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 0}),                                                                                                         Text(extent={{-150,-100},{150,-140}},    lineColor = {0, 0, 255}, textString = "%name")}),
    Documentation(info = "<html>
<p>
This model represents an ideal current source specifying the complex RMS current without root.
</p>
</html>"));
end VariableUnrootedSinglePhaseCurrentSource;
