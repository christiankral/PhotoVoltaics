﻿package PhotoVoltaics
  extends Modelica.Icons.Package;

  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

    class Concept "Concept"
      extends Modelica.Icons.Information;
      annotation(preferredView = "info", Documentation(info = "<html>
</html>"));
    end Concept;

    class License "Modelica License 1.1"
      extends Modelica.Icons.Information;
      annotation(Documentation(info = "<html>
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
PDF files of the data sheets are provided througn this library.</p>
</html>"));
    end License;

    class Contact "Contact"
      extends Modelica.Icons.Contact;
      annotation(preferredView = "info", Documentation(info = "<html>
<p>
This library was developed during a diploma thesis at the
<a href=\"http://www.tgm.ac.at\">TGM</a>
by Jovan Brkic, Muaz Ceran, Mohamed Elmoghazy and Ramazan Kavlak under the supervision of Christian Kral.
</p>

<p>
<img src=\"modelica://PhotoVoltaics/Resources/Images/tgm.png\"
           alt=\"tgm.png\">
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
      annotation(preferredView = "info", Documentation(info = "<html>
<h4>References</h4>

</html>"));
    end References;

    class ReleaseNotes "Release Notes"
      extends Modelica.Icons.ReleaseNotes;
      annotation(preferredView = "info", Documentation(info = "<html>

<h5>Version X.X.X, 2016-XX-X</h5>
<ul>
<li>Initial version</li>
</ul>
</html>"));
    end ReleaseNotes;
    annotation(preferredView = "info", Documentation(info = "<html>
<p>
This library provides models for the modeling and simulation of photo voltaic power plants.
</p>
</html>"));
  end UsersGuide;

  package ComponentTesting "Testing of single components"
    extends Modelica.Icons.ExamplesPackage;

    model TestZener
      extends Modelica.Icons.Example;
      parameter Modelica.SIunits.Voltage Vmin = -5.25;
      parameter Modelica.SIunits.Voltage Vmax = +0.75;
      Modelica.Electrical.Analog.Semiconductors.ZDiode zDiode(Bv = moduleData.BvCell, Ibv = moduleData.Ibv, Nbv = moduleData.Nbv, useHeatPort = true, R = 1E8, T = 298.15) annotation(Placement(transformation(extent = {{-10, 10}, {10, 30}})));
      Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(duration = 1, startTime = 0, V = Vmax - Vmin, offset = Vmin) annotation(Placement(transformation(extent = {{-10, -30}, {10, -10}})));
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(transformation(extent = {{10, -60}, {30, -40}})));
      PhotoVoltaics.Components.Diode2 diode(m = 40 / 25.69, useHeatPort = true) annotation(Placement(transformation(extent = {{-10, 40}, {10, 60}})));
      parameter PhotoVoltaics.Records.ModuleData moduleData annotation(Placement(transformation(extent = {{-10, 80}, {10, 100}})));
      Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 298.15) annotation(Placement(transformation(extent = {{-80, 30}, {-60, 50}})));
    equation
      connect(rampVoltage.p, zDiode.p) annotation(Line(points = {{-10, -20}, {-20, -20}, {-20, 20}, {-10, 20}}, color = {0, 0, 255}));
      connect(zDiode.n, rampVoltage.n) annotation(Line(points = {{10, 20}, {20, 20}, {20, -20}, {10, -20}}, color = {0, 0, 255}));
      connect(ground.p, rampVoltage.n) annotation(Line(points = {{20, -40}, {20, -20}, {10, -20}}, color = {0, 0, 255}));
      connect(rampVoltage.p, diode.p) annotation(Line(points = {{-10, -20}, {-20, -20}, {-20, 50}, {-10, 50}}, color = {0, 0, 255}));
      connect(rampVoltage.n, diode.n) annotation(Line(points = {{10, -20}, {14, -20}, {20, -20}, {20, 50}, {10, 50}}, color = {0, 0, 255}));
      connect(fixedTemperature.port, diode.heatPort) annotation(Line(points = {{-60, 40}, {0, 40}}, color = {191, 0, 0}));
      connect(fixedTemperature.port, zDiode.heatPort) annotation(Line(points = {{-60, 40}, {-50, 40}, {-40, 40}, {-40, 10}, {0, 10}}, color = {191, 0, 0}));
    end TestZener;
  end ComponentTesting;

  package Testing
    extends Modelica.Icons.ExamplesPackage;

    model SimpleCell
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
      PhotoVoltaics.Sources.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      PhotoVoltaics.Components.Cells.Simple cell(moduleData = moduleData) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      parameter PhotoVoltaics.Records.NET_NU_S5_E3E moduleData annotation(Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(cell.p, variableResistor.p) annotation(Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, cell.n) annotation(Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
/* 09.09.2016. Der eRshte VeRshuch wurde mit Werten aus dem Buch Regenerative Energiesysteme von Volker Quaschning durchgeführt. Jedoch ist das Ergebnis nicht das gleiche wie im Buch, deshalb waren wir gezwungen uns im Internet schlau zu machen. --> Zweiter VeRshuch */
      connect(ground.p, variableResistor.n) annotation(Line(points = {{0, -20}, {14, -20}, {40, -20}, {40, -10}}, color = {0, 0, 255}));
      connect(variableResistor.R, powerRamp.y) annotation(Line(points = {{51, -2.22045e-15}, {49.5, -2.22045e-15}, {49.5, 0}, {59, 0}}, color = {0, 0, 127}));
      annotation( experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001));
    end SimpleCell;

    model SimpleCellVoltageSource
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Ramp rampCurrent(duration = 0.6, height = moduleData.VocCellRef + moduleData.BvCell, offset = -moduleData.BvCell, startTime = 0.2) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      PhotoVoltaics.Components.Cells.Simple cell(moduleData = moduleData) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      parameter PhotoVoltaics.Records.NET_NU_S5_E3E moduleData annotation(Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(signalVoltage.n, ground.p) annotation(Line(points = {{40, -10}, {40, -10}, {40, -20}, {0, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(signalVoltage.p, cell.p) annotation(Line(points = {{40, 10}, {40, 10}, {40, 20}, {0, 20}, {0, 10}, {0, 10}}, color = {0, 0, 255}));
      connect(ground.p, cell.n) annotation(Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
/* 09.09.2016. Der eRshte VeRshuch wurde mit Werten aus dem Buch Regenerative Energiesysteme von Volker Quaschning durchgeführt. Jedoch ist das Ergebnis nicht das gleiche wie im Buch, deshalb waren wir gezwungen uns im Internet schlau zu machen. --> Zweiter VeRshuch */
      connect(signalVoltage.v, rampCurrent.y) annotation(Line(points = {{47, 0}, {59, 0}, {59, 0}}, color = {0, 0, 127}));
      annotation( experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001));
    end SimpleCellVoltageSource;

    model SimpleCellCharacteristic "Voltage current characteristic for different irradiances"
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {40, 0})));
      PhotoVoltaics.Components.Cells.Simple cell(useConstantIrradiance = false, moduleData = moduleData) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      parameter Records.NET_NU_S5_E3E moduleData annotation(Placement(transformation(extent = {{60, 60}, {80, 80}})));
      Sources.TriangleAndStep triangleAndStep(T = 1, stepHeight = 1000, triangleHeight = 8, triangleOffset = -4) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Blocks.Power10 power10(k = moduleData.VocCellRef / moduleData.IscRef) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(variableResistor.n, ground.p) annotation(Line(points = {{40, -10}, {40, -10}, {40, -20}, {0, -20}, {0, -30}}, color = {0, 0, 255}));
      connect(cell.p, variableResistor.p) annotation(Line(points = {{0, 10}, {0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, cell.n) annotation(Line(points = {{0, -30}, {0, -18}, {0, -10}, {-1.77636e-15, -10}}, color = {0, 0, 255}));
/* 09.09.2016. Der eRshte VeRshuch wurde mit Werten aus dem Buch Regenerative Energiesysteme von Volker Quaschning durchgeführt. Jedoch ist das Ergebnis nicht das gleiche wie im Buch, deshalb waren wir gezwungen uns im Internet schlau zu machen. --> Zweiter VeRshuch */
      connect(triangleAndStep.step, cell.variableIrradiance) annotation(Line(points = {{-49, 6}, {-30, 6}, {-30, 0}, {-12, 0}}, color = {0, 0, 127}));
      connect(triangleAndStep.triangle, power10.u) annotation(Line(points = {{-49, -6}, {-30, -6}, {-30, -60}, {92, -60}, {92, 0}, {82, 0}}, color = {0, 0, 127}));
      connect(variableResistor.R, power10.y) annotation(Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
      annotation( Documentation(info = "<html>
<p>This example demonstrates the dependency of the voltage current characteristic of photo voltaic cell
as a function of irrandiance. Investigate the following plots:</p>
<ul>
<li><code>cell.iGenerating</code> on the vertical axis and <code>cell.v</code>
on the horizontal axis</li>
<li><code>cell.power</code> on the vertical axis and <code>cell.v</code>
on the horizontal axis</li>
</ul>
</html>"), experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.0001));
    end SimpleCellCharacteristic;

    model SimpleModule
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.Modules.Simple module(T = 298.15, moduleData = moduleData) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Sources.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      parameter Records.NET_NU_S5_E3E moduleData annotation(Placement(transformation(extent = {{60, 60}, {80, 80}})));
    equation
      connect(variableResistor.n, ground.p) annotation(Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(module.p, variableResistor.p) annotation(Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(variableResistor.R, powerRamp.y) annotation(Line(points = {{51, 0}, {59, 0}}, color = {0, 0, 127}));
      connect(ground.p, module.n) annotation(Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
/* 09.09.2016. Der eRshte VeRshuch wurde mit Werten aus dem Buch Regenerative Energiesysteme von Volker Quaschning durchgeführt. Jedoch ist das Ergebnis nicht das gleiche wie im Buch, deshalb waren wir gezwungen uns im Internet schlau zu machen. --> Zweiter VeRshuch */
      annotation( experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001));
    end SimpleModule;

    model SimpleModuleShadow
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Components.Modules.Simple module(T = 298.15, moduleData = moduleData, shadow = cat(1, fill(0.5, 1), fill(0, 47))) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      parameter Records.NET_NU_S5_E3E moduleData annotation(Placement(transformation(extent = {{60, 60}, {80, 80}})));
      Sources.PowerRamp powerRamp(duration = 0.6, height = 8, offset = -4, ref = moduleData.VmpCellRef / moduleData.ImpRef, startTime = 0.2) annotation(Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(powerRamp.y, variableResistor.R) annotation(Line(points = {{59, 0}, {51, 0}}, color = {0, 0, 127}));
      connect(variableResistor.n, ground.p) annotation(Line(points = {{40, -10}, {40, -20}, {0, -20}}, color = {0, 0, 255}));
      connect(module.p, variableResistor.p) annotation(Line(points = {{0, 10}, {0, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
      connect(ground.p, module.n) annotation(Line(points = {{0, -20}, {0, -10}}, color = {0, 0, 255}));
/* 09.09.2016. Der eRshte VeRshuch wurde mit Werten aus dem Buch Regenerative Energiesysteme von Volker Quaschning durchgeführt. Jedoch ist das Ergebnis nicht das gleiche wie im Buch, deshalb waren wir gezwungen uns im Internet schlau zu machen. --> Zweiter VeRshuch */
      annotation( experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001));
    end SimpleModuleShadow;
  end Testing;

  package Components "Components"
    extends Modelica.Icons.Package;

    model Diode "Diode with one exponential function"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
      constant Modelica.SIunits.Charge Q = 1.6021766208E-19 "Elementary charge of electron";
      parameter Real m = 1 "Ideality factor of diode";
      parameter Modelica.SIunits.Resistance R = 1E8 "Parallel ohmic resistance";
      parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Voltage VRef(min = Modelica.Constants.small) = 0.6292 "Reference voltage > 0 at TRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Current IRef(min = Modelica.Constants.small) = 8.540 "Reference current > 0 at TRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaI = +0.00053 "Temperature coefficient of reference current at TRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaV = -0.00340 "Temperature coefficient of reference voltage at TRef*" annotation(Dialog(group = "Reference data"));
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
      i = Ids * (exp(v / m / Vt) - 1) + v / R;
      LossPower = v * i;
      annotation(defaultComponentName = "diode", Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255}), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Text(extent = {{-152, 114}, {148, 74}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-99, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255})}));
    end Diode;

    model Diode2 "Diode with two superimposed exponential functions"
      extends Modelica.Electrical.Analog.Interfaces.OnePort;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
      constant Modelica.SIunits.Charge Q = 1.6021766208E-19 "Elementary charge of electron";
      parameter Real m = 1 "Ideality factor of diode";
      parameter Modelica.SIunits.Resistance R = 1E8 "Parallel ohmic resistance";
      parameter Modelica.SIunits.Voltage Bv = 5.1 "Breakthrough voltage";
      parameter Modelica.SIunits.Current Ibv = 0.7 "Breakthrough knee current";
      parameter Real Nbv = 0.74 "Breakthrough emission coefficient";
      parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Voltage VRef(min = Modelica.Constants.small) = 0.6292 "Reference voltage > 0 at TRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Current IRef(min = Modelica.Constants.small) = 8.540 "Reference current > 0 at TRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaI = +0.00053 "Temperature coefficient of reference current at TRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaV = -0.00340 "Temperature coefficient of reference voltage at TRef*" annotation(Dialog(group = "Reference data"));
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
      i = Ids * (exp(v / m / Vt) - 1) - Ibv * exp(-(v + Bv) / (Nbv * m * Vt)) + v / R;
      LossPower = v * i;
      annotation(defaultComponentName = "diode", Documentation(info = "<html>
           <p>The simple model of a Zener diode is derived from <a href=\"modelica://Modelica.Electrical.Analog.Semiconductors.ZDiode\">ZDiode</a>. It consists of the diode including parallel ohmic resistance <i>R</i>. The diode formula is:
<pre>                v/Vt                -(v+Bv)/(Nbv*Vt)
  i  =  Ids ( e      - 1) - Ibv ( e                  ).</pre>
</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {40, 0}}, color = {0, 0, 255}), Line(points = {{40, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255}), Text(extent = {{-152, 114}, {148, 74}}, textString = "%name", lineColor = {0, 0, 255}), Line(visible = useHeatPort, points = {{0, -101}, {0, -20}}, color = {127, 0, 0}, pattern = LinePattern.Dot)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{30, 0}, {-30, 40}, {-30, -40}, {30, 0}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-99, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{30, 40}, {30, -40}}, color = {0, 0, 255})}));
    end Diode2;

    package Cells "Cells"
      extends Modelica.Icons.Package;

      model Simple
        extends PhotoVoltaics.Interfaces.PartialCell(signalCurrent(final irradianceRef = moduleData.irradianceRef, final alphaRef = moduleData.alphaIsc, final IRef = IphRef), diode(final Bv = moduleData.BvCell, final Ibv = moduleData.Ibv, final Nbv = moduleData.Nbv, final VRef = moduleData.VocCellRef, final IRef = moduleData.IscRef, final alphaI = moduleData.alphaIsc, final alphaV = moduleData.alphaVoc, final R = 1E8, final m = m));
        final parameter Real m(start = 1, fixed = false) "Ideality factor of diode";
        final parameter Modelica.SIunits.Current IsdRef(start = 1E-6, fixed = false) "Reference saturation current of cell";
        final parameter Modelica.SIunits.Current IphRef = moduleData.IscRef "Reference photo current of cell";
      initial equation
        IphRef = IsdRef * (exp(moduleData.VocCellRef / m / moduleData.VtCellRef) - 1);
        IphRef = IsdRef * (exp(moduleData.VmpCellRef / m / moduleData.VtCellRef) - 1) + moduleData.ImpRef;
      equation
        LossPower = diode.LossPower;
        annotation(defaultComponentName = "cell", Icon(coordinateSystem(), graphics = {Polygon(points = {{-80, 60}, {-60, 80}, {60, 80}, {80, 60}, {80, -60}, {60, -80}, {-60, -80}, {-80, -60}, {-80, 60}}, pattern = LinePattern.None, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid), Line(points = {{-40, 80}, {-40, -80}}, color = {255, 255, 255}), Line(points = {{40, 80}, {40, -80}}, color = {255, 255, 255}), Text(extent = {{-150, -140}, {150, -100}}, textString = "%name", lineColor = {0, 0, 255})}));
      end Simple;
    end Cells;

    package Modules "Modules"
      extends Modelica.Icons.Package;

      model Simple "Simple module consisting of series connected cells"
        extends PhotoVoltaics.Interfaces.PartialComponent;
        parameter Real shadow[moduleData.ns] = zeros(moduleData.ns) "Shadow vecotor based on: 0 = full sun, 1 = full shadow";
        Cells.Simple cell[moduleData.ns](final useHeatPort = fill(useHeatPort, moduleData.ns), final T = fill(T, moduleData.ns), final constantIrradiance = fill(constantIrradiance, moduleData.ns), final moduleData = fill(moduleData, moduleData.ns), final useConstantIrradiance = fill(false, moduleData.ns)) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalCollector collectorModule(final m = moduleData.ns) if useHeatPort annotation(Placement(transformation(extent = {{-10, -60}, {10, -40}})));
        Blocks.GainReplicator gainReplicator(final n = moduleData.ns, final k = PhotoVoltaics.Functions.limit(ones(moduleData.ns) - shadow, zeros(moduleData.ns), ones(moduleData.ns))) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 40})));
        Diode diode[moduleData.nb](final useHeatPort = fill(useHeatPort, moduleData.nb), final T = fill(T, moduleData.nb), final m = fill(1, moduleData.nb), final R = fill(1E8, moduleData.nb), final TRef = fill(moduleData.TRef, moduleData.nb), final IRef = fill(moduleData.IscRef, moduleData.nb), final alphaI = fill(0, moduleData.nb), final alphaV = fill(0, moduleData.nb), final VRef = fill(0.5, moduleData.nb)) annotation(Placement(transformation(extent = {{-20, -30}, {-40, -10}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalCollector collectorByPass(final m = moduleData.nb) if useHeatPort annotation(Placement(transformation(extent = {{-40, -60}, {-20, -40}})));
      equation
        assert(mod(moduleData.ns, moduleData.nb) == 0, "Simple: number of bypassed cells cannot be determined unambiguously");
        LossPower = sum(cell.LossPower);
// Connect cells to module
        connect(p, cell[1].p) annotation(Line(points = {{-100, 0}, {-100, 0}, {-10, 0}}, color = {0, 0, 255}));
        for k in 1:moduleData.ns - 1 loop
          connect(cell[k].n, cell[k + 1].p);
        end for;
// Inter-module connections
        connect(cell[moduleData.ns].n, n) annotation(Line(points = {{10, 0}, {100, 0}}, color = {0, 0, 255}));
        connect(cell.heatPort, collectorModule.port_a) annotation(Line(points = {{0, -10}, {0, -40}}, color = {191, 0, 0}));
        connect(collectorModule.port_b, heatPort) annotation(Line(points = {{0, -60}, {0, -80}, {0, -100}}, color = {191, 0, 0}));
        connect(irradiance, gainReplicator.u) annotation(Line(points = {{0, 70}, {0, 70}, {0, 52}}, color = {0, 0, 127}));
        connect(gainReplicator.y, cell.variableIrradiance) annotation(Line(points = {{-2.22045e-15, 29}, {0, 18.5}, {0, 12}}, color = {0, 0, 127}));
// Connect bypass diodes
        for k in 1:moduleData.nb loop
          connect(diode[k].n, cell[(k - 1) * div(moduleData.ns, moduleData.nb) + 1].p) annotation(Line(points = {{-40, -20}, {-50, -20}, {-60, -20}, {-60, 0}, {-10, 0}}, color = {0, 0, 255}));
          connect(diode[k].p, cell[k * div(moduleData.ns, moduleData.nb)].n) annotation(Line(points = {{-20, -20}, {20, -20}, {60, -20}, {60, 0}, {10, 0}}, color = {0, 0, 255}));
        end for;
        connect(collectorByPass.port_a, diode.heatPort) annotation(Line(points = {{-30, -40}, {-30, -30}}, color = {191, 0, 0}));
        connect(collectorByPass.port_b, heatPort) annotation(Line(points = {{-30, -60}, {-30, -60}, {-30, -96}, {-30, -100}, {0, -100}}, color = {191, 0, 0}));
        annotation(defaultComponentName = "module", Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(lineColor = {0, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}, fillColor = {85, 85, 255}), Line(points = {{-40, 80}, {-40, -80}}, color = {255, 255, 255}), Line(points = {{0, 80}, {0, -80}}, color = {255, 255, 255}), Line(points = {{40, 80}, {40, -80}}, color = {255, 255, 255}), Line(points = {{-80, 40}, {80, 40}}, color = {255, 255, 255}), Line(points = {{-80, 0}, {80, 0}}, color = {255, 255, 255}), Line(points = {{-80, -40}, {80, -40}}, color = {255, 255, 255}), Rectangle(extent = {{-84, 84}, {84, -84}}, lineColor = {0, 0, 0}), Polygon(points = {{-44, 40}, {-40, 44}, {-36, 40}, {-40, 36}, {-44, 40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-4, 40}, {0, 44}, {4, 40}, {0, 36}, {-4, 40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{36, 40}, {40, 44}, {44, 40}, {40, 36}, {36, 40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{76, 80}, {80, 84}, {84, 80}, {80, 76}, {76, 80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{36, 80}, {40, 84}, {44, 80}, {40, 76}, {36, 80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-4, 80}, {0, 84}, {4, 80}, {0, 76}, {-4, 80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-44, 80}, {-40, 84}, {-36, 80}, {-40, 76}, {-44, 80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, 40}, {-80, 44}, {-76, 40}, {-80, 36}, {-84, 40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, 0}, {-80, 4}, {-76, 0}, {-80, -4}, {-84, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, -40}, {-80, -36}, {-76, -40}, {-80, -44}, {-84, -40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, -80}, {-80, -76}, {-76, -80}, {-80, -84}, {-84, -80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-44, -40}, {-40, -36}, {-36, -40}, {-40, -44}, {-44, -40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-44, 0}, {-40, 4}, {-36, 0}, {-40, -4}, {-44, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-4, 0}, {0, 4}, {4, 0}, {0, -4}, {-4, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{36, 0}, {40, 4}, {44, 0}, {40, -4}, {36, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{76, 0}, {80, 4}, {84, 0}, {80, -4}, {76, 0}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{76, 40}, {80, 44}, {84, 40}, {80, 36}, {76, 40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{78, -40}, {82, -36}, {86, -40}, {82, -44}, {78, -40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{36, -40}, {40, -36}, {44, -40}, {40, -44}, {36, -40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-4, -40}, {0, -36}, {4, -40}, {0, -44}, {-4, -40}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-84, 80}, {-80, 84}, {-76, 80}, {-80, 76}, {-84, 80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-44, -78}, {-40, -74}, {-36, -78}, {-40, -82}, {-44, -78}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{-4, -80}, {0, -76}, {4, -80}, {0, -84}, {-4, -80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{36, -80}, {40, -76}, {44, -80}, {40, -84}, {36, -80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Polygon(points = {{76, -80}, {80, -76}, {84, -80}, {80, -84}, {76, -80}}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Line(points = {{-68, 80}, {-68, -80}}, color = {255, 255, 255}), Line(points = {{-52, 80}, {-52, -80}}, color = {255, 255, 255}), Line(points = {{-12, 80}, {-12, -80}}, color = {255, 255, 255}), Line(points = {{-28, 80}, {-28, -80}}, color = {255, 255, 255}), Line(points = {{28, 80}, {28, -80}}, color = {255, 255, 255}), Line(points = {{12, 80}, {12, -80}}, color = {255, 255, 255}), Line(points = {{68, 80}, {68, -80}}, color = {255, 255, 255}), Line(points = {{52, 80}, {52, -80}}, color = {255, 255, 255})}));
      end Simple;
    end Modules;
  end Components;

  package Blocks "Blocks"
    extends Modelica.Icons.Package;

    block GainReplicator "Output the product of a gain value with the input signal"
      parameter Integer n "Number of outputs";
      parameter Real k[n](start = ones(n), unit = "1") "Gain value multiplied with input signal";
    public
      Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}})));
      Modelica.Blocks.Interfaces.RealOutput y[n] "Output signal connectors" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}})));
    equation
      y = k * u;
      annotation(Documentation(info = "<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, -100}, {-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, -140}, {150, -100}}, lineColor = {0, 0, 0}, textString = "k=%k"), Text(extent = {{-150, 140}, {150, 100}}, textString = "%name", lineColor = {0, 0, 255}), Ellipse(extent = {{-14, 16}, {16, -14}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid), Line(points = {{0, 0}, {100, 10}}, color = {0, 0, 127}), Line(points = {{0, 0}, {100, -10}}, color = {0, 0, 127}), Line(points = {{100, 0}, {-100, 0}}, color = {0, 0, 127})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-100, -100}, {-100, 100}, {100, 0}, {-100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-76, 38}, {0, -34}}, textString = "k", lineColor = {0, 0, 255})}));
    end GainReplicator;

    model Power10
      extends Modelica.Blocks.Interfaces.SISO;
      parameter Real k "Gain";
    equation
      y = k * 10 ^ u;
      annotation(Icon(coordinateSystem(), graphics = {Polygon(origin = {-10, -40}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, 8}, {68, -8}, {90, 0}}), Line(origin = {10, -40}, points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Line(origin = {-18, 14}, rotation = 180, points = {{-79.6, -46}, {-76.8, -21.3}, {-75.2, -11.4}, {-72.8, -1.31}, {-69.5, 8.08}, {-64.7, 17.9}, {-57.5, 28}, {-47, 38.1}, {-31.8, 48.1}, {-10.1, 58}, {22.1, 66}, {62.7, 72.1}}, smooth = Smooth.Bezier), Polygon(origin = {80, -8}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(origin = {80, 0}, points = {{-80, -80}, {-80, 68}}, color = {192, 192, 192}), Text(origin = {-16, 62}, lineColor = {192, 192, 192}, extent = {{-30, -22}, {60, -70}}, textString = "10^", fontName = "DejaVu Sans Mono")}), Documentation(info = "<html>
<p>This block calculates <code>y = k * 10^u</code> and
represents thus the inverse of
<a href=\"modelica://Modelica.Blocks.Math.Log10\">Log10</a>.
</html>"), Diagram);
    end Power10;
  end Blocks;

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
  end Functions;

  package Sources "Sources"
    extends Modelica.Icons.Package;

    model SignalCurrent "Generic current source using the input signal as source current"
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
      parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature";
      parameter Modelica.SIunits.Current IRef = 1 "Reference current at reference irradiance and reference temperature";
      parameter Modelica.SIunits.Irradiance irradianceRef = 1000 "Reference solar irradiance";
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaRef = 0 "Temperature coefficient of reference current at TRref";
      Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(transformation(extent = {{110, -10}, {90, 10}})));
      Modelica.SIunits.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
      Modelica.SIunits.Current i "Current flowing from pin p to pin n as input signal";
      Modelica.Blocks.Interfaces.RealInput irradiance(unit = "W/m2") "Irradiance" annotation(Placement(transformation(origin = {0, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));
    equation
      i = IRef * (irradiance / irradianceRef + alphaRef * (T_heatPort - TRef));
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
      LossPower = 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 170}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -90}, {150, -50}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-96, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {96, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255})}), Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));
    end SignalCurrent;

    block PowerRamp "Generate ramp signal based logarithmic range"
      parameter Real height = 1 "Height of ramps";
      parameter Modelica.SIunits.Time duration(min = 0.0, start = 2) "Duration of ramp (= 0.0 gives a Step)";
      parameter Real offset = 0 "Offset of output signal";
      parameter Modelica.SIunits.Time startTime = 0 "Output = offset for time < startTime";
      parameter Real ref = 1 "Reference value, determined by ref * 10 ^ (ramp function)";
      extends Modelica.Blocks.Interfaces.SO;
    equation
      y = ref * 10 ^ (offset + (if time < startTime then 0 else if time < startTime + duration then (time - startTime) * height / duration else height));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-80, 68}, {-80, -80}}, color = {192, 192, 192}), Polygon(points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-90, -70}, {82, -70}}, color = {192, 192, 192}), Polygon(points = {{90, -70}, {68, -62}, {68, -78}, {90, -70}}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid), Line(points = {{-80, -70}, {-40, -70}, {31, 38}}), Text(extent = {{-150, -150}, {150, -110}}, lineColor = {0, 0, 0}, textString = "duration=%duration"), Line(points = {{31, 38}, {86, 38}})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-80, 90}, {-86, 68}, {-74, 68}, {-80, 90}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-80, 68}, {-80, -80}}, color = {95, 95, 95}), Line(points = {{-80, -20}, {-20, -20}, {50, 50}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{-90, -70}, {82, -70}}, color = {95, 95, 95}), Polygon(points = {{90, -70}, {68, -64}, {68, -76}, {90, -70}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{-40, -20}, {-42, -30}, {-38, -30}, {-40, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Line(points = {{-40, -20}, {-40, -70}}, color = {95, 95, 95}), Polygon(points = {{-40, -70}, {-42, -60}, {-38, -60}, {-40, -70}, {-40, -70}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Text(extent = {{-72, -39}, {-34, -50}}, lineColor = {0, 0, 0}, textString = "offset"), Text(extent = {{-38, -72}, {6, -83}}, lineColor = {0, 0, 0}, textString = "startTime"), Text(extent = {{-78, 92}, {-37, 72}}, lineColor = {0, 0, 0}, textString = "y"), Text(extent = {{70, -80}, {94, -91}}, lineColor = {0, 0, 0}, textString = "time"), Line(points = {{-20, -20}, {-20, -70}}, color = {95, 95, 95}), Line(points = {{-19, -20}, {50, -20}}, color = {95, 95, 95}), Line(points = {{50, 50}, {101, 50}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{50, 50}, {50, -20}}, color = {95, 95, 95}), Polygon(points = {{50, -20}, {42, -18}, {42, -22}, {50, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{-20, -20}, {-11, -18}, {-11, -22}, {-20, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{50, 50}, {48, 40}, {52, 40}, {50, 50}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Polygon(points = {{50, -20}, {48, -10}, {52, -10}, {50, -20}, {50, -20}}, lineColor = {95, 95, 95}, fillColor = {95, 95, 95}, fillPattern = FillPattern.Solid), Text(extent = {{53, 23}, {82, 10}}, lineColor = {0, 0, 0}, textString = "height"), Text(extent = {{-2, -21}, {37, -33}}, lineColor = {0, 0, 0}, textString = "duration")}), Documentation(info = "<html>
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
      parameter Real triangleOffset = 0 "Offsett of triangle output";
      Modelica.Blocks.Sources.Ramp ramp(final startTime = startTime, final height = stepNumber - 1, final duration = T * (stepNumber - 1) / stepNumber, final offset = 0) annotation(Placement(transformation(extent = {{-100, 0}, {-80, 20}})));
      Modelica.Blocks.Math.RealToInteger realToInteger annotation(Placement(transformation(extent = {{-40, 0}, {-20, 20}})));
      Modelica.Blocks.Math.IntegerToReal integerToReal annotation(Placement(transformation(extent = {{-10, 0}, {10, 20}})));
      Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-70, 0}, {-50, 20}})));
      Modelica.Blocks.Sources.Constant const(final k = 0.5) annotation(Placement(transformation(extent = {{-100, -40}, {-80, -20}})));
      Modelica.Blocks.Sources.Constant constantOffset(final k = stepOffset) annotation(Placement(transformation(extent = {{20, 40}, {40, 60}})));
      Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{52, 0}, {72, 20}})));
      Modelica.Blocks.Math.Gain gain(final k = stepHeight / (stepNumber - 1)) annotation(Placement(transformation(extent = {{20, 0}, {40, 20}})));
      Modelica.Blocks.Sources.Trapezoid trapezoid(final amplitude = triangleHeight, final rising = T / stepNumber / 2, final width = 0, final falling = T / stepNumber / 2, final period = T / stepNumber, final nperiod = stepNumber, final offset = triangleOffset, final startTime = startTime) annotation(Placement(transformation(extent = {{60, -70}, {80, -50}})));
      Modelica.Blocks.Interfaces.RealOutput step annotation(Placement(transformation(extent = {{100, 50}, {120, 70}})));
      Modelica.Blocks.Interfaces.RealOutput triangle annotation(Placement(transformation(extent = {{100, -70}, {120, -50}})));
    equation
      connect(realToInteger.y, integerToReal.u) annotation(Line(points = {{-19, 10}, {-12, 10}}, color = {255, 127, 0}));
      connect(ramp.y, feedback.u1) annotation(Line(points = {{-79, 10}, {-68, 10}}, color = {0, 0, 127}));
      connect(feedback.y, realToInteger.u) annotation(Line(points = {{-51, 10}, {-42, 10}}, color = {0, 0, 127}));
      connect(const.y, feedback.u2) annotation(Line(points = {{-79, -30}, {-60, -30}, {-60, 2}}, color = {0, 0, 127}));
      connect(integerToReal.y, gain.u) annotation(Line(points = {{11, 10}, {18, 10}}, color = {0, 0, 127}));
      connect(constantOffset.y, add.u1) annotation(Line(points = {{41, 50}, {44, 50}, {44, 16}, {50, 16}}, color = {0, 0, 127}));
      connect(gain.y, add.u2) annotation(Line(points = {{41, 10}, {44, 10}, {44, 4}, {50, 4}}, color = {0, 0, 127}));
      connect(add.y, step) annotation(Line(points = {{73, 10}, {90, 10}, {90, 60}, {110, 60}}, color = {0, 0, 127}));
      connect(trapezoid.y, triangle) annotation(Line(points = {{81, -60}, {110, -60}}, color = {0, 0, 127}));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{-60, 40}, {-20, 40}, {-20, 60}, {20, 60}, {20, 80}, {60, 80}}, color = {0, 0, 255}), Line(points = {{-58, -80}, {-40, -40}, {-20, -80}, {0, -40}, {20, -80}, {40, -40}, {60, -80}}, color = {0, 0, 255}), Text(origin = {1, 130}, lineColor = {0, 0, 255}, extent = {{-149, -20}, {149, 20}}, textString = "%name")}), Documentation(info = "<html>
<p>The step output starts from <code>stepOffset</code> and increases to <code>stepOffset + stepHeight</code> in <code>stepNumber</code>steps. The total duration of all step changes is equal to <code>T</code>. </p>
<p>During each step the <code>triangle</code> output is increased from
<code>triangleOffset</code> to <code>triangleOffset + triangleHeight</code>
and back to <code>triangleOffset</code>.</p>
<p>This way a variable sweep (<code>triangleOffset</code>) can be performed for different
stepwise changed variables (<code>step</code>).
</html>"));
    end TriangleAndStep;
  end Sources;

  package Records "Records"
    record ModuleData "Data of PV module"
      extends Modelica.Icons.Record;
      constant String moduleType = "empty";
      constant Modelica.SIunits.Charge Q = 1.6021766208E-19 "Elementary charge of electron";
      parameter Modelica.SIunits.Temperature TRef = 298.15 "Reference temperature" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Irradiance irradianceRef = 1000 "Reference solar irradiance" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Voltage VocRef(min = Modelica.Constants.small) = 30.2 "Reference open circuit module voltage > 0 at TRref" annotation(Dialog(group = "Reference data"));
      final parameter Modelica.SIunits.Voltage VocCellRef = VocRef / ns "Reference open circuit cell voltage > 0 at TRref";
      parameter Modelica.SIunits.Current IscRef(min = Modelica.Constants.small) = 8.54 "Reference short circuit current > 0 at TRref and irradianceRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.Voltage VmpRef(min = Modelica.Constants.small) = 24.0 "Reference maximum power module voltage > 0 at TRref" annotation(Dialog(group = "Reference data"));
      final parameter Modelica.SIunits.Voltage VmpCellRef = VmpRef / ns "Reference maximum power cell voltage > 0 at TRref";
      parameter Modelica.SIunits.Current ImpRef(min = Modelica.Constants.small) = 7.71 "Reference maximum power current > 0 at TRref and irradianceRef" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaIsc = +0.00053 "Temperature coefficient of reference short circuit current at TRref" annotation(Dialog(group = "Reference data"));
      parameter Modelica.SIunits.LinearTemperatureCoefficient alphaVoc = -0.00340 "Temperature coefficient of reference open circuit module voltage at TRref" annotation(Dialog(group = "Reference data"));
      parameter Integer ns = 48 "Number of series connected cells";
      parameter Integer nb = 1 "Number of bypass diodes per module";
      parameter Modelica.SIunits.Voltage BvCell = 18 "Breakthrough cell voltage" annotation(Dialog(group = "Breakthrough data"));
      parameter Modelica.SIunits.Current Ibv = 1 "Breakthrough knee current" annotation(Dialog(group = "Breakthrough data"));
      parameter Real Nbv = 0.74 "Breakthrough emission coefficient" annotation(Dialog(group = "Breakthrough data"));
      /*
                                                  parameter Modelica.SIunits.Resistance RsCell = 0 "Series resistance of cell" annotation(Dialog(group = "Non-ideal effects"));
                                                  parameter Modelica.SIunits.Resistance RshCell = 1E8 "Shunt resistance of cell" annotation(Dialog(group = "Non-ideal effects"));
                                                  */
      final parameter Modelica.SIunits.Voltage VtCellRef = Modelica.Constants.k * TRef / Q "Reference temperature voltage of cell";
      annotation(defaultComponentPrefixes = "parameter", Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Text(extent = {{-100, -10}, {100, -30}}, lineColor = {28, 108, 200}, textString = "%moduleType")}));
    end ModuleData;

    extends Modelica.Icons.Package;

    record NET_NU_S5_E3E "NET NU monocrystalline SI cell 185W"
      extends ModuleData(moduleType = "NET_NU_S5_E3E", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 30.2, final IscRef = 8.54, final VmpRef = 24.0, final ImpRef = 7.71, final alphaIsc = +0.00053, final alphaVoc = -0.00340, final ns = 48, final nb = 3);
      annotation(defaultComponentName = "moduleData", defaultComponentPrefixes = "parameter", Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.neue-energie-technik.net/solarmodule/NU180W-scr.pdf\">Neue Energie Technik</a>. An offline version of these data is also
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/NET_NU_S5_E3E.pdf\">available</a>.
</html>"));
    end NET_NU_S5_E3E;

    record NET_NU_S5_E3F "NET NU monocrystalline SI cell 185W"
      extends ModuleData(moduleType = "NET_NU_S5_E3F", final TRef = 298.15, final irradianceRef = 1000, final VocRef = 30.2, final IscRef = 8.54, final VmpRef = 24.0, final ImpRef = 7.71, final alphaIsc = +0.00053, final alphaVoc = -0.00340, final ns = 48, final nb = 3);
      annotation(defaultComponentName = "moduleData", defaultComponentPrefixes = "parameter", Documentation(info = "<html>
The original data of this module are taken from
<a href=\"http://www.neue-energie-technik.net/solarmodule/NU180W-scr.pdf\">Neue Energie Technik</a>. An offline version of these data is also
<a href=\"modelica://PhotoVoltaics/Resources/DataSheets/NET_NU_S5_E3E.pdf\">available</a>.
</html>"));
    end NET_NU_S5_E3F;
  end Records;

  package Interfaces "Interfaces"
    extends Modelica.Icons.InterfacesPackage;

    partial model PartialCell "Partial cell model"
      extends PhotoVoltaics.Interfaces.PartialComponent;
      Components.Diode2 diode(final useHeatPort = useHeatPort, final T = T, final TRef = moduleData.TRef) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Sources.SignalCurrent signalCurrent(final useHeatPort = useHeatPort, final T = T, final TRef = moduleData.TRef) annotation(Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
    equation
      connect(p, diode.p) annotation(Line(points = {{-100, 0}, {-60, 0}, {-10, 0}}, color = {0, 0, 255}));
      connect(diode.p, signalCurrent.n) annotation(Line(points = {{-10, 0}, {-20, 0}, {-20, 30}, {-10, 30}}, color = {0, 0, 255}));
      connect(n, diode.n) annotation(Line(points = {{100, 0}, {100, 0}, {10, 0}}, color = {0, 0, 255}));
      connect(diode.n, signalCurrent.p) annotation(Line(points = {{10, 0}, {20, 0}, {20, 30}, {10, 30}}, color = {0, 0, 255}));
      connect(diode.heatPort, heatPort) annotation(Line(points = {{0, -10}, {0, -10}, {60, -10}, {60, -80}, {0, -80}, {0, -100}}, color = {191, 0, 0}));
      connect(signalCurrent.heatPort, heatPort) annotation(Line(points = {{-1.33227e-15, 20}, {60, 20}, {60, -80}, {0, -80}, {0, -100}}, color = {191, 0, 0}));
      connect(signalCurrent.irradiance, irradiance) annotation(Line(points = {{8.88178e-16, 37}, {8.88178e-16, 44}, {0, 44}, {0, 70}}, color = {0, 0, 127}));
    end PartialCell;

    partial model PartialComponent "Partial cell or module"
      extends Modelica.Electrical.Analog.Interfaces.TwoPin;
      extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T = 298.15);
      parameter Boolean useConstantIrradiance = true "If false, signal input is used" annotation(Evaluate = true, HideResult = true, choices(checkBox = true));
      parameter Modelica.SIunits.Irradiance constantIrradiance = 1000 "Constant solar irradiance, if useConstantIrradiance = true" annotation(Dialog(enable = useConstantIrradiance));
      parameter Records.ModuleData moduleData "Simple module parameters" annotation(choicesAllMatching = true, Placement(transformation(extent = {{60, 60}, {80, 80}})));
      Modelica.SIunits.Current i = p.i "Current";
      Modelica.SIunits.Current iGenerating = -i "Negative current (generating)";
      Modelica.SIunits.Power power = v * i "Power";
      Modelica.SIunits.Power powerGenerating = v * iGenerating "Negatwive power consumption (generating)";
      Modelica.Blocks.Interfaces.RealInput variableIrradiance(unit = "W/m2") if not useConstantIrradiance "Solar irradiance" annotation(Placement(transformation(extent = {{20, -20}, {-20, 20}}, rotation = 90, origin = {0, 120}), iconTransformation(extent = {{20, -20}, {-20, 20}}, rotation = 90, origin = {0, 120})));
      Modelica.Blocks.Sources.Constant const(final k = constantIrradiance) if useConstantIrradiance annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-30, 80})));
    protected
      Modelica.Blocks.Interfaces.RealInput irradiance(unit = "W/m2") "Solar irradiance (either constant or signal input)" annotation(Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {0, 70})));
    equation
      connect(irradiance, variableIrradiance) annotation(Line(points = {{0, 70}, {0, 70}, {0, 120}}, color = {0, 0, 127}));
      connect(const.y, irradiance) annotation(Line(points = {{-19, 80}, {-20, 80}, {-20, 80}, {0, 80}, {0, 80}, {0, 70}, {0, 70}}, color = {0, 0, 127}));
      connect(irradiance, irradiance) annotation(Line(points = {{0, 70}, {0, 70}}, color = {0, 0, 127}));
    end PartialComponent;
  end Interfaces;
  annotation(Icon(coordinateSystem(), graphics = {Ellipse(origin = {36, 75}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{0, 1}, {40, -39}}, endAngle = 360), Rectangle(origin = {-60, -9}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {0, -7}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {-60, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {0, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {60, -61}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Rectangle(origin = {60, -5}, lineColor = {85, 85, 255}, fillColor = {85, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-10, 11}, {10, -9}}), Line(origin = {18, 34}, points = {{4, 10}, {-84, -16}}), Line(origin = {-12, 70}, points = {{34, -6}, {-34, 6}}), Line(points = {{36, 30}, {28, 16}}, color = {28, 108, 200})}), uses(Modelica(version = "3.2.2")));
end PhotoVoltaics;
