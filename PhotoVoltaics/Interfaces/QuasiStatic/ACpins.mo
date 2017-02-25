within PhotoVoltaics.Interfaces.QuasiStatic;
partial model ACpins "Single phase AC pins"
  Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin ac_p "AC positive pin" annotation (
    Placement(transformation(extent = {{90, 90}, {110, 110}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin ac_n "AC negative pin" annotation (
    Placement(transformation(extent = {{90, -110}, {110, -90}})));
  Modelica.SIunits.ComplexVoltage vAC = ac_p.v - ac_n.v "AC potential";
  Modelica.SIunits.ComplexCurrent iAC = ac_p.i "AC current";
end ACpins;
