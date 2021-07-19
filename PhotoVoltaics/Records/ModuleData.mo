within PhotoVoltaics.Records;
record ModuleData "Data of PV module"
  extends Modelica.Icons.Record;
  parameter String moduleName = "Generic";
  parameter Modelica.Units.SI.Temperature TRef=298.15 "Reference temperature"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.Irradiance irradianceRef=1000
    "Reference solar irradiance" annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.Voltage VocRef(min=Modelica.Constants.small) = 30.2
    "Reference open circuit module voltage > 0 at TRref"
    annotation (Dialog(group="Reference data"));
  final parameter Modelica.Units.SI.Voltage VocCellRef=VocRef/ns
    "Reference open circuit cell voltage > 0 at TRref";
  parameter Modelica.Units.SI.Current IscRef(min=Modelica.Constants.small) = 8.54
    "Reference short circuit current > 0 at TRref and irradianceRef"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.Voltage VmpRef(min=Modelica.Constants.small) = 24.0
    "Reference maximum power module voltage > 0 at TRref"
    annotation (Dialog(group="Reference data"));
  final parameter Modelica.Units.SI.Voltage VmpCellRef=VmpRef/ns
    "Reference maximum power cell voltage > 0 at TRref";
  parameter Modelica.Units.SI.Current ImpRef(min=Modelica.Constants.small) = 7.71
    "Reference maximum power current > 0 at TRref and irradianceRef"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alphaIsc=+0.00053
    "Temperature coefficient of reference short circuit current at TRref"
    annotation (Dialog(group="Reference data"));
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alphaVoc=-0.00340
    "Temperature coefficient of reference open circuit module voltage at TRref"
    annotation (Dialog(group="Reference data"));
  parameter Integer ns = 1 "Number of series connected cells";
  parameter Integer nb = 1 "Number of bypass diodes per module";
  parameter Modelica.Units.SI.Voltage BvCell=18 "Breakthrough cell voltage"
    annotation (Dialog(group="Breakthrough data"));
  parameter Modelica.Units.SI.Current Ibv=1 "Breakthrough knee current"
    annotation (Dialog(group="Breakthrough data"));
  parameter Real Nbv = 0.74 "Breakthrough emission coefficient" annotation (
    Dialog(group = "Breakthrough data"));
  /*
                    parameter Modelica.SIunits.Resistance RsCell = 0 "Series resistance of cell" annotation(Dialog(group = "Non-ideal effects"));
                    parameter Modelica.SIunits.Resistance RshCell = 1E8 "Shunt resistance of cell" annotation(Dialog(group = "Non-ideal effects"));
                    */
  final parameter Modelica.Units.SI.Voltage VtCellRef=Modelica.Constants.k*
      TRef/Q "Reference temperature voltage of cell";
  constant Modelica.Units.SI.Charge Q=1.6021766208E-19
    "Elementary charge of electron";
  annotation (
    defaultComponentName = "moduleData",
    defaultComponentPrefixes = "parameter",
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(lineColor = {0, 0, 255}, extent = {{-200, -150}, {200, -110}}, textString = "%moduleName")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info="<html>
<p>This record defines parameters provided by photovoltaic module manufacturers.</p>
</html>"));
end ModuleData;
