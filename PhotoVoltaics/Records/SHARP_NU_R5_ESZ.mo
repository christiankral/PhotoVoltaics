within PhotoVoltaics.Records;
record SHARP_NU_R5_ESZ "SHARP NU monocrystalline SI cell 175W"
  extends ModuleData(final moduleName = "SHARP_NU_R5_ESZ", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 29.8, final IscRef = 8.29, final VmpRef = 23.2, final ImpRef = 7.55, final alphaIsc = +0.00053, final alphaVoc = -0.00350, final ns = 48, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.smartgreenenergycompany.com/Resources/sharp-solar-nu-series.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_R5_ESZ.pdf\">available</a>.
</html>"));
end SHARP_NU_R5_ESZ;
