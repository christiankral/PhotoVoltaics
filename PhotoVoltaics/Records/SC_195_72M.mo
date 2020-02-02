within PhotoVoltaics.Records;
record SC_195_72M "Sunclass monocrystalline SI cell 195W"
  extends ModuleData(final moduleName = "SC_195_72M", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 45.5, final IscRef = 5.63, final VmpRef = 36.9, final ImpRef = 5.28, final alphaIsc = +0.0004, final alphaVoc = -0.0029, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.sunclass-solar.com/fileadmin/Download-Center/Solarmodule/SunClass/en/SunClass_SC_Serie_195-205W_72M_1580x808x35_EN.pdf\">Sunclass</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SC_195_72M.pdf\">available</a>.
</html>"));
end SC_195_72M;
