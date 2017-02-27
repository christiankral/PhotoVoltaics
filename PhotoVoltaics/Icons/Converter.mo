within PhotoVoltaics.Icons;
partial model Converter "Converter icon"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={                                                                                                        Line(points = {{-100, -100}, {100, 100}}, color = {0, 0, 127}, smooth = Smooth.None),
                                                                                                         Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}),                                                                                                                                                                                                        Text(extent={{-150,150},{150,110}},      lineColor = {0, 0, 255}, textString = "%name")}),
                                                                                                                                                                                    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This partial model provides a converter icon.</p>
</html>"));
end Converter;
