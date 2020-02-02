within PhotoVoltaics.Interfaces.QuasiStatic;
partial model ACpins "Single phase AC pins"
  import Modelica.ComplexMath.conj;
  Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin ac_p "AC positive pin" annotation (
    Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin ac_n "AC negative pin" annotation (
    Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.SIunits.ComplexVoltage vAC = ac_p.v - ac_n.v "AC potential";
  Modelica.SIunits.ComplexCurrent iAC = ac_p.i "AC current";
  Modelica.SIunits.ComplexPower apparentPowerAC = vAC.*conj(iAC) "AC apparent power";
  annotation (Documentation(info="<html>
<p>This model provides single phase AC quasi static pins.</p>
</html>"));
end ACpins;
