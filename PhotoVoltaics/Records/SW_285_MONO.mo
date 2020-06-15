within PhotoVoltaics.Records;
record SW_285_MONO "Solarworld monocrystalline SI cell 285W"
  extends PhotoVoltaics.Records.ModuleData(final moduleName = "SW_285_MONO", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39.7, final IscRef = 9.84, final VmpRef = 31.3, final ImpRef = 9.2, final alphaIsc = +0.0004, final alphaVoc = -0.003, final ns = 60, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.solarworld-usa.com/~/media/www/files/datasheets/sunmodule-plus/sunmodule-solar-panel-285-mono-ds.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_285_MONO.pdf\">available</a>.
</html>"));
end SW_285_MONO;
