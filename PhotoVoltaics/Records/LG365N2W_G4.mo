within PhotoVoltaics.Records;
record LG365N2W_G4 "LG monocrystalline SI cell 365W"
  extends ModuleData(final moduleName = "LG365N2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 47.7, final IscRef = 9.92, final VmpRef = 38.9, final ImpRef = 9.39, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_675.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG365N2W_G4.pdf\">available</a>.
</html>"));
end LG365N2W_G4;
