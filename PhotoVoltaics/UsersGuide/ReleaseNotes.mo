within PhotoVoltaics.UsersGuide;
class ReleaseNotes "Release Notes"
  extends Modelica.Icons.ReleaseNotes;
  annotation (
    preferredView = "info",
    Documentation(info="<html>
 
<h5>Version 1.3.2, 2019-02-26</h5>
<ul>
<li>Remove library path from CSV file so that write protected libraries installations can still write data, 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/34\">#34</a></li>
<li>Update license year from 2018 to 2019</li>
</ul>

<h5>Version 1.3.1, 2018-10-14</h5>
<ul>
<li>Fix license information in 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/blob/master/README.md\">README.md</a></li>
</ul>

<h5>Version 1.3.0, 2018-10-14</h5>
<ul>
<li>Change Modelica 1.1 to BSD 3-clause license</li>
</ul>

<h5>Version 1.2.0, 2018-09-30</h5>
<ul>
    <li>Converted 
    <a href=\"modelica://PhotoVoltaics_TGM\">PhotoVoltaics_TGM</a> library to Buildings version 5.1.0, as the 
    processing of parameter <code>filNam</code> of
    <code>Buildings.BoundaryConditions.WeatherData.ReaderTMY3</code> changed</li>
</ul>

<h5>Version 1.1.1, 2018-01-05</h5>
<ul>
    <li>Fixed 
    <a href=\"modelica://PhotoVoltaics.Sources.Blocks.TriangleAndStep\">TriangleAndStep</a>, see 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/30\">#30</a></li>
    <li>Fixed HTML error of release notes</li>
</ul>
    
<h5>Version 1.1.0, 2017-07-04</h5>
<ul>
<li>Added links to tickets on GitHub, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/24\">#24</a></li>
<li>Changed simulation time to 86400 seconds in 
    <a href=\"modelica://PhotoVoltaics.Examples.SimpleModuleMPDC\">SimpleModuleMPDC</a>, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/25\">#25</a></li>
<li>Aligned misplaced connector in 
    <a href=\"modelica://PhotoVoltaics.Sources.Irradiance.Irradiance\">Irradiance</a>, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/26\">#26</a></li>
<li>Removed obsolete self connection in 
    <a href=\"modelica://PhotoVoltaics.Components.SimplePhotoVoltaics.SolarPyramidDCConverter\">SolarPyramidDCConverter</a>, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/27\">#27</a></li>
<li>Changed sun azimuth in 
    <a href=\"modelica://PhotoVoltaics.Examples.SolarPyramidBatteryCharge\">SolarPyramidBatteryCharge</a> 
    from 10 to 260 degrees, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/28\">#28</a></li>
<li>Added 
    <a href=\"modelica://PhotoVoltaics.UsersGuide.License\">license</a> 
    information of EnergyPlus, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/29\">#29</a></li>
</ul>

<h5>Version 1.0.1, 2017-06-19</h5>
<ul>
<li>Added missing ground in 
    <a href=\"modelica://PhotoVoltaics.ComponentTesting.DiodeCompare\">DiodeCompare</a>, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/23\">#23</a></li>
</ul>

<h5>Version 1.0.0, 2017-04-30</h5>
<ul>
<li>Updated documentation</li>
</ul>

<h5>Version 0.6.1, 2017-03-27</h5>
<ul>
<li>Removed obsolete solar pyramid without converter</li>
</ul>

<h5>Version 0.6.0, 2017-03-16</h5>
<ul>
<li>Added shadow to solar pyramid model, see 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/18\">#18</a></li>
<li>Added component names to icon layer, see 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/19\">#19</a></li>
<li>Removed solar pyramid model without converters</li>
<li>Improved documentation</li>
</ul>

<h5>Version 0.5.0, 2017-02-25</h5>
<ul>
<li>Replaced power factor input of multi phase converter by phase angle phi input, see
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/12\">#12</a></li>

<li>Improved and fixed documentation of converters</li>
</ul>

<h5>Version 0.4.0, 2017-02-24</h5>
<ul>
<li>Added transient converter, see 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/8\">#8</a></li>
<li>Added DC converter</li>
<li>Restructured PV, Converters, Batteries within Components; this is a non-backwards compatible change</li>
<li>Added some more irradiance models</li>
<li>Added solar pyramid model</li>
<li>Added icons package<li>
<li>Changed interface names of DC converter (now compatible with 
    <a hfre=\"modelica://Modelica.Electrical.PowerConverters\">PowerConverters</a></li> 
<li>Added Conveters with integrated sampled power tracking</li>
<li>Changed internal integration time constant of converters from <code>T</code> to <code>Ti</code> 
    due to incompatibility with temperature</li>
</ul>

<h5>Version 0.3.2, 2017-01-29</h5>
<ul>
<li>Used full qualified Modelica class names in examples</li>
<li>Reduced tolerance of analytical models in 
    <a href=\"modelica://PhotoVoltaics_TGM\">PhotoVoltaics_TGM</a>
    to avoid numerical problems</li>
<li>Implemented functionality of shadow in symmetric plant model</li>
</ul>

<h5>Version 0.3.1, 2017-01-29</h5>
<ul>
<li>Updated initial conditions of diode model to improve converegence of simulations, see 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/3\">#3</a></li>

</ul>

<h5>Version 0.3.0, 2017-01-29</h5>
<ul>
<li>Prevented MP tracker from controlling negative voltages according to 
    <a href=\"https://github.com/christiankral/PhotoVoltaics/issues/5\">#5</a></li>

<li>Tuned simulation settings to have most simulations run in OpenModelica</li>
<li>Added simulation models including measurement data to 
    <a href=\"modelica://PhotoVoltaics_TGM\">PhotoVoltaics_TGM</a></li> 
<li>Fixed bug in string of one parameter record</li>
</ul>

<h5>Version 0.2.1, 2017-01-02</h5>
<ul>
<li>Fixed number of cells to ns=72 in module TSM_200_DC01A</li>
</ul>

<h5>Version 0.2.0, 2017-01-02</h5>
<ul>
<li>Added analytical irradiance model plus auxiliary functions</li>
<li>Added weather model of Vienna into Resources directory</li>
<li>Renamed application library into <b>PhotoVoltaics_TGM</b></li>
</ul>

<h5>Version 0.1.0, 2016-12-31</h5>
<ul>
<li>First release version containing</li>
<ul>
<li>Simple cell model</li>
<li>Simple module model</li>
<li>Simple symmetric module model</li>
<li>Simple plant model</li>
<li>Converters</li>
<li>Sampling maximum power controller</li>
<li>Examples</li>
<li>Component testing models</li>
</ul>
</ul>
</html>"));
end ReleaseNotes;
