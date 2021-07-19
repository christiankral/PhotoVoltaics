within PhotoVoltaics.Records;
record LG300N1C_G4 "LG monocrystalline SI cell 300W"
  extends ModuleData(final moduleName = "LG300N1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39.8, final IscRef = 9.9, final VmpRef = 32.2, final ImpRef = 9.34, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://d1819pwkf4ncw.cloudfront.net/files/documents/lg300n1c-g4-360889.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG300N1C_G4.pdf\">available</a>.
</html>"));
end LG300N1C_G4;
