within PhotoVoltaics.Records;
record SW_250_MONO "Solarworld monocrystalline SI cell 250W"
  extends ModuleData(final moduleName = "SW_250_MONO", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 37.8, final IscRef = 8.28, final VmpRef = 31.1, final ImpRef = 8.05, final alphaIsc = +0.00004, final alphaVoc = -0.003, final ns = 60, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.solarworld-usa.com/~/media/www/files/datasheets/sunmodule-plus/sunmodule-solar-panel-250-mono-ds.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_250_MONO.pdf\">available</a>.
</html>"));
end SW_250_MONO;
