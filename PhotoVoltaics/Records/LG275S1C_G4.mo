within PhotoVoltaics.Records;
record LG275S1C_G4 "LG monocrystalline SI cell 275W"
  extends ModuleData(final moduleName = "LG275S1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 38.7, final IscRef = 9.26, final VmpRef = 31.7, final ImpRef = 8.68, final alphaIsc = +0.0003, final alphaVoc = -0.003, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_674.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG275S1C_G4.pdf\">available</a>.
</html>"));
end LG275S1C_G4;
