within PhotoVoltaics.Records;
record TSM_200_DC01A "Comax monocrystalline SI cell 200W"
  extends PhotoVoltaics.Records.ModuleData(final moduleName = "TSM 200 DC01A", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 46, final IscRef = 5.6, final VmpRef = 37.6, final ImpRef = 5.37, final alphaIsc = +0.0002, final alphaVoc = -0.003, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.elektra.si/uploads/datoteke/trina_tsm-195-200-205-210dc80.08_mono.pdf\">Comax</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/TSM_200_DC01A.pdf\">available</a>.
</html>"));
end TSM_200_DC01A;
