within PhotoVoltaics.Records;
record TSM_200_DC01A "Comax monocrystalline SI cell 200W"
  extends ModuleData(final moduleName = "TSM 200 DC01A", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 45.8, final IscRef = 5.68, final VmpRef = 37.8, final ImpRef = 5.30, final alphaIsc = +0.0005, final alphaVoc = -0.0035, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://static.trinasolar.com/sites/default/files/Comax_DC01A_Datasheet_Feb13_EN.pdf\">Comax</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/TSM_200_DC01A.pdf\">available</a>.
</html>"));
end TSM_200_DC01A;
