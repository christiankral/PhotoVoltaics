package PhotoVoltaics
  extends Modelica.Icons.Package;



































  annotation (preferredView="info",
    version = "0.6.0",
    versionBuild = 1,
    versionDate = "2017-03-16",
    uses(Modelica(version = "3.2.2")),
    Icon(coordinateSystem, graphics={  Ellipse(origin = {36, 75}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{0, 1}, {40, -39}}, endAngle = 360), Rectangle(origin = {-60, -9}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {0, -7}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {-60, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {0, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {60, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {60, -5}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255},
            fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Line(origin = {18, 34}, points = {{4, 10}, {-84, -16}}), Line(origin = {-12, 70}, points = {{34, -6}, {-34, 6}}), Line(points = {{36, 30}, {28, 16}}, color = {28, 108, 200})}),
    Documentation(info="<html>
<p>
Modelica library for the simulation of photo voltaic cells, modules and plants. The library provides:
</p>
<ul>
<li>
<li>Simple cell models based on one diode and a irradiance dependent current source 
    including temperature dependence of the open circuit voltage and the short circuit current</li>
<li>Simple symmetric modules and non-symmetric module including shading of cells</li>
<li>Simple symmetric plant</li> 
<li>Solar pyramid model</li>
<li>Cell, module and plant parameters can be taken directly from manufacturer data sheets</li>
<li>Data of commercial modules stored in Modelica Records for convenient investigations</li>
<li>Analytical irradiance model without weather conditions</li>
<li>Single and three phase quasi static converters</li>
<li>Three phase transient converter</li>
<li>Maximum power tracker based on continuous voltage regulation</li>
<li>Linear, symmetric and chargable battery model, parameterized by cut off voltage, charge voltage, energy</li>
</ul>
<h5>Application examples</h5>

<p><b>Phileas Rover</b></p>
<p>The maximum power harvest of a solar pyramid, which may be applicable to the 
<a href=\"http://oewf.org/en/polares-science/phileas-rover/\">Phileas Rover</a>
of the <a href=\"http://oewf.org/en/\">Austrian Space Forum, OEWF</a>, can be investigated by the PhotoVoltaics libraray.</p>

<p><b>TGM Photovoltaic Power Plants</b></p>

<p>Actual irradiance and electric power measurement data of the TGM power plants Trina and Comax in 
<a href=\"http://www.openstreetmap.org/way/233509248>\"Vienna</a> are provided in the PhotoVoltaics_TGM library. 
Measurements and simulation results can be compared by the provided example models. 
The PhotoVoltaics_TGM library relies on the <a href=\"https://github.com/lbl-srg/modelica-buildings\">Buildings library</a>.
</p> 

<p>
<img src=\"modelica://PhotoVoltaics/Resources/Images/TGM_Comax_Trina.jpg\">
</p>

<h5>Contributions</h5>
<p>
The library was developed during a Diploma project at the Technical Engineering College, 
<a href=\"http://www.tgm.ac.at\">TGM</a>, Wexstraße 19-23, 1200 Vienna, Austria. 
Library authors are</p>
<ul>
<li>Jovan Brkic</li>
<li>Muaz Ceran</li>
<li>Mohamed Elmoghazy</li>
<li>Ramazan Kavlak
<li><a href=\"http://christiankral.net\">Christian Kral</a></li>
</ul>

<p>The three phase transient multi phase converter was contributed by Luiz Bueno, RWTH Aachen, Germany.</p>
</html>"));
end PhotoVoltaics;
