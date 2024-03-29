within PhotoVoltaics.Records;
record TSM_200_DC01A "Comax monocrystalline SI cell 200W"
  extends ModuleData(final moduleName = "TSM 200 DC/DA01A", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 46.0, final IscRef = 5.60, final VmpRef = 37.6, final ImpRef = 5.32, final alphaIsc = +0.00023, final alphaVoc = -0.003, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://static.trinasolar.com/sites/default/files/Comax_DC01A_Datasheet_Feb13_EN.pdf\">Comax</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/TSM_200_DC01A.pdf\">available</a>.
</html>"));
end TSM_200_DC01A;
