package PhotoVoltaics
  extends Modelica.Icons.Package;

  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

    class Concept "Concept"
      extends Modelica.Icons.Information;
      annotation (
        preferredView = "info",
        Documentation(info = "<html>
</html>"));
    end Concept;

    class License "Modelica License 1.1"
      extends Modelica.Icons.Information;
      annotation (
        Documentation(info = "<html>
<h4>PhotoVoltaics Modelica Library</h4>

<p>The PhotoVoltaics library is released under the
<a href=\"https://www.modelica.org/licenses/ModelicaLicense1.1\">Modelica License 1.1</a>
</p>
<h4>
 The Modelica License (Version 1.1 of June 30, 2000)
</h4>
<p>
Redistribution and use in source and binary forms, with or without modification
are permitted, provided that the following conditions are met:
<ol>
  <li> The author and copyright notices in the source files, these license
       conditions and the disclaimer below are (a) retained and (b) reproduced
       in the documentation provided with the distribution.</li>
  <li> Modifications of the original source files are allowed, provided that a
       prominent notice is inserted in each changed file and the accompanying
       documentation, stating how and when the file was modified, and provided
       that the conditions under (1) are met.</li>
  <li> It is not allowed to charge a fee for the original version or a modified
       version of the software, besides a reasonable fee for distribution and
       support. Distribution in aggregate with other (possibly commercial)
       programs as part of a larger (possibly commercial) software distribution
       is permitted, provided that it is not advertised as a product of your
       own.</li>
</ol>
<h5>Disclaimer</h5>
<p>
The software (sources, binaries, etc.) in their original or in a modified form
 are provided \"as is\" and the copyright holders assume no responsibility for
 its contents what so ever. Any express or implied warranties, including, but
 not limited to, the implied warranties of merchantability and fitness for a
 particular purpose are <b>disclaimed</b>. <b>In no event</b> shall the
 copyright holders, or any party who modify and/or redistribute the package,
 <b>be liable</b> for any direct, indirect, incidental, special, exemplary,
 or consequential damages, arising in any way out of the use of this software,
 even if advised of the possibility of such damage.
</p>

<h4>Module Data</h4>

<p>Module data are taken from manufacturer data sheets. The original links and, if possible,
PDF files of the data sheets are provided through this library. However, the manufacturer PDF files 
    are not subject to the License of this library; they are original material of the
    manufacturer, publicly available in the Internet.
    These PDF files are distributed through the library for convenience reasons only. </p>
</html>"));
    end License;

    class Contact "Contact"
      extends Modelica.Icons.Contact;
      annotation (
        preferredView = "info",
        Documentation(info="<html>
<p>
This library was developed during a diploma thesis at the
<a href=\"http://www.tgm.ac.at\">TGM</a>
by Jovan Brkic, Muaz Ceran, Mohamed Elmoghazy and Ramazan Kavlak under the supervision of Christian Kral. 
The library is hosted at <a href=\"https://github.com/christiankral/PhotoVoltaics\">GitHub</a>.
</p>

<p>
<img src=\"modelica://PhotoVoltaics/Resources/Images/tgm.png\" alt=\"tgm.png\">
</p>

<h4>Contact</h4>

<p>
Christian Kral<br>
<a href=\"http://christiankral.net\">Electric machines and drives</a><br>
1060 Vienna, Austria<br>
email: <a HREF=\"mailto:dr.christian.kral@gmail.com\">dr.christian.kral@gmail.com</a><br>
</p>

<h4>Co-Authors of the Library</h4>
<p>
Jovan Brkic<br>
Muaz Ceran<br>
Mohamed Elmoghazy<br>
Ramazan Kavlak<br>
</p>
</html>"));
    end Contact;

    class References "References"
      extends Modelica.Icons.References;
      annotation (
        preferredView = "info",
        Documentation(info = "<html>
<h4>References</h4>

</html>"));
    end References;

    class ReleaseNotes "Release Notes"
      extends Modelica.Icons.ReleaseNotes;
      annotation (
        preferredView = "info",
        Documentation(info="<html>

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
    annotation (
      preferredView = "info",
      Documentation(info = "<html>
<p>
This library provides models for the modeling and simulation of photo voltaic power plants.
</p>
</html>"));
  end UsersGuide;

  package ComponentTesting "Testing of single components"
    extends Modelica.Icons.ExamplesPackage;

    model DiodeCompare "Compare different diode models"
      extends Modelica.Icons.Example;
      parameter Integer ns = 10 "Number of series connected cells";
      parameter Integer nsModule = 2 "Number of series connected modules";
      parameter Integer npModule = 2 "Number of parallel connected modules";
      parameter Modelica.SIunits.Voltage Vmin = -5.30 "Minimum voltage range";
      parameter Modelica.SIunits.Voltage Vmax = +0.75 "Maximum voltage range";
      Modelica.Electrical.Analog.Semiconductors.ZDiode zDiode(useHeatPort = true, R = 1E8, Maxexp = 0.6292 / 0.04, Ids = 1.26092E-6, T = 298.15) annotation (
        Placement(transformation(extent = {{-40, -40}, {-20, -20}})));
      Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(duration = 1, startTime = 0, V = Vmax - Vmin, offset = Vmin) annotation (
        Placement(transformation(extent = {{-40, -70}, {-20, -50}})));
      PhotoVoltaics.Components.Diodes.Diode2exp diode(m = 40 / 25.69, useHeatPort = true) annotation (
        Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
      parameter Records.ModuleData moduleData annotation (
        Placement(transformation(extent = {{-10, 80}, {10, 100}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 318.15) annotation (
        Placement(transformation(extent = {{-90, -20}, {-70, 0}})));
      Modelica.Electrical.Analog.Sources.RampVoltage rampVoltagem(duration = 1, startTime = 0, V = nsModule * ns * (Vmax - Vmin), offset = nsModule * ns * Vmin) annotation (
        Placement(transformation(extent = {{60, -70}, {80, -50}})));
      Modelica.Electrical.Analog.Basic.Ground groundm annotation (
        Placement(transformation(extent = {{80, -90}, {100, -70}})));
      Components.Diodes.Diode2Module diodexm(m = 40 / 25.69, useHeatPort = true, nsModule = nsModule, npModule = npModule, ns = ns) annotation (
        Placement(transformation(extent = {{60, 20}, {80, 40}})));
    equation
      connect(rampVoltage.p, zDiode.p) annotation (
        Line(points = {{-40, -60}, {-50, -60}, {-50, -30}, {-40, -30}}, color = {0, 0, 255}));
      connect(zDiode.n, rampVoltage.n) annotation (
        Line(points = {{-20, -30}, {-10, -30}, {-10, -60}, {-20, -60}}, color = {0, 0, 255}));
      connect(rampVoltage.p, diode.p) annotation (
        Line(points = {{-40, -60}, {-50, -60}, {-50, 0}, {-40, 0}}, color = {0, 0, 255}));
      connect(rampVoltage.n, diode.n) annotation (
        Line(points = {{-20, -60}, {-16, -60}, {-10, -60}, {-10, 0}, {-20, 0}}, color = {0, 0, 255}));
      connect(fixedTemperature.port, diode.heatPort) annotation (
        Line(points = {{-70, -10}, {-30, -10}}, color = {191, 0, 0}));
      connect(fixedTemperature.port, zDiode.heatPort) annotation (
        Line(points = {{-70, -10}, {-70, -10}, {-60, -10}, {-60, -40}, {-30, -40}}, color = {191, 0, 0}));
      connect(rampVoltagem.n, groundm.p) annotation (
        Line(points = {{80, -60}, {90, -60}, {90, -70}}, color = {0, 0, 255}));
      connect(diodexm.p, rampVoltagem.p) annotation (
        Line(points = {{60, 30}, {50, 30}, {50, -60}, {60, -60}}, color = {0, 0, 255}));
      connect(diodexm.heatPort, fixedTemperature.port) annotation (
        Line(points = {{70, 20}, {70, 20}, {-48, 20}, {-60, 20}, {-60, -10}, {-70, -10}}, color = {191, 0, 0}));
      connect(diodexm.n, groundm.p) annotation (
        Line(points = {{80, 30}, {90, 30}, {90, -70}}, color = {0, 0, 255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end DiodeCompare;

    model SinglePhaseVoltageControlledConverter "Test of voltage current controlled converter"
      extends Modelica.Icons.Example;
      Components.SinglePhaseVoltageControlledConverter converter annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 1) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-40, 0})));
      Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
        Placement(transformation(extent = {{-50, -40}, {-30, -20}})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(f = 50, V = 100, phi = 0) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
        Placement(transformation(extent = {{30, -38}, {50, -18}})));
      Modelica.Blocks.Sources.Ramp ramp(duration = 0.6, startTime = 0.2, height = 200, offset = -100) annotation (
        Placement(transformation(extent = {{-60, -80}, {-40, -60}})));
    equation
      connect(constantCurrent.n, converter.dc_p) annotation (
        Line(points = {{-40, 10}, {-26, 10}, {-10, 10}}, color = {0, 0, 255}));
      connect(constantCurrent.p, converter.dc_n) annotation (
        Line(points = {{-40, -10}, {-26, -10}, {-10, -10}}, color = {0, 0, 255}));
      connect(groundDC.p, constantCurrent.p) annotation (
        Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
      connect(converter.ac_p, voltageSource.pin_p) annotation (
        Line(points = {{10, 10}, {40, 10}}, color = {85, 170, 255}));
      connect(converter.ac_n, voltageSource.pin_n) annotation (
        Line(points = {{10, -10}, {25, -10}, {40, -10}}, color = {85, 170, 255}));
      connect(groundAC.pin, voltageSource.pin_n) annotation (
        Line(points = {{40, -18}, {40, -14}, {40, -10}}, color = {85, 170, 255}));
      connect(ramp.y, converter.vDCRef) annotation (
        Line(points = {{-39, -70}, {-39, -70}, {0, -70}, {0, -12}}, color = {0, 0, 127}));
      annotation (
        experiment(StopTime = 180));
    end SinglePhaseVoltageControlledConverter;

    model MultiPhaseVoltageControlledConverter "Test of voltage current controlled converter"
      extends Modelica.Icons.Example;
      Components.MultiPhaseVoltageControlledConverter converter annotation (
        Placement(transformation(extent = {{-10, 10}, {10, 30}})));
      Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent(I = 1) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-40, 20})));
      Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
        Placement(transformation(extent = {{-50, -20}, {-30, 0}})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource voltageSource(f = 50, V = fill(400 / sqrt(3), 3)) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
        Placement(transformation(extent = {{30, -70}, {50, -50}})));
      Modelica.Blocks.Sources.Ramp ramp(duration = 0.6, startTime = 0.2, height = 200, offset = -100) annotation (
        Placement(transformation(extent = {{-60, -60}, {-40, -40}})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, -30})));
    equation
      connect(constantCurrent.n, converter.dc_p) annotation (
        Line(points = {{-40, 30}, {-26, 30}, {-10, 30}}, color = {0, 0, 255}));
      connect(constantCurrent.p, converter.dc_n) annotation (
        Line(points = {{-40, 10}, {-26, 10}, {-10, 10}}, color = {0, 0, 255}));
      connect(groundDC.p, constantCurrent.p) annotation (
        Line(points = {{-40, 0}, {-40, 10}}, color = {0, 0, 255}));
      connect(ramp.y, converter.vDCRef) annotation (
        Line(points = {{-39, -50}, {-20, -50}, {0, -50}, {0, 8}}, color = {0, 0, 127}));
      connect(star.pin_n, groundAC.pin) annotation (
        Line(points = {{40, -40}, {40, -50}, {40, -50}}, color = {85, 170, 255}));
      connect(star.plug_p, voltageSource.plug_n) annotation (
        Line(points = {{40, -20}, {40, -10}}, color = {85, 170, 255}));
      connect(converter.ac, voltageSource.plug_p) annotation (
        Line(points = {{10, 20}, {16, 20}, {20, 20}, {40, 20}, {40, 10}}, color = {85, 170, 255}));
      annotation (
        experiment(StopTime = 180));
    end MultiPhaseVoltageControlledConverter;

    model TestIrradiance "Testing irradiance model"
      extends Modelica.Icons.Example;
      PhotoVoltaics.Sources.Irradiance.Irradiance irradiance(startMonth = 12, startDay = 30) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.Integrator integrator(y(unit = "J/m2")) annotation (
        Placement(transformation(extent = {{20, -10}, {40, 10}})));
    equation
      connect(irradiance.irradiance, integrator.u) annotation (
        Line(points = {{11, 0}, {14.5, 0}, {18, 0}}, color = {0, 0, 127}));
      annotation (
        experiment(StopTime = 3.1536e+07, Interval = 60, Tolerance = 1e-06));
    end TestIrradiance;
  end ComponentTesting;

  package Examples "Examples"
    extends Modelica.Icons.ExamplesPackage;

    model SimpleCell
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
      PhotoVoltaics.Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      PhotoVoltaics.Components.SimpleCell cell(moduleData = moduleData) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(cell.p, variableResistor.p) annotation (
        Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, cell.n) annotation (
        Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
      connect(ground.p, variableResistor.n) annotation (
        Line(points = {{0, -20}, {14, -20}, {40, -20}, {40, -10}}, color = {0, 0, 255}));
      connect(variableResistor.R, powerRamp.y) annotation (
        Line(points = {{51, -2.22045e-15}, {49.5, -2.22045e-15}, {49.5, 0}, {59, 0}}, color = {0, 0, 127}));
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Diagram(coordinateSystem(initialScale = 0.1)),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
        __OpenModelica_simulationFlags(
          jacobian="coloredNumerical",
          nls="newton",
          s="dassl",
          lv="LOG_STATS"));
    end SimpleCell;

    model SimpleCellVoltageSource
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Ramp rampCurrent(duration = 0.6, height = moduleData.VocCellRef + moduleData.BvCell, offset = -moduleData.BvCell, startTime = 0.2) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      PhotoVoltaics.Components.SimpleCell cell(moduleData = moduleData) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
        Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(signalVoltage.n, ground.p) annotation (
        Line(points = {{40, -10}, {40, -10}, {40, -20}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(signalVoltage.p, cell.p) annotation (
        Line(points = {{40, 10}, {40, 10}, {40, 20}, {0, 20}, {0, 10}, {0, 10}}, color = {0, 0, 255}));
      connect(ground.p, cell.n) annotation (
        Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
      connect(signalVoltage.v, rampCurrent.y) annotation (
        Line(points = {{47, 0}, {59, 0}, {59, 0}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Diagram(coordinateSystem(initialScale = 0.1)),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
        __OpenModelica_simulationFlags(
          jacobian="coloredNumerical",
          nls="newton",
          s="dassl",
          lv="LOG_STATS"));
    end SimpleCellVoltageSource;

    model SimpleCellIrradianceCharacteristic "Voltage current characteristic for different irradiances"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
      PhotoVoltaics.Components.SimpleCell cell(useConstantIrradiance = false, moduleData = moduleData) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Sources.Blocks.TriangleAndStep triangleAndStep(T = 1, stepHeight = 1000, triangleHeight = 8, triangleOffset = -4) annotation (
        Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.Blocks.Power10 power10(k = moduleData.VocCellRef / moduleData.IscRef) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(variableResistor.n, ground.p) annotation (
        Line(points = {{40, -10}, {40, -10}, {40, -20}, {0, -20}, {0, -30}}, color = {0, 0, 255}));
      connect(cell.p, variableResistor.p) annotation (
        Line(points = {{0, 10}, {0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, cell.n) annotation (
        Line(points = {{0, -30}, {0, -18}, {0, -10}, {-1.77636e-15, -10}}, color = {0, 0, 255}));
      connect(triangleAndStep.step, cell.variableIrradiance) annotation (
        Line(points = {{-49, 6}, {-30, 6}, {-30, 0}, {-12, 0}}, color = {0, 0, 127}));
      connect(triangleAndStep.triangle, power10.u) annotation (
        Line(points = {{-49, -6}, {-30, -6}, {-30, -60}, {92, -60}, {92, 0}, {82, 0}}, color = {0, 0, 127}));
      connect(variableResistor.R, power10.y) annotation (
        Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Diagram(coordinateSystem(initialScale = 0.1)),
        Documentation(info = "<html>
<p>This example demonstrates the dependency of the voltage current characteristic of photo voltaic cell 
as a function of irradiance. Investigate the following plots:</p>
<ul>
<li><code>cell.iGenerating</code> on the vertical axis and <code>cell.v</code> 
on the horizontal axis</li>
<li><code>cell.power</code> on the vertical axis and <code>cell.v</code> 
on the horizontal axis</li>
</ul>
</html>"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.0001),
        __OpenModelica_simulationFlags(
          jacobian="coloredNumerical",
          nls="newton",
          s="dassl",
          lv="LOG_STATS"));
    end SimpleCellIrradianceCharacteristic;

    model SimpleCellTemperatureCharacteristic "Voltage current characteristic for different temperatures"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
      PhotoVoltaics.Components.SimpleCell cell(moduleData = moduleData, useHeatPort = true, useConstantIrradiance = true) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Sources.Blocks.TriangleAndStep triangleAndStep(T = 1, triangleHeight = 8, triangleOffset = -4, stepNumber = 5, stepOffset = 293.15 - 40, stepHeight = 60) annotation (
        Placement(visible = true, transformation(origin = {-70, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.Blocks.Power10 power10(k = moduleData.VocCellRef / moduleData.IscRef) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation (
        Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(variableResistor.n, ground.p) annotation (
        Line(points = {{40, -10}, {40, -10}, {40, -20}, {0, -20}, {0, -30}}, color = {0, 0, 255}));
      connect(cell.p, variableResistor.p) annotation (
        Line(points = {{0, 10}, {0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, cell.n) annotation (
        Line(points = {{0, -30}, {0, -18}, {0, -10}, {-1.77636e-15, -10}}, color = {0, 0, 255}));
      connect(triangleAndStep.triangle, power10.u) annotation (
        Line(points = {{-59, -8}, {-50, -8}, {-50, -60}, {92, -60}, {92, 0}, {82, 0}}, color = {0, 0, 127}));
      connect(variableResistor.R, power10.y) annotation (
        Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
      connect(prescribedTemperature.port, cell.heatPort) annotation (
        Line(points = {{-20, 10}, {-16, 10}, {-10, 10}}, color = {191, 0, 0}));
      connect(triangleAndStep.step, prescribedTemperature.T) annotation (
        Line(points = {{-59, 4}, {-50, 4}, {-50, 10}, {-42, 10}}, color = {0, 0, 127}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Diagram(coordinateSystem(initialScale = 0.1)),
        Documentation(info = "<html>
<p>This example demonstrates the dependency of the voltage current characteristic of photo voltaic cell 
as a function of irradiance. Investigate the following plots:</p>
<ul>
<li><code>cell.iGenerating</code> on the vertical axis and <code>cell.v</code> 
on the horizontal axis</li>
<li><code>cell.power</code> on the vertical axis and <code>cell.v</code> 
on the horizontal axis</li>
</ul>
</html>"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.0001),
        __OpenModelica_simulationFlags(
          jacobian="coloredNumerical",
          nls="newton",
          s="dassl",
          lv="LOG_STATS"));
    end SimpleCellTemperatureCharacteristic;

    model SimpleModule
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      PhotoVoltaics.Components.SimpleModule module(T = 298.15, moduleData = moduleData,
        cell(v(start=zeros(moduleData.ns)))) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
        Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(module.p, variableResistor.p) annotation (
        Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, module.n) annotation (
        Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
      connect(variableResistor.n, ground.p) annotation (
        Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(variableResistor.R, powerRamp.y) annotation (
        Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
      annotation (
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
        __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
    end SimpleModule;

    model SimpleModuleSymmetric "Simple symmetric module without freewheeling diodes"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.SimpleModuleSymmetric module(T = 298.15, moduleData = moduleData) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
        Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(variableResistor.n, ground.p) annotation (
        Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(module.p, variableResistor.p) annotation (
        Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(variableResistor.R, powerRamp.y) annotation (
        Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
      connect(ground.p, module.n) annotation (
        Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
      annotation (
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
        __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
    end SimpleModuleSymmetric;

    model SimplePlantSymmetric "Simple symmetric plant"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.SimplePlantSymmetric plant(moduleData = moduleData, T = 298.15, nsModule = 10, npModule = 2) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
        Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(variableResistor.n, ground.p) annotation (
        Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(plant.p, variableResistor.p) annotation (
        Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(variableResistor.R, powerRamp.y) annotation (
        Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
      connect(ground.p, plant.n) annotation (
        Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
      annotation (
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
        __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
    end SimplePlantSymmetric;

    model SimpleModuleShadow
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation (
        Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.SimpleModule module(moduleData = moduleData, T = 298.15,shadow = cat(1, fill(0.2, 1), fill(0, moduleData.ns - 1)),
        cell(v(start=zeros(moduleData.ns))),diode(i(start=fill(1E-11,moduleData.nb)))) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation (
        Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Sources.Blocks.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation (
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
            Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

    equation
      connect(powerRamp.y, variableResistor.R) annotation (
        Line(points = {{59, 0}, {51, 0}}, color = {0, 0, 127}));
      connect(variableResistor.n, ground.p) annotation (
        Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(module.p, variableResistor.p) annotation (
        Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, module.n) annotation (
        Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Diagram(coordinateSystem(initialScale = 0.1)),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
      __OpenModelica_simulationFlags(jacobian = "coloredNumerical", nls = "newton", s = "dassl", lv = "LOG_STATS"));
    end SimpleModuleShadow;

    model SimpleModuleMP
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
        Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.SimpleModuleSymmetric module(moduleData = moduleData, T = 298.15, useConstantIrradiance = false) annotation (
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Modelica.Blocks.Sources.Ramp ramp(duration = 100, startTime = 100, height = 800, offset = 200) annotation (
        Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
      Components.SinglePhaseVoltageControlledConverter converter annotation (
        Placement(transformation(extent = {{20, -10}, {40, 10}})));
      Components.Blocks.MPTrackerSample mpTracker(VmpRef = moduleData.VmpRef, ImpRef = moduleData.ImpRef) annotation (
        Placement(transformation(extent = {{0, -60}, {20, -40}})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
        Placement(transformation(extent = {{70, -40}, {90, -20}})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource(f = 50, V = 230, phi = 0) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, 0})));
      Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
        Placement(transformation(extent = {{-20, 10}, {0, 30}})));
      parameter Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(transformation(extent = {{60, 60}, {80, 80}})));
    equation
      connect(groundDC.p, module.n) annotation (
        Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
      connect(ramp.y, module.variableIrradiance) annotation (
        Line(points = {{-59, 0}, {-52, 0}}, color = {0, 0, 127}));
      connect(groundDC.p, converter.dc_n) annotation (
        Line(points = {{-40, -20}, {-40, -20}, {20, -20}, {20, -10}}, color = {0, 0, 255}));
      connect(mpTracker.vRef, converter.vDCRef) annotation (
        Line(points = {{21, -50}, {30, -50}, {30, -12}}, color = {0, 0, 127}));
      connect(converter.ac_n, groundAC.pin) annotation (
        Line(points = {{40, -10}, {40, -20}, {80, -20}}, color = {85, 170, 255}));
      connect(groundAC.pin, voltageSource.pin_n) annotation (
        Line(points = {{80, -20}, {80, -20}, {80, -10}}, color = {85, 170, 255}));
      connect(module.p, powerSensor.pc) annotation (
        Line(points = {{-40, 10}, {-40, 10}, {-40, 20}, {-20, 20}}, color = {0, 0, 255}));
      connect(powerSensor.nc, converter.dc_p) annotation (
        Line(points = {{0, 20}, {0, 20}, {20, 20}, {20, 10}}, color = {0, 0, 255}));
      connect(mpTracker.power, powerSensor.power) annotation (
        Line(points = {{-2, -50}, {-2, -50}, {-18, -50}, {-18, 9}}, color = {0, 0, 127}));
      connect(powerSensor.pc, powerSensor.pv) annotation (
        Line(points = {{-20, 20}, {-20, 30}, {-10, 30}}, color = {0, 0, 255}));
      connect(powerSensor.nv, groundDC.p) annotation (
        Line(points = {{-10, 10}, {-10, 10}, {-10, -18}, {-10, -20}, {-40, -20}}, color = {0, 0, 255}));
      connect(converter.ac_p, voltageSource.pin_p) annotation (
        Line(points = {{40, 10}, {40, 10}, {40, 20}, {80, 20}, {80, 10}}, color = {85, 170, 255}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Diagram(coordinateSystem(initialScale = 0.1)),
        experiment(StopTime = 300, Interval = 0.1, Tolerance = 1e-06, StartTime = 0),
        __OpenModelica_simulationFlags(
          jacobian="coloredNumerical",
          nls="newton",
          s="dassl",
          lv="LOG_STATS"));
    end SimpleModuleMP;

    model SimpleModuleMP3
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
        Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.SimpleModuleSymmetric module(moduleData = moduleData, T = 298.15, useConstantIrradiance = false) annotation (
        Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Modelica.Blocks.Sources.Ramp ramp(duration = 100, startTime = 100, height = 800, offset = 200) annotation (
        Placement(transformation(extent = {{-80, -10}, {-60, 10}})));
      Components.MultiPhaseVoltageControlledConverter converter annotation (
        Placement(transformation(extent = {{20, -10}, {40, 10}})));
      Components.Blocks.MPTrackerSample mpTracker(VmpRef = moduleData.VmpRef, ImpRef = moduleData.ImpRef) annotation (
        Placement(transformation(extent = {{0, -60}, {20, -40}})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundAC annotation (
        Placement(transformation(extent = {{70, -70}, {90, -50}})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource voltageSource(f = 50, V = fill(400 / sqrt(3), 3)) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, 0})));
      Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
        Placement(transformation(extent = {{-20, 10}, {0, 30}})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, -30})));
      parameter Records.SHARP_NU_S5_E3E moduleData annotation (
        Placement(transformation(extent = {{60, 60}, {80, 80}})));
    equation
      connect(groundDC.p, module.n) annotation (
        Line(points = {{-40, -20}, {-40, -10}}, color = {0, 0, 255}));
      connect(ramp.y, module.variableIrradiance) annotation (
        Line(points = {{-59, 0}, {-52, 0}}, color = {0, 0, 127}));
      connect(groundDC.p, converter.dc_n) annotation (
        Line(points = {{-40, -20}, {-40, -20}, {20, -20}, {20, -10}}, color = {0, 0, 255}));
      connect(mpTracker.vRef, converter.vDCRef) annotation (
        Line(points = {{21, -50}, {30, -50}, {30, -12}}, color = {0, 0, 127}));
      connect(module.p, powerSensor.pc) annotation (
        Line(points = {{-40, 10}, {-40, 10}, {-40, 20}, {-20, 20}}, color = {0, 0, 255}));
      connect(powerSensor.nc, converter.dc_p) annotation (
        Line(points = {{0, 20}, {0, 20}, {20, 20}, {20, 10}}, color = {0, 0, 255}));
      connect(mpTracker.power, powerSensor.power) annotation (
        Line(points = {{-2, -50}, {-2, -50}, {-18, -50}, {-18, 9}}, color = {0, 0, 127}));
      connect(powerSensor.pc, powerSensor.pv) annotation (
        Line(points = {{-20, 20}, {-20, 30}, {-10, 30}}, color = {0, 0, 255}));
      connect(powerSensor.nv, groundDC.p) annotation (
        Line(points = {{-10, 10}, {-10, 10}, {-10, -18}, {-10, -20}, {-40, -20}}, color = {0, 0, 255}));
      connect(star.plug_p, voltageSource.plug_n) annotation (
        Line(points = {{80, -20}, {80, -15}, {80, -10}}, color = {85, 170, 255}));
      connect(star.pin_n, groundAC.pin) annotation (
        Line(points = {{80, -40}, {80, -40}, {80, -50}}, color = {85, 170, 255}));
      connect(converter.ac, voltageSource.plug_p) annotation (
        Line(points = {{40, 0}, {46, 0}, {46, 0}, {50, 0}, {50, 20}, {80, 20}, {80, 10}}, color = {85, 170, 255}));
      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
        Diagram(coordinateSystem(initialScale = 0.1)),
        experiment(StopTime = 300, Interval = 0.1, Tolerance = 1e-06, StartTime = 0),
        __OpenModelica_simulationFlags(
          jacobian="coloredNumerical",
          nls="newton",
          s="dassl",
          lv="LOG_STATS"));
    end SimpleModuleMP3;
    annotation (
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
  end Examples;

  package Components "Components"
    extends Modelica.Icons.Package;

    model SimpleCell
      extends PhotoVoltaics.Interfaces.PartialCell(signalCurrent(final irradianceRef = moduleData.irradianceRef, final alphaRef = moduleData.alphaIsc, final IRef = IphRef), diode(final Bv = moduleData.BvCell, final Ibv = moduleData.Ibv, final Nbv = moduleData.Nbv, final VRef = moduleData.VocCellRef, final IRef = moduleData.IscRef, final alphaI = moduleData.alphaIsc, final alphaV = moduleData.alphaVoc, final R = 1E8, final m = m, final ns = 1, final nsModule = 1, final npModule = 1));
      final parameter Real m(start = 1, fixed = false) "Ideality factor of diode";
      final parameter Modelica.SIunits.Current IsdRef(start = 1E-6, fixed = false) "Reference saturation current of cell";
      final parameter Modelica.SIunits.Current IphRef = moduleData.IscRef "Reference photo current of cell";
    initial equation
      IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
      IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
      annotation (
        defaultComponentName = "cell",
        Icon(coordinateSystem, graphics={  Polygon(points = {{-80, 60}, {-60, 80}, {60, 80}, {80, 60}, {80, -60}, {60, -80}, {-60, -80}, {-80, -60}, {-80, 60}}, pattern = LinePattern.None, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-40, 80}, {-40, -80}}, color = {255, 255, 255}), Line(points = {{40, 80}, {40, -80}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}));
    end SimpleCell;

    model SimpleModule "Simple module consisting of series connected cells"
      extends PhotoVoltaics.Interfaces.PartialComponent;
      parameter Real shadow[moduleData.ns] = zeros(moduleData.ns) "Shadow vector based on: 0 = full sun, 1 = full shadow";
      SimpleCell cell[moduleData.ns](final useHeatPort = fill(useHeatPort, moduleData.ns), final T = fill(T, moduleData.ns), final constantIrradiance = fill(constantIrradiance, moduleData.ns), final moduleData = fill(moduleData, moduleData.ns), final useConstantIrradiance = fill(false, moduleData.ns)) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalCollector collectorModule(final m = moduleData.ns) if useHeatPort annotation (
        Placement(transformation(extent = {{-10, -60}, {10, -40}})));
      Blocks.GainReplicator gainReplicator(final n = moduleData.ns, final k = PhotoVoltaics.Functions.limit(ones(moduleData.ns) - shadow, zeros(moduleData.ns), ones(moduleData.ns))) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 40})));
      Diodes.Diode diode[moduleData.nb](final useHeatPort = fill(useHeatPort, moduleData.nb), final T = fill(T, moduleData.nb), final m = fill(1, moduleData.nb), final R = fill(1E8, moduleData.nb), final TRef = fill(moduleData.TRef, moduleData.nb), final IRef = fill(moduleData.IscRef, moduleData.nb), final alphaI = fill(0, moduleData.nb), final alphaV = fill(0, moduleData.nb), final VRef = fill(0.5, moduleData.nb)) annotation (
        Placement(transformation(extent = {{-20, -30}, {-40, -10}})));
      Modelica.Thermal.HeatTransfer.Components.ThermalCollector collectorByPass(final m = moduleData.nb) if useHeatPort annotation (
        Placement(transformation(extent = {{-40, -60}, {-20, -40}})));
    equation
      assert(mod(moduleData.ns, moduleData.nb) == 0, "Simple: number of bypassed cells cannot be determined unambiguously");
      // Connect cells to module
      connect(p, cell[1].p) annotation (
        Line(points = {{-100, 0}, {-100, 0}, {-10, 0}}, color = {0, 0, 255}));
      for k in 1:moduleData.ns - 1 loop
        connect(cell[k].n, cell[k + 1].p);
      end for;
      // Inter-module connections
      connect(cell[moduleData.ns].n, n) annotation (
        Line(points = {{10, 0}, {100, 0}}, color = {0, 0, 255}));
      connect(cell.heatPort, collectorModule.port_a) annotation (
        Line(points = {{-10, -10}, {-10, -18}, {-10, -30}, {0, -30}, {0, -40}}, color = {191, 0, 0}));
      connect(collectorModule.port_b, heatPort) annotation (
        Line(points = {{0, -60}, {0, -100}, {-100, -100}}, color = {191, 0, 0}));
      connect(irradiance, gainReplicator.u) annotation (
        Line(points = {{0, 70}, {0, 70}, {0, 52}}, color = {0, 0, 127}));
      connect(gainReplicator.y, cell.variableIrradiance) annotation (
        Line(points = {{0, 29}, {0, 12}}, color = {0, 0, 127}));
      // Connect bypass diodes
      for k in 1:moduleData.nb loop
        connect(diode[k].n, cell[(k - 1) * div(moduleData.ns, moduleData.nb) + 1].p) annotation (
          Line(points = {{-40, -20}, {-50, -20}, {-60, -20}, {-60, 0}, {-10, 0}}, color = {0, 0, 255}));
        connect(diode[k].p, cell[k * div(moduleData.ns, moduleData.nb)].n) annotation (
          Line(points = {{-20, -20}, {20, -20}, {60, -20}, {60, 0}, {10, 0}}, color = {0, 0, 255}));
      end for;
      connect(collectorByPass.port_a, diode.heatPort) annotation (
        Line(points = {{-30, -40}, {-30, -30}}, color = {191, 0, 0}));
      connect(collectorByPass.port_b, heatPort) annotation (
        Line(points = {{-30, -60}, {-30, -60}, {-30, -96}, {-30, -100}, {-100, -100}}, color = {191, 0, 0}));
      annotation (
        defaultComponentName = "module",
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {0, 0, 0}, fillPattern = FillPattern.VerticalCylinder, extent = {{-76, 76}, {76, -76}}, fillColor = {85, 85, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {255, 255, 255}), Rectangle(extent = {{-84, 84}, {84, -84}}, lineColor = {0, 0, 0}), Polygon(points = {{-84, 76}, {-76, 84}, {-68, 76}, {-76, 68}, {-84, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-24, 76}, {-24, -76}}, color = {255, 255, 255}), Polygon(points = {{-8, 76}, {0, 84}, {8, 76}, {0, 68}, {-8, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 76}, {76, 84}, {84, 76}, {76, 68}, {68, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 0}, {76, 8}, {84, 0}, {76, -8}, {68, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, -76}, {76, -68}, {84, -76}, {76, -84}, {68, -76}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, -76}, {-76, -68}, {-68, -76}, {-76, -84}, {-84, -76}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-54, 76}, {-54, -76}}, color = {255, 255, 255}), Polygon(points = {{-84, 0}, {-76, 8}, {-68, 0}, {-76, -8}, {-84, 0}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, 0}, {0, 8}, {8, 0}, {0, -8}, {-8, 0}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, -76}, {0, -68}, {8, -76}, {0, -84}, {-8, -76}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{0, 76}, {0, -76}}, color = {255, 255, 255}), Line(points = {{24, 76}, {24, -76}}, color = {255, 255, 255}), Line(points = {{54, 76}, {54, -76}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}));
    end SimpleModule;

    model SimpleModuleSymmetric "Simple module consisting of symmetric series connected cells"
      extends PhotoVoltaics.Interfaces.PartialCell(diode(final m = m, final R = 1E8, final Bv = moduleData.BvCell, final Ibv = moduleData.Ibv, final Nbv = moduleData.Nbv, final IRef = moduleData.IscRef, final alphaI = moduleData.alphaIsc, final alphaV = moduleData.alphaVoc, final ns = moduleData.ns, final VRef = moduleData.VocCellRef, final nsModule = 1, final npModule = 1), signalCurrent(final IRef = IphRef, final irradianceRef = moduleData.irradianceRef, final alphaRef = moduleData.alphaIsc));
      parameter Real shadow = 0 "Shadow based on: 0 = full sun, 1 = full shadow";
      final parameter Real m(start = 1, fixed = false) "Ideality factor of diode";
      final parameter Modelica.SIunits.Current IsdRef(start = 1E-6, fixed = false) "Reference saturation current of cell";
      final parameter Modelica.SIunits.Current IphRef = moduleData.IscRef "Reference photo current of cell";
      Modelica.SIunits.Voltage vCell = v / moduleData.ns "Cell voltage";
      Modelica.SIunits.Current iCell = i "Cell current";
      Modelica.SIunits.Current iCellGenerating = -iCell "Negative cell current (generating)";
      Modelica.SIunits.Power powerCell = vCell * iCell "Cell power";
      Modelica.SIunits.Power powerCellGenerating = vCell * iCellGenerating "Negative power consumption (generating)";
    initial equation
      IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
      IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
      annotation (
        defaultComponentName = "module",
        Icon(graphics={  Rectangle(lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-76, 76}, {76, -76}}, fillColor = {85, 85, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {255, 255, 255}), Rectangle(extent = {{-84, 84}, {84, -84}}, lineColor = {0, 0, 0}), Polygon(points = {{-84, 76}, {-76, 84}, {-68, 76}, {-76, 68}, {-84, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-24, 76}, {-24, -76}}, color = {255, 255, 255}), Polygon(points = {{-8, 76}, {0, 84}, {8, 76}, {0, 68}, {-8, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 76}, {76, 84}, {84, 76}, {76, 68}, {68, 76}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, 0}, {76, 8}, {84, 0}, {76, -8}, {68, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{68, -76}, {76, -68}, {84, -76}, {76, -84}, {68, -76}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, -76}, {-76, -68}, {-68, -76}, {-76, -84}, {-84, -76}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-54, 76}, {-54, -76}}, color = {255, 255, 255}), Polygon(points = {{-84, 0}, {-76, 8}, {-68, 0}, {-76, -8}, {-84, 0}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, 0}, {0, 8}, {8, 0}, {0, -8}, {-8, 0}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-8, -76}, {0, -68}, {8, -76}, {0, -84}, {-8, -76}}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid, pattern = LinePattern.None), Line(points = {{0, 76}, {0, -76}}, color = {255, 255, 255}), Line(points = {{24, 76}, {24, -76}}, color = {255, 255, 255}), Line(points = {{54, 76}, {54, -76}}, color = {255, 255, 255}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255})}));
    end SimpleModuleSymmetric;

    model SimplePlantSymmetric "Simple plant consisting of symmetric series and parallel connected modules"
      extends PhotoVoltaics.Interfaces.PartialCell(diode(final m = m, final R = 1E8, final Bv = moduleData.BvCell, final Ibv = moduleData.Ibv, final Nbv = moduleData.Nbv, final IRef = moduleData.IscRef, final alphaI = moduleData.alphaIsc, final alphaV = moduleData.alphaVoc, final ns = moduleData.ns, final VRef = moduleData.VocCellRef, final nsModule = nsModule, final npModule = npModule), signalCurrent(final irradianceRef = moduleData.irradianceRef, final alphaRef = moduleData.alphaIsc, final IRef = npModule * IphRef));
      parameter Integer nsModule(final min = 1) = 1 "Number of series connected modules";
      parameter Integer npModule(final min = 1) = 1 "Number of parallel connected modules";
      parameter Real shadow = 0 "Shadow based on: 0 = full sun, 1 = full shadow";
      final parameter Real m(start = 1, fixed = false) "Ideality factor of diode";
      final parameter Modelica.SIunits.Current IsdRef(start = 1E-6, fixed = false) "Reference saturation current of cell";
      final parameter Modelica.SIunits.Current IphRef = moduleData.IscRef "Reference photo current of cell";
      Modelica.SIunits.Voltage vCell = v / moduleData.ns / nsModule "Cell voltage";
      Modelica.SIunits.Current iCell = i / npModule "Cell current";
      Modelica.SIunits.Current iCellGenerating = -iCell "Negative cell current (generating)";
      Modelica.SIunits.Power powerCell = vCell * iCell "Cell power";
      Modelica.SIunits.Power powerCellGenerating = vCell * iCellGenerating "Negative power consumption (generating)";
      Modelica.SIunits.Voltage vModule = v / nsModule "Module voltage";
      Modelica.SIunits.Current iModule = i / npModule "Modile current";
      Modelica.SIunits.Current iModuleGenerating = -iModule "Negative module current (generating)";
      Modelica.SIunits.Power powerModule = vModule * iModule "Module power";
      Modelica.SIunits.Power powerModuleGenerating = vModule * iModuleGenerating "Negative module power (generating)";
    initial equation
      IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
      IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
      annotation (
        Icon(graphics={  Rectangle(extent = {{-84, 82}, {-8, 8}}, lineColor = {0, 0, 0}), Text(extent = {{-150, -150}, {150, -110}}, textString = "%name", lineColor = {0, 0, 255}), Rectangle(extent = {{-76, 74}, {-16, 16}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-46, 76}, {-46, 16}}, color = {255, 255, 255}), Line(points = {{-76, 46}, {-16, 46}}, color = {255, 255, 255}), Rectangle(extent = {{8, 82}, {84, 8}}, lineColor = {0, 0, 0}), Rectangle(extent = {{16, 74}, {76, 16}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{46, 76}, {46, 16}}, color = {255, 255, 255}), Line(points = {{16, 46}, {76, 46}}, color = {255, 255, 255}), Rectangle(extent = {{-84, -8}, {-8, -82}}, lineColor = {0, 0, 0}), Rectangle(extent = {{-76, -16}, {-16, -74}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-46, -14}, {-46, -74}}, color = {255, 255, 255}), Line(points = {{-76, -44}, {-16, -44}}, color = {255, 255, 255}), Rectangle(extent = {{8, -8}, {84, -82}}, lineColor = {0, 0, 0}), Rectangle(extent = {{16, -16}, {76, -74}}, lineColor = {255, 255, 255}, fillColor = {85, 85, 255},
                fillPattern =                                                                                                                                                                                                        FillPattern.Solid), Line(points = {{46, -16}, {46, -74}}, color = {255, 255, 255}), Line(points = {{16, -44}, {76, -44}}, color = {255, 255, 255})}));
    end SimplePlantSymmetric;

    model SinglePhaseVoltageControlledConverter "Ideal current controlled single phase DC/AC converter"
      extends Modelica.Electrical.PowerConverters.Interfaces.DCAC.DCtwoPin;
      extends PhotoVoltaics.Interfaces.QuasiStatic.ACpins;
      parameter Modelica.SIunits.Voltage VRef = 400 / sqrt(3) "Reference voltage";
      parameter Modelica.SIunits.Time T = 1E-6 "Internal integration time constant";
      Modelica.SIunits.Power powerDC = vDC * iDC "Power of DC side";
      Modelica.SIunits.Power powerAC = Modelica.ComplexMath.real(vAC * Modelica.ComplexMath.conj(iAC)) "Complex apparent power of AC side";
      Modelica.Blocks.Interfaces.RealInput vDCRef(final unit = "V") "DC voltage" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-90, 0})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {-90, 60})));
      Modelica.Blocks.Math.Product product annotation (
        Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
      Modelica.Blocks.Math.Feedback feedback annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {-30, 0})));
      Sources.Electrical.VariableUnrootedSinglePhaseCurrentSource variableCurrentSource annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {90, 30})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor powerSensor annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {90, 60})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor potentialSensor annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {60, 10})));
      Modelica.ComplexBlocks.ComplexMath.ComplexToReal complexToReal annotation (
        Placement(transformation(extent = {{40, 60}, {20, 80}})));
      Modelica.Blocks.Continuous.Integrator integrator(k = 1 / VRef / T) annotation (
        Placement(transformation(extent = {{-30, -60}, {-10, -40}})));
      Modelica.ComplexBlocks.ComplexMath.ComplexToPolar complexToPolar annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, -20})));
      Modelica.ComplexBlocks.ComplexMath.PolarToComplex polarToComplex annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {10, -20})));
      Modelica.Blocks.Math.Gain gain(final k = -1) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-10, 50})));
    equation
      connect(signalVoltage.n, dc_n) annotation (
        Line(points = {{-90, -10}, {-90, -70}, {-90, -100}, {-100, -100}}, color = {0, 0, 255}));
      connect(currentSensor.p, dc_p) annotation (
        Line(points = {{-90, 70}, {-90, 70}, {-90, 76}, {-90, 100}, {-100, 100}}, color = {0, 0, 255}));
      connect(currentSensor.n, signalVoltage.p) annotation (
        Line(points = {{-90, 50}, {-90, 50}, {-90, 10}}, color = {0, 0, 255}));
      connect(signalVoltage.v, vDCRef) annotation (
        Line(points = {{-83, 0}, {-70, 0}, {-70, -80}, {0, -80}, {0, -120}}, color = {0, 0, 127}));
      connect(currentSensor.i, product.u1) annotation (
        Line(points = {{-80, 60}, {-76, 60}, {-70, 60}, {-70, 36}, {-62, 36}}, color = {0, 0, 127}));
      connect(vDCRef, product.u2) annotation (
        Line(points = {{0, -120}, {0, -120}, {0, -94}, {0, -94}, {0, -80}, {-70, -80}, {-70, 24}, {-62, 24}}, color = {0, 0, 127}));
      connect(product.y, feedback.u1) annotation (
        Line(points = {{-39, 30}, {-30, 30}, {-30, 8}}, color = {0, 0, 127}));
      connect(powerSensor.currentP, powerSensor.voltageP) annotation (
        Line(points = {{90, 70}, {100, 70}, {100, 60}}, color = {85, 170, 255}));
      connect(complexToReal.u, powerSensor.y) annotation (
        Line(points = {{42, 70}, {42, 70}, {74, 70}, {74, 68}, {79, 68}}, color = {85, 170, 255}));
      connect(feedback.y, integrator.u) annotation (
        Line(points = {{-30, -9}, {-30, -9}, {-30, -20}, {-50, -20}, {-50, -50}, {-32, -50}}, color = {0, 0, 127}));
      connect(powerSensor.currentP, ac_p) annotation (
        Line(points = {{90, 70}, {90, 70}, {90, 88}, {90, 100}, {100, 100}}, color = {85, 170, 255}));
      connect(potentialSensor.pin_p, ac_p) annotation (
        Line(points = {{60, 20}, {60, 100}, {100, 100}}, color = {85, 170, 255}));
      connect(potentialSensor.pin_n, ac_n) annotation (
        Line(points = {{60, 0}, {60, -100}, {100, -100}}, color = {85, 170, 255}));
      connect(powerSensor.voltageN, ac_n) annotation (
        Line(points = {{80, 60}, {80, 60}, {74, 60}, {74, -100}, {100, -100}}, color = {85, 170, 255}));
      connect(complexToPolar.u, potentialSensor.y) annotation (
        Line(points = {{40, -8}, {40, 10}, {49, 10}}, color = {85, 170, 255}));
      connect(polarToComplex.y, variableCurrentSource.I) annotation (
        Line(points = {{10, -9}, {10, 30}, {80, 30}}, color = {85, 170, 255}));
      connect(integrator.y, polarToComplex.len) annotation (
        Line(points = {{-9, -50}, {4, -50}, {4, -32}}, color = {0, 0, 127}));
      connect(polarToComplex.phi, complexToPolar.phi) annotation (
        Line(points = {{16, -32}, {16, -50}, {34, -50}, {34, -32}}, color = {0, 0, 127}));
      connect(gain.u, complexToReal.re) annotation (
        Line(points = {{-10, 62}, {-10, 62}, {-10, 76}, {18, 76}}, color = {0, 0, 127}));
      connect(gain.y, feedback.u2) annotation (
        Line(points = {{-10, 39}, {-10, 39}, {-10, 2}, {-10, 0}, {-22, 0}}, color = {0, 0, 127}));
      connect(powerSensor.currentN, variableCurrentSource.pin_n) annotation (
        Line(points = {{90, 50}, {90, 40}, {90, 40}}, color = {85, 170, 255}));
      connect(variableCurrentSource.pin_p, ac_n) annotation (
        Line(points = {{90, 20}, {90, -100}, {100, -100}}, color = {85, 170, 255}));
      annotation (
        defaultComponentName = "converter",
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}), Line(points = {{-100, -100}, {100, 100}}, color = {0, 0, 127}, smooth = Smooth.None), Text(extent = {{-100, 40}, {-40, -40}}, lineColor = {0, 0, 255}, textString = "="), Text(extent = {{40, 40}, {100, -40}}, lineColor = {0, 0, 255}, textString = "~"), Text(extent = {{-150, 150}, {150, 110}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{20, -100}, {80, -140}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "vDCRef"), Text(extent = {{-80, 80}, {20, 40}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "load"), Text(extent = {{-40, -40}, {60, -80}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "src")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Documentation(info = "<html>
<p>This is an ideal DC/DC converter.<p>
<ul>
<li><b>side 1</b> must be connected with voltage source</li>
<li><b>side 2</b> must be connected with load</li>
</ul>
<p>Signal input <code>i2</code> is the current flowing into the positive pin of side 2. 
In order to operate side 2 as a load the signal input current <code>i2</code> must be <b>negative</b>.</p>
</html>"));
    end SinglePhaseVoltageControlledConverter;

    model MultiPhaseVoltageControlledConverter "Ideal current controlled multi phase DC/AC converter"
      extends Modelica.Electrical.PowerConverters.Interfaces.DCAC.DCtwoPin;
      extends PhotoVoltaics.Interfaces.QuasiStatic.ACplug;
      parameter Modelica.SIunits.Voltage VRef = 400 "Reference line to line voltage";
      parameter Modelica.SIunits.Time T = 1E-6 "Internal integration time constant";
      Modelica.SIunits.Power powerDC = vDC * iDC "Power of DC side";
      Modelica.SIunits.Power powerAC = Modelica.ComplexMath.real(vAC * Modelica.ComplexMath.conj(iAC)) "Complex apparent power of AC side";
      Modelica.Blocks.Interfaces.RealInput vDCRef(final unit = "V") "DC voltage" annotation (
        Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -120})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-90, 0})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {-90, 60})));
      Modelica.Blocks.Math.Product product annotation (
        Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
      Modelica.Blocks.Math.Feedback feedback annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {-30, 0})));
      Sources.Electrical.VariableUnrootedMultiPhaseCurrentSource variableCurrentSource(final m = m) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {50, 30})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(final m = m) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {50, 0})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor powerSensor(final m = m) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {50, 60})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PotentialSensor potentialSensor(final m = m) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {80, -10})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Blocks.ToSpacePhasor toSpacePhasor(final m = m) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {60, -50})));
      Modelica.ComplexBlocks.ComplexMath.ComplexToReal complexToReal annotation (
        Placement(transformation(extent = {{20, 60}, {0, 80}})));
      Modelica.Electrical.QuasiStationary.MultiPhase.Blocks.FromSpacePhasor fromSpacePhasor(final m = m) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {10, 10})));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.FromPolar fromPolar annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {10, -20})));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToPolar toPolar annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {30, -50})));
      Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground annotation (
        Placement(transformation(extent = {{40, -40}, {60, -20}})));
      Modelica.Blocks.Continuous.Integrator integrator(k = sqrt(3) / VRef / T) annotation (
        Placement(transformation(extent = {{-30, -60}, {-10, -40}})));
      Modelica.Blocks.Math.Gain gain(final k = -1) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-10, 40})));
    equation
      connect(signalVoltage.n, dc_n) annotation (
        Line(points = {{-90, -10}, {-90, -80}, {-90, -100}, {-100, -100}}, color = {0, 0, 255}));
      connect(currentSensor.p, dc_p) annotation (
        Line(points = {{-90, 70}, {-90, 70}, {-90, 76}, {-90, 100}, {-100, 100}}, color = {0, 0, 255}));
      connect(currentSensor.n, signalVoltage.p) annotation (
        Line(points = {{-90, 50}, {-90, 50}, {-90, 10}}, color = {0, 0, 255}));
      connect(signalVoltage.v, vDCRef) annotation (
        Line(points = {{-83, 0}, {-70, 0}, {-70, -80}, {0, -80}, {0, -120}}, color = {0, 0, 127}));
      connect(currentSensor.i, product.u1) annotation (
        Line(points = {{-80, 60}, {-76, 60}, {-70, 60}, {-70, 36}, {-62, 36}}, color = {0, 0, 127}));
      connect(vDCRef, product.u2) annotation (
        Line(points = {{0, -120}, {0, -120}, {0, -114}, {0, -114}, {0, -80}, {-70, -80}, {-70, 24}, {-62, 24}}, color = {0, 0, 127}));
      connect(product.y, feedback.u1) annotation (
        Line(points = {{-39, 30}, {-30, 30}, {-30, 8}}, color = {0, 0, 127}));
      connect(powerSensor.currentP, powerSensor.voltageP) annotation (
        Line(points = {{50, 70}, {60, 70}, {60, 60}}, color = {85, 170, 255}));
      connect(powerSensor.voltageN, star.plug_p) annotation (
        Line(points = {{40, 60}, {30, 60}, {30, 10}, {50, 10}}, color = {85, 170, 255}));
      connect(potentialSensor.y, toSpacePhasor.u) annotation (
        Line(points = {{80, -21}, {80, -50}, {72, -50}}, color = {85, 170, 255}));
      connect(complexToReal.u, powerSensor.y) annotation (
        Line(points = {{22, 70}, {30, 70}, {30, 68}, {39, 68}}, color = {85, 170, 255}));
      connect(fromSpacePhasor.y, variableCurrentSource.I) annotation (
        Line(points = {{10, 21}, {10, 30}, {40, 30}}, color = {85, 170, 255}));
      connect(fromSpacePhasor.u, fromPolar.y) annotation (
        Line(points = {{10, -2}, {10, -9}}, color = {0, 0, 127}));
      connect(integrator.y, fromPolar.u[1]) annotation (
        Line(points = {{-9, -50}, {10, -50}, {10, -32}}, color = {0, 0, 127}));
      connect(toSpacePhasor.y, toPolar.u) annotation (
        Line(points = {{49, -50}, {49, -50}, {42, -50}}, color = {0, 0, 127}));
      connect(toPolar.y[2], fromPolar.u[2]) annotation (
        Line(points = {{19, -50}, {19, -50}, {10, -50}, {10, -32}, {10, -32}}, color = {0, 0, 127}));
      connect(star.pin_n, ground.pin) annotation (
        Line(points = {{50, -10}, {50, -20}}, color = {85, 170, 255}));
      connect(powerSensor.currentP, ac) annotation (
        Line(points = {{50, 70}, {50, 90}, {100, 90}, {100, 0}}, color = {85, 170, 255}));
      connect(potentialSensor.plug_p, ac) annotation (
        Line(points = {{80, 0}, {100, 0}}, color = {85, 170, 255}));
      connect(feedback.y, integrator.u) annotation (
        Line(points = {{-30, -9}, {-30, -9}, {-30, -20}, {-50, -20}, {-50, -50}, {-32, -50}}, color = {0, 0, 127}));
      connect(powerSensor.currentN, variableCurrentSource.plug_n) annotation (
        Line(points = {{50, 50}, {50, 45}, {50, 40}}, color = {85, 170, 255}));
      connect(variableCurrentSource.plug_p, star.plug_p) annotation (
        Line(points = {{50, 20}, {50, 15}, {50, 10}}, color = {85, 170, 255}));
      connect(gain.u, complexToReal.re) annotation (
        Line(points = {{-10, 52}, {-10, 76}, {-2, 76}}, color = {0, 0, 127}));
      connect(gain.y, feedback.u2) annotation (
        Line(points = {{-10, 29}, {-10, 0}, {-22, 0}}, color = {0, 0, 127}));
      annotation (
        defaultComponentName = "converter",
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}), Line(points = {{-100, -100}, {100, 100}}, color = {0, 0, 127}, smooth = Smooth.None), Text(extent = {{-100, 40}, {-40, -40}}, lineColor = {0, 0, 255}, textString = "="), Text(extent = {{40, 40}, {100, -40}}, lineColor = {0, 0, 255}, textString = "~"), Text(extent = {{-150, 150}, {150, 110}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{20, -100}, {80, -140}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "vDCRef"), Text(extent = {{-80, 80}, {20, 40}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "load"), Text(extent = {{-40, -40}, {60, -80}}, lineColor = {0, 0, 255}, pattern = LinePattern.Dash, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "src")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Documentation(info = "<html>
<p>This is an ideal DC/DC converter.<p>
<ul>
<li><b>side 1</b> must be connected with voltage source</li>
<li><b>side 2</b> must be connected with load</li>
</ul>
<p>Signal input <code>i2</code> is the current flowing into the positive pin of side 2. 
In order to operate side 2 as a load the signal input current <code>i2</code> must be <b>negative</b>.</p>
</html>"));
    end MultiPhaseVoltageControlledConverter;

    package Diodes "Diodes"
      extends Modelica.Icons.Package;

      model Diode "Diode with one exponential function"
        extends PhotoVoltaics.Interfaces.PartialDiode;
      equation
        i = Ids * (exp(v / m / Vt) - 1) + v / R;
        annotation (
          defaultComponentName = "diode",
          Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"),Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255})}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
      end Diode;

      model Diode2Module
        extends PhotoVoltaics.Interfaces.PartialDiode;
        parameter Modelica.SIunits.Voltage Bv = 5.1 "Breakthrough voltage";
        parameter Modelica.SIunits.Current Ibv = 0.7 "Breakthrough knee current";
        parameter Real Nbv = 0.74 "Breakthrough emission coefficient";
        parameter Integer ns = 1 "Number of series connected cells per module";
        parameter Integer nsModule(final min = 1) = 1 "Number of series connected modules";
        parameter Integer npModule(final min = 1) = 1 "Number of parallel connected modules";
        final parameter Modelica.SIunits.Voltage VtRef = Modelica.Constants.k * TRef / Q "Reference voltage equivalent of temperature";
        final parameter Modelica.SIunits.Voltage VBv = (-m * Nbv * log(IdsRef * Nbv / Ibv) * VtRef) - Bv "Voltage limit of approximation of breakthrough";
        final parameter Modelica.SIunits.Current IdsRef = IRef / (exp(VRef / m / VtRef) - 1) "Reference saturation current";
        final parameter Modelica.SIunits.Voltage VNegLin = (-VRef / m / VtRef * (Nbv * m * VtRef)) - Bv "Limit of linear range left of breakthrough";
        Modelica.SIunits.Voltage VNeg "Limit of linear negative voltage range";
        Modelica.SIunits.Voltage vCell = v / ns / nsModule "Cell voltage";
        Modelica.SIunits.Voltage vModule = v / nsModule "Module voltage";
        Modelica.SIunits.Current iModule = i / npModule "Module current";
      equation
        // Voltage limit of negative range
        VNeg = m * Vt * log(Vt / VtRef);
        // Current approximation
        i / npModule = smooth(1, if v / ns / nsModule > VNeg then Ids * (exp(v / ns / nsModule / m / Vt) - 1) + v / ns / nsModule / R elseif v / ns / nsModule > VBv then Ids * v / ns / nsModule / m / VtRef + v / ns / nsModule / R
         elseif v / ns / nsModule > VNegLin then (-Ibv * exp(-(v / ns / nsModule + Bv) / (Nbv * m * Vt))) + Ids * VBv / m / VtRef + v / ns / nsModule / R else Ids * v / ns / nsModule / m / Vt - Ibv * exp(VRef / m / VtRef) * (1 - (v / ns / nsModule + Bv) / (Nbv * m * Vt) - VRef / m / VtRef) + v / ns / nsModule / R);
        annotation (
          defaultComponentName = "diode",
          Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"),Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot), Polygon(points = {{-8, 46}, {-68, 86}, {-68, 6}, {-8, 46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-8, 86}, {-8, 6}}, color = {0, 0, 255}), Polygon(points = {{72, 46}, {12, 86}, {12, 6}, {72, 46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{72, 86}, {72, 6}}, color = {0, 0, 255}), Polygon(points = {{-8, -46}, {-68, -6}, {-68, -86}, {-8, -46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-8, -6}, {-8, -86}}, color = {0, 0, 255}), Polygon(points = {{72, -46}, {12, -6}, {12, -86}, {72, -46}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{72, -6}, {72, -86}}, color = {0, 0, 255}), Line(points = {{100, 46}, {100, -46}}, color = {28, 108, 200}), Line(points = {{-100, 46}, {-100, -46}}, color = {28, 108, 200}), Line(points = {{-100, 46}, {100, 46}}, color = {0, 0, 255}), Line(points = {{-100, -46}, {100, -46}}, color = {0, 0, 255})}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
      end Diode2Module;

      model Diode2exp "Diode with two superimposed exponential functions"
        extends PhotoVoltaics.Interfaces.PartialDiode;
        parameter Modelica.SIunits.Voltage Bv = 5.1 "Breakthrough voltage";
        parameter Modelica.SIunits.Current Ibv = 0.7 "Breakthrough knee current";
        parameter Real Nbv = 0.74 "Breakthrough emission coefficient";
      equation
        i = Ids * (exp(v / m / Vt) - 1) - Ibv * exp(-(v + Bv) / (Nbv * m * Vt)) + v / R;
        annotation (
          defaultComponentName = "diode",
          Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"),Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255}), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
      end Diode2exp;
    end Diodes;

    package Blocks "Blocks"
      extends Modelica.Icons.Package;

      block MPTrackerSample "Sampling maximum power tracker"
        extends Modelica.Blocks.Icons.Block;
        parameter Modelica.SIunits.Time startTime = 0 "Start time";
        parameter Modelica.SIunits.Time samplePeriod = 1 "Sample period";
        parameter Modelica.SIunits.Voltage VmpRef "Reference maximum power power of plant";
        parameter Modelica.SIunits.Current ImpRef "Reference maximum power current of plant";
        parameter Integer n = 100 "Number of voltage and power discretizations";
        final parameter Modelica.SIunits.Voltage dv = VmpRef / n "Voltage change and maximum deviation";
        final parameter Modelica.SIunits.Power dpower = VmpRef * ImpRef / n "Power change and maximum deviation";
        Boolean firstTrigger "First boolean sample trigger signal";
        // Boolean secondTrigger "Second boolean sample trigger signal";
        Boolean sampleTrigger "Boolean sample trigger signal";
        discrete Integer counter(final start = 0) "Sample counter";
        discrete Real signv(final start = -1) "Sign of voltage change";
        Modelica.Blocks.Interfaces.RealInput power(final unit = "W") "Power" annotation (
          Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
        Modelica.Blocks.Interfaces.RealOutput vRef(final unit = "V", final start = VmpRef) "Reference DC voltage" annotation (
          Placement(transformation(extent = {{100, -10}, {120, 10}})));
      algorithm
        sampleTrigger := sample(startTime, samplePeriod);
        when sampleTrigger then
          counter := pre(counter) + 1;
          firstTrigger := time <= startTime + samplePeriod / 2;
          vRef := pre(vRef) + signv * dv;
          if not firstTrigger and power < pre(power) then
            signv := -pre(signv);
          end if;
          if vRef <= 3 * dv then
            signv := 1;
          end if;
        end when;
        // Change direction of voltage derivative
        // Do not allow negative voltages
        annotation (
          defaultComponentName = "mpTracker",
          Documentation(info = "<html>
</html>"),Icon(graphics={  Line(points = {{-80, -78}, {-12, 20}, {12, 50}, {30, 64}, {44, 70}, {52, 68}, {60, 56}, {68, 22}, {80, -78}}, color = {0, 0, 0}, smooth = Smooth.Bezier), Ellipse(extent = {{34, 78}, {54, 58}}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(origin = {0, -10}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(origin = {0, 2}, points = {{-80, -80}, {-80, 68}}, color = {192, 192, 192}), Line(origin = {10, -78}, points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(origin = {-10, -78}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}})}));
      end MPTrackerSample;

      block GainReplicator "Output the product of a gain value with the input signal"
        parameter Integer n "Number of outputs";
        parameter Real k[n](start = ones(n)) "Gain value multiplied with input signal";
      public
        Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
          Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
        Modelica.Blocks.Interfaces.RealOutput y[n] "Output signal connectors" annotation (
          Placement(transformation(extent = {{100, -10}, {120, 10}})));
      equation
        y = k * u;
        annotation (
          Documentation(info = "<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, -100}, {-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, -140}, {150, -100}}, lineColor = {0, 0, 0}, textString = "k=%k"), Text(extent = {{-150, 140}, {150, 100}}, textString = "%name", lineColor = {0, 0, 255}), Ellipse(extent = {{-14, 16}, {16, -14}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Line(points = {{0, 0}, {100, 10}}, color = {0, 0, 127}), Line(points = {{0, 0}, {100, -10}}, color = {0, 0, 127}), Line(points = {{100, 0}, {-100, 0}}, color = {0, 0, 127})}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, -100}, {-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-76, 38}, {0, -34}}, textString = "k", lineColor = {0, 0, 255})}));
      end GainReplicator;

      model Power10
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Real k "Gain";
      equation
        y = k * 10 ^ u;
        annotation (
          Icon(coordinateSystem, graphics = {Polygon(origin = {-10, -40}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}), Line(origin = {10, -40}, points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Line(origin = {-18, 14}, rotation = 180, points = {{-79.6, -46}, {-76.8, -21.3}, {-75.2, -11.4}, {-72.8, -1.31}, {-69.5, 8.08}, {-64.7, 17.9}, {-57.5, 28}, {-47, 38.1}, {-31.8, 48.1}, {-10.1, 58}, {22.1, 66}, {62.7, 72.1}}, smooth = Smooth.Bezier), Polygon(origin = {80, -8}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(origin = {80, 0}, points = {{-80, -80}, {-80, 68}}, color = {192, 192, 192}), Text(origin = {-16, 62}, lineColor = {192, 192, 192}, extent = {{-30, -22}, {60, -70}}, textString = "10^")}),
          Documentation(info = "<html>
<p>This block calculates <code>y = k * 10^u</code> and
represents thus the inverse of 
<a href=\"modelica://Modelica.Blocks.Math.Log10\">Log10</a>.
</html>"),Diagram);
      end Power10;
    end Blocks;
  end Components;

  package Functions "Functions"
    extends Modelica.Icons.Package;

    function limit "Limit input u by uMin and uMax "
      extends Modelica.Icons.Function;
      input Real u "Input to be limited";
      input Real uMin "Minimum of input";
      input Real uMax "Maximum of input";
      output Real y "Limited input";
    algorithm
      y := if u > uMax then uMax else if u < uMin then uMin else u;
    end limit;

    function degree
      input Real rad "Angle in rad";
      output Real degree "Angle in degree";
    algorithm
      degree := rad * 180 / Modelica.Constants.pi;
    end degree;

    function rad
      input Real deg "Angle in degree";
      output Real rad "Angle in rad";
    algorithm
      rad := deg * Modelica.Constants.pi / 180;
    end rad;

    function dayOfTheYear
      input Integer day "Day";
      input Integer month "Month";
      input Integer year "Year";
      output Integer dayOfYear "Day of the year indicated by day, month, year";
    protected
      Boolean leapYear "Indicates leap year";
    algorithm
      leapYear := if mod(year, 4) == 0 then true else false;
      dayOfYear := day;
      dayOfYear := dayOfYear + (if month > 1 then 31 else 0);
      dayOfYear := dayOfYear + (if month > 2 then 28 + (if leapYear then 1 else 0) else 0);
      dayOfYear := dayOfYear + (if month > 3 then 31 else 0);
      dayOfYear := dayOfYear + (if month > 4 then 30 else 0);
      dayOfYear := dayOfYear + (if month > 5 then 31 else 0);
      dayOfYear := dayOfYear + (if month > 6 then 30 else 0);
      dayOfYear := dayOfYear + (if month > 7 then 31 else 0);
      dayOfYear := dayOfYear + (if month > 8 then 31 else 0);
      dayOfYear := dayOfYear + (if month > 9 then 30 else 0);
      dayOfYear := dayOfYear + (if month > 10 then 31 else 0);
      dayOfYear := dayOfYear + (if month > 11 then 30 else 0);
    end dayOfTheYear;
  end Functions;

  package Sources "Sources"
    extends Modelica.Icons.Package;

    package Irradiance "Irradiance"
      extends Modelica.Icons.Package;

      model Irradiance "Simple solar irradiance without considering weather conditions"
        import Modelica.Constants.pi;
        import PhotoVoltaics.Functions.rad;
        import PhotoVoltaics.Functions.degree;
        import PhotoVoltaics.Functions.dayOfTheYear;
        parameter Integer startDay(final min = 1, final max = 31) = 10 "Day";
        parameter Integer startMonth(final min = 1, final max = 12) = 9 "Month";
        parameter Integer startYear = 2016 "Year";
        parameter Integer TimeZone = 1 "Time zone";
        parameter Modelica.SIunits.Angle longitude = 16.428 * pi / 180 "Longitude";
        parameter Modelica.SIunits.Angle latitude = 48.280 * pi / 180 "Latitude";
        parameter Modelica.SIunits.Irradiance irradianceRef = 1000 "Reference solar irradiance";
        parameter Modelica.SIunits.Angle gamma = 10 * pi / 180 "Angle of PV module with w.r.t. horizontal plane";
        parameter Modelica.SIunits.Angle azimuth = 0 "Azimuth of the PV module orientation";
        Integer startDayOfYear(start = dayOfTheYear(startDay, startMonth, startYear)) "Start day of year in simulation";
        Integer dayOfYear(final start = dayOfTheYear(startDay, startMonth, startYear)) "Actual day of year";
        Integer daysOfYear(final start = dayOfTheYear(31, 12, startYear)) "Total number of days of year";
        Integer year(final start = startYear) "Actual year";
        Modelica.SIunits.Angle Jprime(final start = dayOfTheYear(startDay, startMonth, startYear) / dayOfTheYear(31, 12, startYear) * 2 * pi) "Equivalent Angle of the day of the year w.r.t. total number of days";
        Real delta_J;
        Real timeequation_J;
        Modelica.SIunits.Conversions.NonSIunits.Time_day localTimeDays "Local time in days";
        Integer localDays "Locale day";
        Modelica.SIunits.Time localTime "Local time";
        Modelica.SIunits.Conversions.NonSIunits.Time_hour localTimeHours "Local time in unit hours";
        Modelica.SIunits.Conversions.NonSIunits.Time_hour LocalMeanTimeHours "Local mean time in unit hours";
        Modelica.SIunits.Conversions.NonSIunits.Time_hour trueMeanTimeHours "True mean time in unit hours";
        Modelica.SIunits.Angle hoursAngle "Hours angle";
        Modelica.SIunits.Angle sunHeight "Sun height";
        Modelica.SIunits.Angle sunAzimuth1 "Sun azimuth before 12 p.m.";
        Modelica.SIunits.Angle sunAzimuth2 "Sun azimuth after 12 p.m.";
        Modelica.SIunits.Angle sunAzimuth "Sun azimuth";
        Modelica.SIunits.Angle angleOfIncidence "Angle of incidence between a vector in sun direction and a normal vector";
        Modelica.SIunits.Irradiance directIrradianceHorizontal "Direct irradiance on the horizontal in W/m^2";
        Modelica.SIunits.Irradiance directIrradianceInclined "Direct irradiance on the inclined plane in w/m^2";
        Modelica.Blocks.Interfaces.RealOutput irradiance annotation (
          Placement(transformation(extent = {{100, -10}, {120, 10}})));
      algorithm
        // Calculate ratio of day w.r.t. total number of days of a year as equivalent angle
        when sample(24 * 3600, 24 * 3600) then
          dayOfYear := mod(pre(dayOfYear), pre(daysOfYear)) + 1;
        end when;
        when startDayOfYear + localDays == daysOfYear + 1 then
          startDayOfYear := 1;
          year := pre(year) + 1;
          daysOfYear := dayOfTheYear(31, 12, year);
        end when;
        // One full year is reached
        // Reset start day of year
        // Increment year
        // Determined actual number of total days of year
      equation
        Jprime = dayOfYear / daysOfYear * 2 * pi;
        delta_J = rad(0.3948 - 23.2559 * cos(Jprime + rad(9.1)) - 0.3915 * cos(2 * Jprime + rad(5.4)) - 0.1764 * cos(3 * Jprime + rad(26)));
        timeequation_J = 0.0066 + 7.3525 * cos(Jprime + rad(85.9)) + 9.9359 * cos(2 * Jprime + rad(108.9)) + 0.3387 * cos(3 * Jprime + rad(105.2));
        // Zeit LZ = time
        localTime = time;
        // Convert time into unit hours
        localTimeHours = localTime / 3600;
        // Convert time into unit days
        localTimeDays = localTimeHours / 24;
        // Convert time from real days into integer days (floor)
        localDays = integer(floor(localTimeDays));
        // Calculate locale mean time
        LocalMeanTimeHours = localTimeHours - TimeZone + 4 / 60 * longitude * 180 / Modelica.Constants.pi;
        // cos(latitude)*tan(...)
        trueMeanTimeHours = LocalMeanTimeHours + timeequation_J / 60;
        hoursAngle = rad((12 - trueMeanTimeHours) * 15);
        sunHeight = degree(asin(cos(hoursAngle) * cos(latitude) * cos(delta_J) + sin(latitude) * sin(delta_J))) * (Modelica.Constants.pi / 180);
        sunAzimuth1 = Modelica.Constants.pi - acos((sin(sunHeight) * sin(latitude) - sin(delta_J)) / (cos(sunHeight) * cos(latitude)));
        sunAzimuth2 = Modelica.Constants.pi + acos((sin(sunHeight) * sin(latitude) - sin(delta_J)) / (cos(sunHeight) * cos(latitude)));
        sunAzimuth = if mod(localTimeHours, 24) <= 12 then sunAzimuth1 else sunAzimuth2;
        angleOfIncidence = acos((-cos(sunHeight) * sin(gamma) * cos(sunAzimuth - azimuth)) + sin(sunHeight) * cos(gamma));
        directIrradianceHorizontal = if sunHeight < 0 then 0 else irradianceRef * sin(sunHeight);
        directIrradianceInclined = if angleOfIncidence > pi / 2 then 0 else if abs(sin(sunHeight)) < 1E-5 then 0 else directIrradianceHorizontal * (cos(angleOfIncidence) / sin(sunHeight));
        irradiance = directIrradianceInclined;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {28, 108, 200}), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {28, 108, 200}), Line(points = {{20, 20}, {80, 80}}, color = {28, 108, 200}), Line(points = {{-40, 40}, {-72, 72}}, color = {28, 108, 200}), Line(points = {{-28, -30}, {-80, -80}}, color = {28, 108, 200})}),
          Diagram(coordinateSystem(preserveAspectRatio = false)));
      end Irradiance;
    end Irradiance;

    package Blocks "Block sources"
      extends Modelica.Icons.Package;

      block PowerRamp "Generate ramp signal based logarithmic range"
        parameter Real height = 1 "Height of ramps";
        parameter Modelica.SIunits.Time duration(min = 0.0, start = 2) "Duration of ramp (= 0.0 gives a Step)";
        parameter Real offset = 0 "Offset of output signal";
        parameter Modelica.SIunits.Time startTime = 0 "Output = offset for time < startTime";
        parameter Real ref = 1 "Reference value, determined by ref * 10 ^ (ramp function)";
        extends Modelica.Blocks.Interfaces.SO;
      equation
        y = ref * 10 ^ (offset + (if time < startTime then 0 else if time < startTime + duration then (time - startTime) * height / duration else height));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 68}, {-80, -80}}, color = {192, 192, 192}), Polygon(points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-90, -70}, {82, -70}}, color = {192, 192, 192}), Polygon(points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, -70}, {-40, -70}, {31, 38}}), Text(extent = {{-150, -150}, {150, -110}}, lineColor = {0, 0, 0}, textString = "duration=%duration"), Line(points = {{31, 38}, {86, 38}})}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-80, 90}, {-86, 68}, {-74, 68}, {-80, 90}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, 68}, {-80, -80}}, color = {95, 95, 95}), Line(points = {{-80, -20}, {-20, -20}, {50, 50}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{-90, -70}, {82, -70}}, color = {95, 95, 95}), Polygon(points = {{90, -70}, {68, -64}, {68, -76}, {90, -70}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{-40, -20}, {-42, -30}, {-38, -30}, {-40, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-40, -20}, {-40, -70}}, color = {95, 95, 95}), Polygon(points = {{-40, -70}, {-42, -60}, {-38, -60}, {-40, -70}, {-40, -70}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Text(extent = {{-72, -39}, {-34, -50}}, lineColor = {0, 0, 0}, textString = "offset"), Text(extent = {{-38, -72}, {6, -83}}, lineColor = {0, 0, 0}, textString = "startTime"), Text(extent = {{-78, 92}, {-37, 72}}, lineColor = {0, 0, 0}, textString = "y"), Text(extent = {{70, -80}, {94, -91}}, lineColor = {0, 0, 0}, textString = "time"), Line(points = {{-20, -20}, {-20, -70}}, color = {95, 95, 95}), Line(points = {{-19, -20}, {50, -20}}, color = {95, 95, 95}), Line(points = {{50, 50}, {101, 50}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{50, 50}, {50, -20}}, color = {95, 95, 95}), Polygon(points = {{50, -20}, {42, -18}, {42, -22}, {50, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{-20, -20}, {-11, -18}, {-11, -22}, {-20, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{50, 50}, {48, 40}, {52, 40}, {50, 50}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{50, -20}, {48, -10}, {52, -10}, {50, -20}, {50, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Text(extent = {{53, 23}, {82, 10}}, lineColor = {0, 0, 0}, textString = "height"), Text(extent = {{-2, -21}, {37, -33}}, lineColor = {0, 0, 0}, textString = "duration")}),
          Documentation(info = "<html>
<p>
The Real output y is a ramp signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Ramp.png\"
     alt=\"Ramp.png\">
</p>

<p>
If parameter duration is set to 0.0, the limiting case of a Step signal is achieved.
</p>
</html>"));
      end PowerRamp;

      block TriangleAndStep "Multiple steps and triangles"
        parameter Modelica.SIunits.Time T = 1 "Total time of varying outputs";
        parameter Integer stepNumber = 5 "Number of steps";
        parameter Real stepHeight = 1 "Total step height";
        parameter Real stepOffset = 0 "Offset";
        parameter Modelica.SIunits.Time startTime = 0 "Start time";
        parameter Real triangleHeight = 1 "Height of triangle output";
        parameter Real triangleOffset = 0 "Offset of triangle output";
        Modelica.Blocks.Sources.Ramp ramp(final startTime = startTime, final height = stepNumber - 1, final duration = T * (stepNumber - 1) / stepNumber, final offset = 0) annotation (
          Placement(transformation(extent = {{-100, 0}, {-80, 20}})));
        Modelica.Blocks.Math.RealToInteger realToInteger annotation (
          Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
        Modelica.Blocks.Math.IntegerToReal integerToReal annotation (
          Placement(transformation(extent = {{-10, 0}, {10, 20}})));
        Modelica.Blocks.Math.Feedback feedback annotation (
          Placement(transformation(extent = {{-70, 0}, {-50, 20}})));
        Modelica.Blocks.Sources.Constant const(final k = 0.5) annotation (
          Placement(transformation(extent = {{-100, -40}, {-80, -20}})));
        Modelica.Blocks.Sources.Constant constantOffset(final k = stepOffset) annotation (
          Placement(transformation(extent = {{20, 40}, {40, 60}})));
        Modelica.Blocks.Math.Add add annotation (
          Placement(transformation(extent = {{52, 0}, {72, 20}})));
        Modelica.Blocks.Math.Gain gain(final k = stepHeight / (stepNumber - 1)) annotation (
          Placement(transformation(extent = {{20, 0}, {40, 20}})));
        Modelica.Blocks.Sources.Trapezoid trapezoid(final amplitude = triangleHeight, final rising = T / stepNumber / 2, final width = 0, final falling = T / stepNumber / 2, final period = T / stepNumber, final nperiod = stepNumber, final offset = triangleOffset, final startTime = startTime) annotation (
          Placement(transformation(extent = {{60, -70}, {80, -50}})));
        Modelica.Blocks.Interfaces.RealOutput step annotation (
          Placement(transformation(extent = {{100, 50}, {120, 70}})));
        Modelica.Blocks.Interfaces.RealOutput triangle annotation (
          Placement(transformation(extent = {{100, -70}, {120, -50}})));
      equation
        connect(realToInteger.y, integerToReal.u) annotation (
          Line(points = {{-19, 10}, {-12, 10}}, color = {255, 127, 0}));
        connect(ramp.y, feedback.u1) annotation (
          Line(points = {{-79, 10}, {-68, 10}}, color = {0, 0, 127}));
        connect(feedback.y, realToInteger.u) annotation (
          Line(points = {{-51, 10}, {-42, 10}}, color = {0, 0, 127}));
        connect(const.y, feedback.u2) annotation (
          Line(points = {{-79, -30}, {-60, -30}, {-60, 2}}, color = {0, 0, 127}));
        connect(integerToReal.y, gain.u) annotation (
          Line(points = {{11, 10}, {18, 10}}, color = {0, 0, 127}));
        connect(constantOffset.y, add.u1) annotation (
          Line(points = {{41, 50}, {44, 50}, {44, 16}, {50, 16}}, color = {0, 0, 127}));
        connect(gain.y, add.u2) annotation (
          Line(points = {{41, 10}, {44, 10}, {44, 4}, {50, 4}}, color = {0, 0, 127}));
        connect(add.y, step) annotation (
          Line(points = {{73, 10}, {90, 10}, {90, 60}, {110, 60}}, color = {0, 0, 127}));
        connect(trapezoid.y, triangle) annotation (
          Line(points = {{81, -60}, {110, -60}}, color = {0, 0, 127}));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{-60, 40}, {-20, 40}, {-20, 60}, {20, 60}, {20, 80}, {60, 80}}, color = {0, 0, 255}), Line(points = {{-58, -80}, {-40, -40}, {-20, -80}, {0, -40}, {20, -80}, {40, -40}, {60, -80}}, color = {0, 0, 255}), Text(origin = {1, 130}, lineColor = {0, 0, 255}, extent = {{-149, -20}, {149, 20}}, textString = "%name")}),
          Documentation(info = "<html>
<p>The step output starts from <code>stepOffset</code> and increases to <code>stepOffset + stepHeight</code> in <code>stepNumber</code>steps. The total duration of all step changes is equal to <code>T</code>. </p>
<p>During each step the <code>triangle</code> output is increased from
<code>triangleOffset</code> to <code>triangleOffset + triangleHeight</code>
and back to <code>triangleOffset</code>.</p>
<p>This way a variable sweep (<code>triangleOffset</code>) can be performed for different
stepwise changed variables (<code>step</code>).
</html>"));
      end TriangleAndStep;
    end Blocks;

    package QuasiStatic "Quasi static sources"
      extends Modelica.Icons.Package;
    end QuasiStatic;

    package Electrical "Electrical sources"
      extends Modelica.Icons.Package;

      model SignalCurrent "Generic current source using the input signal as source current"
        extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
        parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature";
        parameter Modelica.SIunits.Current IRef = 1 "Reference current at reference irradiance and reference temperature";
        parameter Modelica.SIunits.Irradiance irradianceRef = 1000 "Reference solar irradiance";
        parameter Modelica.SIunits.LinearTemperatureCoefficient alphaRef = 0 "Temperature coefficient of reference current at TRref";
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (
          Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (
          Placement(transformation(extent = {{110, -10}, {90, 10}})));
        Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
        Modelica.SIunits.Current i "Current flowing from pin p to pin n as input signal";
        Modelica.Blocks.Interfaces.RealInput irradiance(unit = "W/m2") "Irradiance" annotation (
          Placement(transformation(origin = {0, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
      equation
        i = IRef * (irradiance / irradianceRef + alphaRef * (T_heatPort - TRef));
        v = p.v - n.v;
        0 = p.i + n.i;
        i = p.i;
        LossPower = 0;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -90}, {150, -50}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-96, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255})}),
          Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));
      end SignalCurrent;

      model VariableUnrootedSinglePhaseCurrentSource "Unrooted variable multi phase AC current source"
        extends Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.OnePort;
        import Modelica.Constants.pi;
        Modelica.ComplexBlocks.Interfaces.ComplexInput I annotation (
          Placement(transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
      equation
        i = I;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-60, 60}, {60, 60}}, color = {85, 170, 255}), Polygon(points = {{60, 60}, {30, 70}, {30, 50}, {60, 60}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 0}), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 0}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 0})}),
          Documentation(info = "<html>
<p>
This model represents an ideal current source specifying the complex RMS current without root.
</p>
</html>"));
      end VariableUnrootedSinglePhaseCurrentSource;

      model VariableUnrootedMultiPhaseCurrentSource "Unrooted variable multi phase AC current source"
        extends Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.OnePort;
        import Modelica.Constants.pi;
        Modelica.ComplexBlocks.Interfaces.ComplexInput I[m] annotation (
          Placement(transformation(origin = {0, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
      equation
        i = I;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-60, 60}, {60, 60}}, color = {85, 170, 255}), Polygon(points = {{60, 60}, {30, 70}, {30, 50}, {60, 60}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 0}), Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 0}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 0})}),
          Documentation(info = "<html>

<p>
This model describes <i>m</i> variable current sources, with <i>m</i> complex signal inputs,
specifying the complex current by the complex RMS voltage components.
Additionally, the frequency of the current source is defined by a real signal input.
<i>m</i> <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VariableCurrentSource\">single phase VariableCurrentSources</a> are used.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource\">SinglePhase.VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource\">VoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VariableVoltageSource\">VariableVoltageSource</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sources.CurrentSource\">CurrentSource</a>.
</p>
</html>"));
      end VariableUnrootedMultiPhaseCurrentSource;
    end Electrical;
  end Sources;

  package Interfaces "Interfaces"
    extends Modelica.Icons.InterfacesPackage;

    partial model PartialCell "Partial cell model"
      extends PhotoVoltaics.Interfaces.PartialComponent;
      Components.Diodes.Diode2Module diode(final useHeatPort = useHeatPort, final T = T, final TRef = moduleData.TRef) annotation (
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Sources.Electrical.SignalCurrent signalCurrent(final useHeatPort = useHeatPort, final T = T, final TRef = moduleData.TRef) annotation (
        Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    equation
      connect(p, diode.p) annotation (
        Line(points = {{-100, 0}, {-60, 0}, {-10, 0}}, color = {0, 0, 255}));
      connect(diode.p, signalCurrent.n) annotation (
        Line(points = {{-10, 0}, {-20, 0}, {-20, 30}, {-10, 30}}, color = {0, 0, 255}));
      connect(n, diode.n) annotation (
        Line(points = {{100, 0}, {100, 0}, {10, 0}}, color = {0, 0, 255}));
      connect(diode.n, signalCurrent.p) annotation (
        Line(points = {{10, 0}, {20, 0}, {20, 30}, {10, 30}}, color = {0, 0, 255}));
      connect(signalCurrent.irradiance, irradiance) annotation (
        Line(points = {{8.88178e-16, 37}, {8.88178e-16, 44}, {0, 44}, {0, 70}}, color = {0, 0, 127}));
      connect(diode.heatPort, internalHeatPort) annotation (
        Line(points = {{0, -10}, {-52, -10}, {-100, -10}, {-100, -80}}, color = {191, 0, 0}));
      connect(signalCurrent.heatPort, internalHeatPort) annotation (
        Line(points = {{0, 20}, {-80, 20}, {-80, -10}, {-100, -10}, {-100, -80}}, color = {191, 0, 0}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Icon(coordinateSystem(preserveAspectRatio = false)));
    end PartialCell;

    partial model PartialDiode "Diode with one exponential function"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
      constant Modelica.SIunits.Charge Q = 1.6021766208E-19 "Elementary charge of electron";
      parameter Real m = 1 "Ideality factor of diode";
      parameter Modelica.SIunits.Resistance R = 1E8 "Parallel ohmic resistance";
      parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Voltage VRef(min = Modelica.Constants.small) = 0.6292 "Reference voltage > 0 at TRef" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Current IRef(min = Modelica.Constants.small) = 8.540 "Reference current > 0 at TRef" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaI = +0.00053 "Temperature coefficient of reference current at TRef" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaV = -0.00340 "Temperature coefficient of reference voltage at TRef*" annotation (
        Dialog(group = "Reference data"));
      Modelica.SIunits.Voltage Vt "Voltage equivalent of temperature (k*T/Q)";
      Modelica.SIunits.Voltage VRefActual "Reference voltage w.r.t. actual temperature";
      Modelica.SIunits.Current IRefActual "Reference current w.r.t. actual temperature";
      Modelica.SIunits.Current Ids "Saturation current";
    equation
      // Temperature dependent voltage
      Vt = Modelica.Constants.k * T_heatPort / Q;
      // Re-calculate reference voltage and current with respect to reference temperature
      VRefActual = VRef * (1 + alphaV * (T_heatPort - TRef));
      IRefActual = IRef * (1 + alphaI * (T_heatPort - TRef));
      // Actual temperature dependent saturation current is determined from reference voltage and current
      Ids = IRefActual / (exp(VRefActual / m / Vt) - 1);
      LossPower = v * i;
      annotation (
        defaultComponentName = "diode",
        Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-150, 150}, {150, 110}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})));
    end PartialDiode;

    partial model PartialComponent "Partial cell or module"
      extends Modelica.Electrical.Analog.Interfaces.TwoPin;
      extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(T = 298.15);
      parameter Boolean useConstantIrradiance = true "If false, signal input is used" annotation (
        Evaluate = true,
        HideResult = true,
        choices(checkBox = true));
      parameter Modelica.SIunits.Irradiance constantIrradiance = 1000 "Constant solar irradiance, if useConstantIrradiance = true" annotation (
        Dialog(enable = useConstantIrradiance));
      parameter Records.ModuleData moduleData "Module parameters" annotation (
        choicesAllMatching = true,
        Placement(transformation(extent = {{60, 60}, {80, 80}})));
      Modelica.SIunits.Current i = p.i "Current";
      Modelica.SIunits.Current iGenerating = -i "Negative current (generating)";
      Modelica.SIunits.Power power = v * i "Power";
      Modelica.SIunits.Power powerGenerating = v * iGenerating "Negative power consumption (generating)";
      Modelica.Blocks.Interfaces.RealInput variableIrradiance(unit = "W/m2") if not useConstantIrradiance "Solar irradiance" annotation (
        Placement(transformation(extent = {{20, -20}, {-20, 20}}, rotation = 90, origin = {0, 120}), iconTransformation(extent = {{20, -20}, {-20, 20}}, rotation = 90, origin = {0, 120})));
      Modelica.Blocks.Sources.Constant const(final k = constantIrradiance) if useConstantIrradiance annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-30, 80})));
    protected
      Modelica.Blocks.Interfaces.RealInput irradiance(unit = "W/m2") "Solar irradiance (either constant or signal input)" annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, 70})));
    equation
      connect(irradiance, variableIrradiance) annotation (
        Line(points = {{0, 70}, {0, 70}, {0, 120}}, color = {0, 0, 127}));
      connect(const.y, irradiance) annotation (
        Line(points = {{-19, 80}, {-20, 80}, {-20, 80}, {0, 80}, {0, 80}, {0, 70}, {0, 70}}, color = {0, 0, 127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
        Icon(coordinateSystem(preserveAspectRatio = false)));
    end PartialComponent;

    package QuasiStatic
      extends Modelica.Icons.Package;

      partial model ACpins "Single phase AC pins"
        Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.PositivePin ac_p "AC positive pin" annotation (
          Placement(transformation(extent = {{90, 90}, {110, 110}})));
        Modelica.Electrical.QuasiStationary.SinglePhase.Interfaces.NegativePin ac_n "AC negative pin" annotation (
          Placement(transformation(extent = {{90, -110}, {110, -90}})));
        Modelica.SIunits.ComplexVoltage vAC = ac_p.v - ac_n.v "AC potential";
        Modelica.SIunits.ComplexCurrent iAC = ac_p.i "AC current";
      end ACpins;

      partial model ACplug "AC multi phase plug"
        parameter Integer m(final min = 3) = 3 "Number of phases";
        Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug ac(final m = m) "AC output" annotation (
          Placement(transformation(extent = {{90, -10}, {110, 10}})));
        Modelica.SIunits.ComplexVoltage vAC[m] = ac.pin[:].v "AC potential";
        Modelica.SIunits.ComplexCurrent iAC[m] = ac.pin[:].i "AC current";
      end ACplug;
    end QuasiStatic;
  end Interfaces;

  package Records "Records"
    record ModuleData "Data of PV module"
      extends Modelica.Icons.Record;
      parameter String moduleName = "Generic";
      parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Irradiance irradianceRef = 1000 "Reference solar irradiance" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Voltage VocRef(min = Modelica.Constants.small) = 30.2 "Reference open circuit module voltage > 0 at TRref" annotation (
        Dialog(group = "Reference data"));
      final parameter Modelica.SIunits.Voltage VocCellRef = VocRef / ns "Reference open circuit cell voltage > 0 at TRref";
      parameter Modelica.SIunits.Current IscRef(min = Modelica.Constants.small) = 8.54 "Reference short circuit current > 0 at TRref and irradianceRef" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Voltage VmpRef(min = Modelica.Constants.small) = 24.0 "Reference maximum power module voltage > 0 at TRref" annotation (
        Dialog(group = "Reference data"));
      final parameter Modelica.SIunits.Voltage VmpCellRef = VmpRef / ns "Reference maximum power cell voltage > 0 at TRref";
      parameter Modelica.SIunits.Current ImpRef(min = Modelica.Constants.small) = 7.71 "Reference maximum power current > 0 at TRref and irradianceRef" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaIsc = +0.00053 "Temperature coefficient of reference short circuit current at TRref" annotation (
        Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaVoc = -0.00340 "Temperature coefficient of reference open circuit module voltage at TRref" annotation (
        Dialog(group = "Reference data"));
      parameter Integer ns = 1 "Number of series connected cells";
      parameter Integer nb = 1 "Number of bypass diodes per module";
      parameter Modelica.SIunits.Voltage BvCell = 18 "Breakthrough cell voltage" annotation (
        Dialog(group = "Breakthrough data"));
      parameter Modelica.SIunits.Current Ibv = 1 "Breakthrough knee current" annotation (
        Dialog(group = "Breakthrough data"));
      parameter Real Nbv = 0.74 "Breakthrough emission coefficient" annotation (
        Dialog(group = "Breakthrough data"));
      /*
              parameter Modelica.SIunits.Resistance RsCell = 0 "Series resistance of cell" annotation(Dialog(group = "Non-ideal effects"));
              parameter Modelica.SIunits.Resistance RshCell = 1E8 "Shunt resistance of cell" annotation(Dialog(group = "Non-ideal effects"));
              */
      final parameter Modelica.SIunits.Voltage VtCellRef = Modelica.Constants.k * TRef / Q "Reference temperature voltage of cell";
      constant Modelica.SIunits.Charge Q = 1.6021766208E-19 "Elementary charge of electron";
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(lineColor = {0, 0, 255}, extent = {{-200, -150}, {200, -110}}, textString = "%moduleName")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end ModuleData;

    extends Modelica.Icons.Package;

    record TSM_200_DC01A "Comax monocrystalline SI cell 200W"
      extends ModuleData(final moduleName = "TSM 200 DC01A", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 46, final IscRef = 5.6, final VmpRef = 37.6, final ImpRef = 5.37, final alphaIsc = +0.0002, final alphaVoc = -0.003, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.elektra.si/uploads/datoteke/trina_tsm-195-200-205-210dc80.08_mono.pdf\">Comax</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/TSM_200_DC01A.pdf\">available</a>.
</html>"));
    end TSM_200_DC01A;

    record TSM_230_PC05 "Trina polycrystalline SI cell 230W"
      extends ModuleData(final moduleName = "TSM 230 PC05", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 37, final IscRef = 8.26, final VmpRef = 29.8, final ImpRef = 7.72, final alphaIsc = +0.0005, final alphaVoc = -0.0032, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://http://www.franklin-electric.com.au/media/52578/Trina%20TSM190-200DC01A_WW.pdf\">Trina</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/TSM_230_PC05.pdf\">available</a>.
</html>"));
    end TSM_230_PC05;

    record LG360N2W_B3 "LG monocrystalline SI cell 360W"
      extends ModuleData(final moduleName = "LG360N2W_B3", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 48.3, final IscRef = 9.84, final VmpRef = 38.4, final ImpRef = 9.39, final alphaIsc = +0.0004, final alphaVoc = -0.003, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_369.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG360N2W_B3.pdf\">available</a>.
</html>"));
    end LG360N2W_B3;

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

    record LG300N1C_G4 "LG monocrystalline SI cell 300W"
      extends ModuleData(final moduleName = "LG300N1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39.8, final IscRef = 9.9, final VmpRef = 32.2, final ImpRef = 9.34, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://d1819pwkf4ncw.cloudfront.net/files/documents/lg300n1c-g4-360889.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG300N1C_G4.pdf\">available</a>.
</html>"));
    end LG300N1C_G4;

    record LG335S2W_G4 "LG monocrystalline SI cell 335W"
      extends ModuleData(final moduleName = "LG335S2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 46.2, final IscRef = 9.48, final VmpRef = 37.5, final ImpRef = 8.94, final alphaIsc = +0.0003, final alphaVoc = -0.003, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_673.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG335S2W_G4.pdf\">available</a>.
</html>"));
    end LG335S2W_G4;

    record LG340S2W_G4 "LG monocrystalline SI cell 340W"
      extends ModuleData(final moduleName = "LG340S2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 46.4, final IscRef = 9.54, final VmpRef = 37.7, final ImpRef = 9.02, final alphaIsc = +0.0003, final alphaVoc = -0.003, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_673.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG340S2W_G4.pdf\">available</a>.
</html>"));
    end LG340S2W_G4;

    record LG285S1C_G4 "LG monocrystalline SI cell 285W"
      extends ModuleData(final moduleName = "LG285S1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39, final IscRef = 9.43, final VmpRef = 32.3, final ImpRef = 8.88, final alphaIsc = +0.0003, final alphaVoc = -0.003, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_674.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG285S1C_G4.pdf\">available</a>.
</html>"));
    end LG285S1C_G4;

    record LG280S1C_G4 "LG monocrystalline SI cell 280W"
      extends ModuleData(final moduleName = "LG280S1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39, final IscRef = 9.43, final VmpRef = 32.3, final ImpRef = 8.88, final alphaIsc = +0.0003, final alphaVoc = -0.003, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_674.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG280S1C_G4.pdf\">available</a>.
</html>"));
    end LG280S1C_G4;

    record LG275S1C_G4 "LG monocrystalline SI cell 275W"
      extends ModuleData(final moduleName = "LG275S1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 38.7, final IscRef = 9.26, final VmpRef = 31.7, final ImpRef = 8.68, final alphaIsc = +0.0003, final alphaVoc = -0.003, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_674.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG275S1C_G4.pdf\">available</a>.
</html>"));
    end LG275S1C_G4;

    record LG375N2W_G4 "LG monocrystalline SI cell 375W"
      extends ModuleData(final moduleName = "LG375N2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 48.3, final IscRef = 10.04, final VmpRef = 39.6, final ImpRef = 9.5, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_675.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG375N2W_G4.pdf\">available</a>.
</html>"));
    end LG375N2W_G4;

    record LG370N2W_G4 "LG monocrystalline SI cell 370W"
      extends ModuleData(final moduleName = "LG370N2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 48, final IscRef = 9.98, final VmpRef = 39.2, final ImpRef = 9.44, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_675.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG370N2W_G4.pdf\">available</a>.
</html>"));
    end LG370N2W_G4;

    record LG365N2W_G4 "LG monocrystalline SI cell 365W"
      extends ModuleData(final moduleName = "LG365N2W_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 47.7, final IscRef = 9.92, final VmpRef = 38.9, final ImpRef = 9.39, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_675.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG365N2W_G4.pdf\">available</a>.
</html>"));
    end LG365N2W_G4;

    record LG320N1C_G4 "LG monocrystalline SI cell 320W"
      extends ModuleData(final moduleName = "LG320N1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40.9, final IscRef = 10.05, final VmpRef = 33.8, final ImpRef = 9.53, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_677.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG320N1C_G4.pdf\">available</a>.
</html>"));
    end LG320N1C_G4;

    record LG315N1C_G4 "LG monocrystalline SI cell 315W"
      extends ModuleData(final moduleName = "LG315N1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40.6, final IscRef = 10.02, final VmpRef = 33.2, final ImpRef = 9.5, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_677.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG315N1C_G4.pdf\">available</a>.
</html>"));
    end LG315N1C_G4;

    record LG310N1C_G4 "LG monocrystalline SI cell 310W"
      extends ModuleData(final moduleName = "LG310N1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40.4, final IscRef = 9.96, final VmpRef = 32.8, final ImpRef = 9.45, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_677.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG310N1C_G4.pdf\">available</a>.
</html>"));
    end LG310N1C_G4;

    record LG305N1C_G4 "LG monocrystalline SI cell 305W"
      extends ModuleData(final moduleName = "LG305N1C_G4", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40.1, final IscRef = 9.93, final VmpRef = 32.5, final ImpRef = 9.39, final alphaIsc = +0.0003, final alphaVoc = -0.0028, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.lg.com/us/business/download/resources/BT00002151/BT00002151_677.pdf\">LG</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/LG305N1C_G4.pdf\">available</a>.
</html>"));
    end LG305N1C_G4;

    record SW_250_MONO "Solarworld monocrystalline SI cell 250W"
      extends ModuleData(final moduleName = "SW_250_MONO", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 37.8, final IscRef = 8.28, final VmpRef = 31.1, final ImpRef = 8.05, final alphaIsc = +0.00004, final alphaVoc = -0.003, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.solarworld-usa.com/~/media/www/files/datasheets/sunmodule-plus/sunmodule-solar-panel-250-mono-ds.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_250_MONO.pdf\">available</a>.
</html>"));
    end SW_250_MONO;

    record SW_285_MONO "Solarworld monocrystalline SI cell 285W"
      extends ModuleData(final moduleName = "SW_285_MONO", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39.7, final IscRef = 9.84, final VmpRef = 31.3, final ImpRef = 9.2, final alphaIsc = +0.0004, final alphaVoc = -0.003, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.solarworld-usa.com/~/media/www/files/datasheets/sunmodule-plus/sunmodule-solar-panel-285-mono-ds.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_285_MONO.pdf\">available</a>.
</html>"));
    end SW_285_MONO;

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

    record SW_290_MONO "Solarworld monocrystalline SI cell 290W"
      extends ModuleData(final moduleName = "SW_290_MONO", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39.9, final IscRef = 9.97, final VmpRef = 31.4, final ImpRef = 9.33, final alphaIsc = +0.0004, final alphaVoc = -0.003, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2016/11/SolarWorld-SW290-300-Mono_EN.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_290_MONO.pdf\">available</a>.
</html>"));
    end SW_290_MONO;

    record SW_395_MONO "Solarworld monocrystalline SI cell 295W"
      extends ModuleData(final moduleName = "SW_395_MONO", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40, final IscRef = 10.1, final VmpRef = 31.4, final ImpRef = 9.45, final alphaIsc = +0.0004, final alphaVoc = -0.003, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2016/11/SolarWorld-SW290-300-Mono_EN.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_395_MONO.pdf\">available</a>.
</html>"));
    end SW_395_MONO;

    record SW_300_MONO "Solarworld monocrystalline SI cell 300W"
      extends ModuleData(final moduleName = "SW_300_MONO", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 40.1, final IscRef = 10.23, final VmpRef = 31.6, final ImpRef = 9.57, final alphaIsc = +0.0004, final alphaVoc = -0.003, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2016/11/SolarWorld-SW290-300-Mono_EN.pdf\">Solarworld</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SW_300_MONO.pdf\">available</a>.
</html>"));
    end SW_300_MONO;

    record NU_RD260 "SHARP monocrystalline SI cell 260W"
      extends ModuleData(final moduleName = "NU_RD260", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 38.5, final IscRef = 9.07, final VmpRef = 31.3, final ImpRef = 8.37, final alphaIsc = +0.0005, final alphaVoc = -0.0029, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2016/03/Datasheet_NURD260-285W_black_151027.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/NU_RD260.pdf\">available</a>.
</html>"));
    end NU_RD260;

    record SC_195_72M "Sunclass monocrystalline SI cell 195W"
      extends ModuleData(final moduleName = "SC_195_72M", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 45.5, final IscRef = 5.63, final VmpRef = 36.9, final ImpRef = 5.28, final alphaIsc = +0.0004, final alphaVoc = -0.0029, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.sunclass-solar.com/fileadmin/Download-Center/Solarmodule/SunClass/en/SunClass_SC_Serie_195-205W_72M_1580x808x35_EN.pdf\">Sunclass</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SC_195_72M.pdf\">available</a>.
</html>"));
    end SC_195_72M;

    record SC_200_72M "Sunclass monocrystalline SI cell 200W"
      extends ModuleData(final moduleName = "SC_200_72M", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 45.65, final IscRef = 5.65, final VmpRef = 37.3, final ImpRef = 5.36, final alphaIsc = +0.0004, final alphaVoc = -0.0029, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.sunclass-solar.com/fileadmin/Download-Center/Solarmodule/SunClass/en/SunClass_SC_Serie_195-205W_72M_1580x808x35_EN.pdf\">Sunclass</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SC_200_72M.pdf\">available</a>.
</html>"));
    end SC_200_72M;

    record SC_205_72M "Sunclass monocrystalline SI cell 205W"
      extends ModuleData(final moduleName = "SC_205_72M", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 45.75, final IscRef = 5.7, final VmpRef = 37.55, final ImpRef = 5.46, final alphaIsc = +0.0004, final alphaVoc = -0.0029, final ns = 72, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.sunclass-solar.com/fileadmin/Download-Center/Solarmodule/SunClass/en/SunClass_SC_Serie_195-205W_72M_1580x808x35_EN.pdf\">Sunclass</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SC_205_72M.pdf\">available</a>.
</html>"));
    end SC_205_72M;

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

    record SHARP_NU_S0_E3E "SHARP NU monocrystalline SI cell 180W"
      extends ModuleData(final moduleName = "SHARP_NU_S0_E3E", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 30, final IscRef = 8.37, final VmpRef = 23.7, final ImpRef = 7.6, final alphaIsc = +0.00053, final alphaVoc = -0.00350, final ns = 48, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.smartgreenenergycompany.com/Resources/sharp-solar-nu-series.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_S0_E3E.pdf\">available</a>.
</html>"));
    end SHARP_NU_S0_E3E;

    record SHARP_NU_S0_ESZ "SHARP NU monocrystalline SI cell 180W"
      extends ModuleData(final moduleName = "SHARP_NU_S0_ESZ", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 30, final IscRef = 8.23, final VmpRef = 23.7, final ImpRef = 7.6, final alphaIsc = +0.00053, final alphaVoc = -0.00350, final ns = 48, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.smartgreenenergycompany.com/Resources/sharp-solar-nu-series.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_S0_ESZ.pdf\">available</a>.
</html>"));
    end SHARP_NU_S0_ESZ;

    record SHARP_NU_R5_ESZ "SHARP NU monocrystalline SI cell 175W"
      extends ModuleData(final moduleName = "SHARP_NU_R5_ESZ", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 29.8, final IscRef = 8.29, final VmpRef = 23.2, final ImpRef = 7.55, final alphaIsc = +0.00053, final alphaVoc = -0.00350, final ns = 48, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.smartgreenenergycompany.com/Resources/sharp-solar-nu-series.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_R5_ESZ.pdf\">available</a>.
</html>"));
    end SHARP_NU_R5_ESZ;

    record SHARP_NU_R0_E3E "SHARP NU monocrystalline SI cell 170W"
      extends ModuleData(final moduleName = "SHARP_NU_R0_E3E", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 29.4, final IscRef = 8.37, final VmpRef = 22.4, final ImpRef = 7.6, final alphaIsc = +0.00053, final alphaVoc = -0.00350, final ns = 48, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.smartgreenenergycompany.com/Resources/sharp-solar-nu-series.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_R0_E3E.pdf\">available</a>.
</html>"));
    end SHARP_NU_R0_E3E;

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

    record SHARP_NU_RD280 "SHARP monocrystalline SI cell 280W"
      extends ModuleData(final moduleName = "NU_RD280", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 39.2, final IscRef = 9.67, final VmpRef = 31.2, final ImpRef = 8.97, final alphaIsc = +0.0005, final alphaVoc = -0.0029, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2016/03/Datasheet_NURD260-285W_black_151027.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/NU_RD280.pdf\">available</a>.
</html>"));
    end SHARP_NU_RD280;

    record SHARP_NU_RD260 "SHARP monocrystalline SI cell 260W"
      extends ModuleData(final moduleName = "SHARP_NU_RD260", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 38.5, final IscRef = 9.07, final VmpRef = 31.3, final ImpRef = 8.37, final alphaIsc = +0.0005, final alphaVoc = -0.0029, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.eng.sfe-solar.com/wp-content/uploads/2016/03/Datasheet_NURD260-285W_black_151027.pdf\">SHARP</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SHARP_NU_RD260.pdf\">available</a>.
</html>"));
    end SHARP_NU_RD260;

    record SPR_E20_327 "Sunpower monocrystalline SI cell 260W"
      extends ModuleData(final moduleName = "SPR_E20_327", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 64.9, final IscRef = 6.46, final VmpRef = 54.7, final ImpRef = 5.98, final alphaIsc = +0.00054, final alphaVoc = -0.00272, final ns = 96, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://us.sunpower.com/sites/sunpower/files/media-library/data-sheets/e-series-home-solar-panels-comparison.pdf\">Sunpower</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SPR_E20_327.pdf\">available</a>.
</html>"));
    end SPR_E20_327;

    record SPR_E19_320 "Sunpower monocrystalline SI cell 320W"
      extends ModuleData(final moduleName = "SPR_E19_320", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 64.8, final IscRef = 6.26, final VmpRef = 54.7, final ImpRef = 5.86, final alphaIsc = +0.00056, final alphaVoc = -0.00273, final ns = 96, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://us.sunpower.com/sites/sunpower/files/media-library/data-sheets/e-series-home-solar-panels-comparison.pdf\">Sunpower</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/SPR_E19_320.pdf\">available</a>.
</html>"));
    end SPR_E19_320;

    record KPV_235_PE "Kioto polycrystalline SI cell 235W"
      extends ModuleData(final moduleName = "KPV_235_PE", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 37.24, final IscRef = 8.61, final VmpRef = 29.82, final ImpRef = 7.97, final alphaIsc = +0.0005, final alphaVoc = -0.0031, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.enfsolar.com/Product/pdf/Crystalline/559ce7298807b.pdf\">Kioto</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/KPV_235_PE.pdf\">available</a>.
</html>"));
    end KPV_235_PE;

    record KPV_240_PE "Kioto polycrystalline SI cell 240W"
      extends ModuleData(final moduleName = "KPV_240_PE", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 37.33, final IscRef = 8.78, final VmpRef = 29.87, final ImpRef = 8.04, final alphaIsc = +0.0005, final alphaVoc = -0.0031, final ns = 60, final nb = 3);
      annotation (
        defaultComponentName = "moduleData",
        defaultComponentPrefixes = "parameter",
        Documentation(info = "<html>
The original data of this module are taken from
<a href=\"https://www.enfsolar.com/Product/pdf/Crystalline/559ce7298807b.pdf\">Kioto</a>. You may want to download this PDF file and store it in the directory Resources/DataSheets for convenience reasons. You may want to make these data directly 
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/KPV_240_PE.pdf\">available</a>.
</html>"));
    end KPV_240_PE;
  end Records;
  annotation (
    version = "0.X.X",
    versionBuild = 1,
    versionDate = "2017-XX-XX",
    uses(Modelica(version = "3.2.2")),
    Icon(coordinateSystem, graphics={  Ellipse(origin = {36, 75}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{0, 1}, {40, -39}}, endAngle = 360), Rectangle(origin = {-60, -9}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {0, -7}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {-60, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {0, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {60, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {60, -5}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Line(origin = {18, 34}, points = {{4, 10}, {-84, -16}}), Line(origin = {-12, 70}, points = {{34, -6}, {-34, 6}}), Line(points = {{36, 30}, {28, 16}}, color = {28, 108, 200})}));
end PhotoVoltaics;
