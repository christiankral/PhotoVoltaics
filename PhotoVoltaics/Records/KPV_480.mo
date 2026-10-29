within PhotoVoltaics.Records;
record KPV_480 "Kioto monocrystalline SI cell 480W"
  extends ModuleData(final moduleName = "KPV_480", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40.53, final IscRef = 14.98, final VmpRef = 33.51, final ImpRef = 14.33, final alphaIsc = +0.0005, final alphaVoc = -0.002, final ns = 54, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
<p>
The original data of this module (KPV 480Wp HC NE, double glass module with TOPCon backside contact cells) are taken from
<a href=\"https://www.pvundsolar.at/Kioto-Doppelglasmodul-480-Wp-Rahmen-schwarz\">Kioto</a>. You may want to download the PDF data sheet and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/KPV_480.pdf\">available</a>.
</p>
<p>
The module consists of 108 half-cut cells (6 x 18). Two halves of the module with 54 series connected half-cut cells each are
connected in parallel. Therefore, the number of series connected cells is <code>ns = 54</code>, and the short circuit
and maximum power current refer to the entire module.
</p>
</html>"));
end KPV_480;
