within PhotoVoltaics.Records;
record SW_260_POLY "Solarworld polycrystalline SI cell 260W"
  extends ModuleData(final moduleName = "SW_260_POLY", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 38.4, final IscRef = 8.94, final VmpRef = 31.4, final ImpRef = 8.37, final alphaIsc = +0.00051, final alphaVoc = -0.0031, final ns = 60, final nb = 3);
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2012/01/SolarWorld-SW260Poly-5bb_EN.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_260_POLY.pdf\">available</a>.
</html>"));
end SW_260_POLY;
