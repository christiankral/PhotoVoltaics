within PhotoVoltaics.UsersGuide;
class ReleaseNotes "Release Notes"
  extends Modelica.Icons.ReleaseNotes;
  annotation (
    preferredView = "info",
    Documentation(info="<html>
<h5>Version 0.6.0, 2017-03-16</h5>
<ul>
<li>Added shadow to solar pyramid model, see #18</li>
<li>Added component names to icon layer, see #19</li>
<li>Removed solar pyramid model without converters</li>
<li>Improved documentation</li>
</ul>

<h5>Version 0.5.0, 2017-02-25</h5>
<ul>
<li>Replaced power factor input of multi phase converter by phase angle phi input, see #12</li>
<li>Improved and fixed documentation of converters</li>
</ul>

<h5>Version 0.4.0, 2017-02-24</h5>
<ul>
<li>Added transient converter, see #8</li>
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
<li>Updated initial conditions of diode model to improve converegence of simulations, see #3</li>
</ul>

<h5>Version 0.3.0, 2017-01-29</h5>
<ul>
<li>Prevented MP tracker from controlling negative voltages according to #5</li>
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
