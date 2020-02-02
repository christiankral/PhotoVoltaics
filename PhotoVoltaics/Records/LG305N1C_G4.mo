within PhotoVoltaics.Records;
record LG305N1C_G4 "LG monocrystalline SI cell 305W"
  extends ModuleData(final moduleName = "LG305N1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40.1, final IscRef = 9.93, final VmpRef = 32.5, final ImpRef = 9.39, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_677.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG305N1C_G4.pdf\">available</a>.
</html>"));
end LG305N1C_G4;
