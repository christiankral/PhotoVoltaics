within PhotoVoltaics.Interfaces.QuasiStatic;
partial model ACplug "AC polyphase plug"
  import Modelica.ComplexMath.conj;
  parameter Integer m(final min = 3) = 3 "Number of phases";
  Modelica.Electrical.QuasiStatic.Polyphase.Interfaces.PositivePlug ac(final
      m=m) "AC output"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Units.SI.ComplexVoltage vAC[m]=ac.pin[:].v "AC potential";
  Modelica.Units.SI.ComplexCurrent iAC[m]=ac.pin[:].i "AC current";
  Modelica.Units.SI.ComplexPower apparentPowerAC[m]=vAC .* conj(iAC)
    "AC apparent power";
  annotation (Documentation(info="<html>
<p>This model provides a polyphase AC quasi static plug.</p>
</html>"));
end ACplug;
