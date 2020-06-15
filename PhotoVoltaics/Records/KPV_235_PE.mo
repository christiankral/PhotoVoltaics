within PhotoVoltaics.Records;
record KPV_235_PE "Kioto polycrystalline SI cell 235W"
  extends PhotoVoltaics.Records.ModuleData(final moduleName = "KPV_235_PE", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 37.24, final IscRef = 8.61, final VmpRef = 29.82, final ImpRef = 7.97, final alphaIsc = +0.0005, final alphaVoc = -0.0031, final ns = 60, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.enfsolar.com/Product/pdf/Crystalline/559ce7298807b.pdf\">Kioto</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/KPV_235_PE.pdf\">available</a>.
</html>"));
end KPV_235_PE;
