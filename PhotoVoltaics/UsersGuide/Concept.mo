within PhotoVoltaics.UsersGuide;
class Concept "Concept"
  extends Modelica.Icons.Information;
  annotation (
    preferredView = "info",
    Documentation(info="<html>

<p>The fundamentals of this library are presented in
<a href=\"modelica://PhotoVoltaics.UsersGuide.References\">[Brkic2019]</a>.</p>

<p>The PhotoVoltaics library relies on simple electric equivalent circuit models of
<a href=\"modelica://PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell\">photovoltaic cells</a>.
Simple
<a href=\"modelica://PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleModule\">photovoltaic modules</a>
consist of a series connection of individual cells such that shadowing effects can be considered. Alternatively,
a <a href=\"modelica://PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleModuleSymmetric\">simple symmetric module</a>
consists solely of a single, scaled cell model which calculates cell voltage, current and power, internally. A
<a href=\"modelica://PhotoVoltaics.Components.SimplePhotoVoltaics.SimplePlantSymmetric\">simple symmetric plant</a>
is also a single, scaled model of a cell, considering the series connections of a module and the series and
parallel connections of a plant.</p>

<p>
<img src=\"modelica://PhotoVoltaics/Resources/Images/SimpleModuleMPDC.png\">
</p>

<p>Each photovoltaic (PV) component has to be coupled with a converter to deliver power to either an energy storage or
the electric grid. In the PhotoVoltaics library,
<a href=\"modelica://PhotoVoltaics.Components.Converters.DCConverter\">DC/DC</a> and DC/AC converters are provided. In the quasi-static
domain, a
<a href=\"modelica://PhotoVoltaics.Components.Converters.QuasiStaticSinglePhaseConverter\">single-phase</a> and a
<a href=\"modelica://PhotoVoltaics.Components.Converters.QuasiStaticPolyphaseConverter\">three-phase</a> converter are provided.
For transient models, currently only a
<a href=\"modelica://PhotoVoltaics.Components.Converters.PolyphaseConverter\">three-phase</a>
converter is provided. The converter models consider
</p>
<ul>
<li>no loss of the semiconductors,</li>
<li>ideal control of the DC voltage of the PV component.</li>
</ul>

<p>In order to operate each PV component at the maximum power point, a
<a href=\"modelica://PhotoVoltaics.Components.Blocks.MPTrackerSample\">maximum power tracker</a>
is provided. In the current version, only a sampling tracker is available.</p>

<p>Different solar irradiance sources may be used with the PhotoVoltaics library:</p>
<ul>
<li><a href=\"modelica://PhotoVoltaics.Sources.Irradiance.Irradiance\">Analytical</a> terrestrial solar model depending on
<ul><li>latitude</li>
    <li>longitude</li>
    <li>absolute time</li>
    <li>a reference irradiance of the sun</li>
    <li>azimuth and inclination angle of the used PV component</li>
</ul></li>
<li>Terrestrial irradiance model with <a href=\"modelica://PhotoVoltaics.Sources.Irradiance.IrradianceVariableLocation\">variable location</a>
    of the azimuth and the angle of inclination of the PV component</li>
<li>Irradiance model without time dependency and terrestrial data; sun location is
    <a href=\"modelica://PhotoVoltaics.Sources.Irradiance.IrradianceFixedSun\">fixed</a> such that extraterrestrial solar radiation
    can be investigated</li>
<li>Measurement data read from file such as implemented in <a href=\"modelica://PhotoVoltaics_TGM\">PhotoVoltaics_TGM</a></li>
</ul>

<p>
The PV module parameters of different manufacturers are provided as parameter records. The required module parameters are shown in
<a href=\"modelica://PhotoVoltaics.Records.ModuleData\">ModuleData</a>.
</p></html>"));
end Concept;
