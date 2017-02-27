within PhotoVoltaics.Functions;
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
  annotation (Documentation(info="<html>
<p>Calculate the day of the year (between 1 and 365 or 366).</p>
</html>"));
end dayOfTheYear;
