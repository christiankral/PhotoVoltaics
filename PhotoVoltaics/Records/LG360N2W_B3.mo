within PhotoVoltaics.Records;
record LG360N2W_B3 "LG monocrystalline SI cell 360W"
  extends ModuleData(final moduleName = "LG360N2W_B3", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 48.3, final IscRef = 9.84, final VmpRef = 38.4, final ImpRef = 9.39, final alphaIsc = +0.0004, final alphaVoc = -0.003, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.lg.com/us/business/download/resources/BT00002151/BT00002151_369.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG360N2W_B3.pdf\">available</a>.
</html>"));
end LG360N2W_B3;
