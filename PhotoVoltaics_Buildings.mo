package PhotoVoltaics_Buildings
  extends Modelica.Icons.Package;

  model PVPanels "This example illustrates how to use PV panel models"
    extends Modelica.Icons.Example;
    Buildings.BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil(til = 0.34906585039887, lat = 0.65798912800186, azi = -0.78539816339745) "Diffuse irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-50,30},{-30,50}},      rotation = 0)));
    Buildings.BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil(til = 0.34906585039887, lat = 0.65798912800186, azi = -0.78539816339745) "Direct irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-50,-10},{-30,10}},     rotation = 0)));
    Modelica.Blocks.Math.Add G "Total irradiation on tilted surface" annotation (
      Placement(visible = true, transformation(extent={{-10,10},{10,30}},      rotation = 0)));
    PhotoVoltaics.Components.SimplePlantSymmetric plant(
      useConstantIrradiance=false,
      moduleData=moduleData,
      nsModule=1,
      npModule=1) annotation (Placement(visible=true, transformation(
          origin={50,20},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Electrical.Analog.Basic.Ground ground annotation (
      Placement(visible = true, transformation(origin={50,-12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter PhotoVoltaics.Records.TSM_200_DC01A
                                    moduleData annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Buildings.BoundaryConditions.WeatherData.ReaderTMY3
                                              weaDat(
        computeWetBulbTemperature=false, filNam="modelica://Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
      annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
  equation
    connect(HDirTil.H, G.u2) annotation (
      Line(points={{-29,0},{-24,0},{-24,14},{-12,14}},            color = {0, 0, 127}));
    connect(HDifTil.H, G.u1) annotation (
      Line(points={{-29,40},{-24,40},{-24,26},{-12,26}},          color = {0, 0, 127}));
    connect(G.y, plant.variableIrradiance) annotation (Line(points={{11,20},{38,20}}, color={0,0,127}));
    connect(ground.p, plant.n) annotation (Line(points={{50,-2},{50,-2},{50,10}}, color={0,0,255}));
    connect(weaDat.weaBus, HDifTil.weaBus) annotation (Line(
        points={{-80,40},{-50,40}},
        color={255,204,51},
        thickness=0.5));
    connect(weaDat.weaBus, HDirTil.weaBus) annotation (Line(
        points={{-80,40},{-60,40},{-60,0},{-50,0}},
        color={255,204,51},
        thickness=0.5));
    annotation (
      experiment(StopTime = 172800, Tolerance = 1e-05),
      __Dymola_Commands(file = "modelica://Buildings/Resources/Scripts/Dymola/Electrical/AC/OnePhase/Sources/Examples/PVpanels.mos" "Simulate and plot"),
      Documentation(revisions = "<html>
<ul>
<li>
August 5, 2014, by Marco Bonvini:<br/>
Revised model and documentation.
</li>
</ul>
</html>", info = "<html>
<p>
This example shows how to use a simple PV model without orientation
as well a PV model with orientation. The power produced by the PV is
partially consumed by the load while the remaining part is fed into
the grid.
</p>
</html>"),
      uses(Modelica(version = "3.2.2")));
  end PVPanels;
  annotation (
    Documentation(info = "<html>
<p>This is fully unmaintained code for testing purposes only.</p>
</html>"), uses(Buildings(version="3.0.0")));
end PhotoVoltaics_Buildings;
