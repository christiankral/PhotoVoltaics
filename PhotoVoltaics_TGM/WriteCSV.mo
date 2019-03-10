within PhotoVoltaics_TGM;
block WriteCSV "Simple block to write CSV files with one time and data column"
  extends Modelica.Blocks.Icons.Block;
  parameter String fileName = Modelica.Utilities.Files.loadResource("modelica://PhotoVoltaics/time_energy.csv");
  parameter String inputQuantity = "energy(Ws)" "Header to be written to CSV file";
  parameter String delimiter = "\t" "Delimiter";
  parameter Modelica.SIunits.Time startTime = 0 "Start time";
  parameter Modelica.SIunits.Time samplePeriod = 86400 "Sample time (86400s = 1d)";
  output Boolean sampleTrigger "True, if sample time instant";
  output Boolean firstTrigger(start = false, fixed = true) "Rising edge signals first sample instant";
  Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
algorithm
  sampleTrigger := sample(startTime, samplePeriod);
  when sampleTrigger then
    firstTrigger := time <= startTime + samplePeriod / 2;
    if firstTrigger then
      Modelica.Utilities.Files.remove(fileName);
      Modelica.Utilities.Streams.print("time(s)" + delimiter + inputQuantity, fileName);
      Modelica.Utilities.Streams.print(String(time) + delimiter + String(u), fileName);
    else
      Modelica.Utilities.Streams.print(String(time) + delimiter + String(u), fileName);
    end if;
  end when;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(extent = {{-60, -60}, {60, 60}}, lineColor = {0, 0, 0}, textString = "CSV"), Text(extent = {{-150, -150}, {150, -110}}, lineColor = {0, 0, 255}, textString = "%inputQuantity")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info="<html>
<p>The sampled input data of this blocks are written to a CSV file.</p>
</html>"));
end WriteCSV;
