within PhotoVoltaics.Records;
record SHARP_NU_S5_E3E "SHARP NU monocrystalline SI cell 185W"
  extends ModuleData(final moduleName = "SHARP_NU_S5_E3E", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 30.2, final IscRef = 8.54, final VmpRef = 24.0, final ImpRef = 7.71, final alphaIsc = +0.00053, final alphaVoc = -0.00340, final ns = 48, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.smartgreenenergycompany.com/Resources/sharp-solar-nu-series.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_S5_E3E.pdf\">available</a>.
</html>"));
end SHARP_NU_S5_E3E;
