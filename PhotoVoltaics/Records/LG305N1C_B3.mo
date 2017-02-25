within PhotoVoltaics.Records;
record LG305N1C_B3 "LG monocrystalline SI cell 305W"
  extends ModuleData(final moduleName = "LG305N1C_B3", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40, final IscRef = 10.1, final VmpRef = 32.1, final ImpRef = 9.52, final alphaIsc = +0.0004, final alphaVoc = -0.0029, final ns = 72, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/commercial/documents/lg-solar-spec-LG305N1C-B3-032315.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG305N1C_B3.pdf\">available</a>.
</html>"));
end LG305N1C_B3;
