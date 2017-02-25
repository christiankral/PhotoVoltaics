within PhotoVoltaics.Sources.Irradiance;
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
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(extent={{-100,100},{100,-100}},      lineColor = {28, 108, 200}),
        Ellipse(
          extent={{-40,40},{40,-40}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{30,48},{80,80},{38,36},{30,48}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{48,-14},{90,-48},{40,-28},{48,-14}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{34,-38},{84,-92},{22,-48},{34,-38}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-10,50},{0,80},{12,50},{-10,50}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-42,30},{-84,78},{-30,42},{-42,30}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-54,-6},{-86,10},{-52,12},{-54,-6}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,-34},{-92,-62},{-50,-18},{-40,-34}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-4,-48},{-28,-92},{-22,-42},{-4,-48}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{46,20},{92,24},{50,6},{46,20}},
          lineColor={255,170,85},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid)}),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end Irradiance;
