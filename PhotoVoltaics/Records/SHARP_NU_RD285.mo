within PhotoVoltaics.Records;
record SHARP_NU_RD285 "SHARP monocrystalline SI cell 285W"
  extends ModuleData(final moduleName = "SHARP_NU_RD285", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39.2, final IscRef = 9.37, final VmpRef = 31.3, final ImpRef = 9.1, final alphaIsc = +0.0005, final alphaVoc = -0.0029, final ns = 60, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2016/03/Datasheet_NURD260-285W_black_151027.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_RD285.pdf\">available</a>.
</html>"));
end SHARP_NU_RD285;
