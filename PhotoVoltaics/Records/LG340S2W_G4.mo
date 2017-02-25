within PhotoVoltaics.Records;
record LG340S2W_G4 "LG monocrystalline SI cell 340W"
  extends ModuleData(final moduleName = "LG340S2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 46.4, final IscRef = 9.54, final VmpRef = 37.7, final ImpRef = 9.02, final alphaIsc = +0.0003, final alphaVoc = -0.003, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_673.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG340S2W_G4.pdf\">available</a>.
</html>"));
end LG340S2W_G4;
