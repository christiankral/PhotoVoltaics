within PhotoVoltaics.Records;
record LG375N2W_G4 "LG monocrystalline SI cell 375W"
  extends ModuleData(final moduleName = "LG375N2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 48.3, final IscRef = 10.04, final VmpRef = 39.6, final ImpRef = 9.5, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_675.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG375N2W_G4.pdf\">available</a>.
</html>"));
end LG375N2W_G4;
