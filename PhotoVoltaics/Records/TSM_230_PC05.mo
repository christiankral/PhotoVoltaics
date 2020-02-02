within PhotoVoltaics.Records;
record TSM_230_PC05 "Trina polycrystalline SI cell 230W"
  extends ModuleData(final moduleName = "TSM 230 PC05", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 37, final IscRef = 8.26, final VmpRef = 29.8, final ImpRef = 7.72, final alphaIsc = +0.0005, final alphaVoc = -0.0032, final ns = 60, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://http://www.franklin-electric.com.au/media/52578/Trina%20TSM190-200DC01A_WW.pdf\">Trina</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/TSM_230_PC05.pdf\">available</a>.
</html>"));
end TSM_230_PC05;
