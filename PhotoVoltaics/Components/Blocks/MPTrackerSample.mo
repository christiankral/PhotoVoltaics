within PhotoVoltaics.Components.Blocks;
block MPTrackerSample "Sampling maximum power tracker"
  extends Modelica.Blocks.Icons.Block;
  parameter Modelica.SIunits.Time startTime = 0 "Start time";
  parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
  parameter Modelica.SIunits.Voltage VmpRef "Reference maximum power power of plant";
  parameter Modelica.SIunits.Current ImpRef "Reference maximum power current of plant";
  parameter Integer n = 100 "Number of voltage and power discretizations";
  final parameter Modelica.SIunits.Voltage dv = VmpRef / n "Voltage change and maximum deviation";
  final parameter Modelica.SIunits.Power dpower = VmpRef * ImpRef / n "Power change and maximum deviation";
  Boolean firstTrigger "First boolean sample trigger signal";
  // Boolean secondTrigger "Second boolean sample trigger signal";
  Boolean sampleTrigger "Boolean sample trigger signal";
  discrete Integer counter(final start = 0, fixed = true) "Sample counter";
  discrete Real signv(final start = -1, fixed = true) "Sign of voltage change";
  Modelica.Blocks.Interfaces.RealInput power(final unit = "W") "Power" annotation (
    Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput vRef(final unit = "V", final start = VmpRef, fixed = true) "Reference DC voltage" annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
algorithm
  sampleTrigger := sample(startTime, samplePeriod);
  when sampleTrigger then
    counter := pre(counter) + 1;
    firstTrigger := time <= startTime + samplePeriod / 2;
    vRef := pre(vRef) + signv * dv;
    if not firstTrigger and power < pre(power) then
      signv := -pre(signv);
    end if;
    if vRef <= 3 * dv then
      signv := 1;
    end if;
  end when;
  // Change direction of voltage derivative
  // Do not allow negative voltages
  annotation (
    defaultComponentName = "mpTracker",
    Documentation(info="<html>
<p>This is a simple model of sampling maximum power tracker. The initial output of this tracker is maximum power voltage
<code>VmpRef</code>. After that, the sensed input power in sampled by a fixed sampling period. The output voltage is decreased by 
a voltage step of <code>VmpRef/n</code>. If then then actual power is greater than the previous power, the sign of of voltage change 
does not change. If the actual power is less than the previous power, the direction of the voltage change is swiched. This way
the sampling maximum power tracker is permanently searching for a local maximum.</p>
</html>"),
    Icon(graphics={  Line(points = {{-80, -78}, {-12, 20}, {12, 50}, {30, 64}, {44, 70}, {52, 68}, {60, 56}, {68, 22}, {80, -78}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Ellipse(extent = {{34, 78}, {54, 58}}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(origin = {0, -10}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(origin = {0, 2}, points = {{-80, -80}, {-80, 68}}, color = {192, 192, 192}), Line(origin = {10, -78}, points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(origin = {-10, -78}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}})}));
end MPTrackerSample;
