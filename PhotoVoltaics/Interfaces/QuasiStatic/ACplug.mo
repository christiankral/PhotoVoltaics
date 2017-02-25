within PhotoVoltaics.Interfaces.QuasiStatic;
partial model ACplug "AC multi phase plug"
  parameter Integer m(final min = 3) = 3 "Number of phases";
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug ac(final m = m) "AC output" annotation (
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.SIunits.ComplexVoltage vAC[m] = ac.pin[:].v "AC potential";
  Modelica.SIunits.ComplexCurrent iAC[m] = ac.pin[:].i "AC current";
end ACplug;
