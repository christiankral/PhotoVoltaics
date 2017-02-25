within PhotoVoltaics.Records;
record SPR_E20_327 "Sunpower monocrystalline SI cell 327W"
  extends ModuleData(final moduleName = "SPR_E20_327", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 64.9, final IscRef = 6.46, final VmpRef = 54.7, final ImpRef = 5.98, final alphaIsc = +0.00054, final alphaVoc = -0.00272, final ns = 96, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://us.sunpower.com/sites/sunpower/files/media-library/data-sheets/e-series-home-solar-panels-comparison.pdf\">Sunpower</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SPR_E20_327.pdf\">available</a>.
</html>"));
end SPR_E20_327;
