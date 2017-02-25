within PhotoVoltaics.Icons;
partial model MPTrackerSmall "MP tracker small"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                     Line(points={{-34,-34},{-10,4},{14,30},{32,30},{36,-32}},                                                     color = {0, 0, 0}, smooth = Smooth.Bezier), Ellipse(extent={{14,36},{26,24}},      fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, pattern = LinePattern.None)}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end MPTrackerSmall;
