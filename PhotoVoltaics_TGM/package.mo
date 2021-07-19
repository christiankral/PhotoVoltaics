package PhotoVoltaics_TGM
  extends Modelica.Icons.Package;

  annotation (preferredView="info",
    version="2.0.0",
    versionDate = "2021-07-19",
    uses(
      Modelica(version="4.0.0"),
      PhotoVoltaics(version="2.0.0")),
    conversion(
      from(version={"1.6.0", "1.5.0", "1.4.1", "1.4.0", "1.3.2", "1.3.1", "1.3.0", "1.2.0", "1.1.0", "1.0.1", "1.0.0"},
      script="modelica://PhotoVoltaics/Resources/Scripts/Conversion/ConvertFromPhotoVoltaics_TGM_1.6.0.mos")),
    Documentation(info="<html>
<p>This library is based on the <a href=\"https://github.com/christiankral/PhotoVoltaics\">PhotoVoltaics</a> and the 
<a href=\"https://github.com/lbl-srg/modelica-buildings\">Buildings</a> library. 

<em>As the Buildings library is not yet converted to the Modelica Standard Library (MSL) 4.0.0, 
the Buildings specific examples are currently removed. These examples will be re-added as soon as a 
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2122\">MSL 4.0.0 compatible version of the Buldings library is released</a>.</em>

More information can be found at the <a href=\"modelica://PhotoVoltaics.UsersGuide\">User&apos;s Guide</a> 
of the <a href=\"modelica://PhotoVoltaics\">PhotoVoltaics</a> library. </p>
<p>The data base of this library are two photo voltaic power plants at the <a href=\"https://www.tgm.ac.at\">TGM</a> 
in <a href=\"https://www.openstreetmap.org/way/233509248\">Vienna</a>, Austria. The
GPS coordinates are 48.237111°N, 16.369000°E.</p>
<p>Two photovoltaic plants are investigated:</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td></td>
<td><p>Comax</p></td>
<td><p>Trina</p></td>
</tr>
<tr>
<td><p>Modules</p></td>
<td><p>TSM_200_DC01A</p></td>
<td><p>TSM_230_PC05</p></td>
</tr>
<tr>
<td><p>Series connected modules</p></td>
<td><p>6</p></td>
<td><p>8</p></td>
</tr>
<tr>
<td><p>azimuth</p></td>
<td><p>0&deg;</p></td>
<td><p>0&deg;</p></td>
</tr>
<tr>
<td><p>gamma (inclination of PV modules)</p></td>
<td><p>10&deg;</p></td>
<td><p>10&deg;</p></td>
</tr>
</table>

<p>
<img src=\"modelica://PhotoVoltaics/Resources/Images/TGM_Comax_Trina.jpg\">
</p>

<p>For these two plants different irradiance sources are investigated.</p>

<p>Measured data are also provided and may be compared with simulation data.</p></html>"));

end PhotoVoltaics_TGM;
