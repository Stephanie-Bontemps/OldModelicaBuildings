within ;
model Experiment1N2SouthMorris
  "First validation exercise on the model of a part of N2 Twin House (corridor, bathroom, south bedroom, living room)"
  extends Modelica.Icons.Example;
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2SouthModel N2SouPar(
    kHea=1E6,
    kCoo=0,
    nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
    lat(displayUnit="deg") = 0.83555892609977,
    redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
    nomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
    nomFichierBouOthRoo=
        "D:/Berkeley/Berkeley - IEA58/BouOthRooCorBatSouBedLivRooExp1.txt",
    nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
    Tini_int=303.15,
    Tini_ext=283.15,
    Tini_bou=303.15)
    annotation (Placement(transformation(extent={{-80,-40},{0,40}})));

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    TDryBulSou=Buildings.BoundaryConditions.Types.DataSource.File,
    relHumSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winSpeSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winDirSou=Buildings.BoundaryConditions.Types.DataSource.File,
    HSou=Buildings.BoundaryConditions.Types.RadiationDataSource.File,
    HInfHorSou=Buildings.BoundaryConditions.Types.DataSource.File,
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.TemperaturesAndSkyCover,
    pAtmSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    ceiHeiSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    totSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    opaSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    TBlaSkySou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    filNam="D:/Berkeley/Berkeley - IEA58/Holzkirchen_EXP1_TMY3.mos")
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));

  Modelica.Blocks.Sources.CombiTimeTable measurements(
    tableOnFile=true,
    tableName="data",
    columns=2:35,
    fileName="D:/Berkeley/Berkeley - IEA58/Twin_house_exp1_house_N2_60min_modified.txt")
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));

  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TairC[4]
    "Air temperature in the different rooms in °C"
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TradC[4]
    "Radiative temperature in the different rooms in °C"
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica.Blocks.Math.Add Tresiduals[4](each k1=-1, each k2=+1)
    annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin[4]
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Modelica.Blocks.Math.Add Presiduals[3](each k1=-1, each k2=+1)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
equation
  connect(weaDat.weaBus, N2SouPar.weaBus) annotation (Line(
      points={{-30,70},{-1.84615,70},{-1.84615,38.4615}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(N2SouPar.Tair, TairC.port) annotation (Line(
      points={{-1.53846,23.0769},{10,23.0769},{10,20},{20,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(N2SouPar.Trad, TradC.port) annotation (Line(
      points={{-1.53846,-23.0769},{10,-23.0769},{10,-20},{20,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TairC.T, Tresiduals.u1) annotation (Line(
      points={{40,20},{50,20},{50,56},{58,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fromKelvin.Celsius, Tresiduals.u2) annotation (Line(
      points={{41,-70},{50,-70},{50,44},{58,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[7], fromKelvin[1].Kelvin) annotation (Line(
      points={{-59,-70},{18,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[8], fromKelvin[2].Kelvin) annotation (Line(
      points={{-59,-70},{18,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[9], fromKelvin[3].Kelvin) annotation (Line(
      points={{-59,-70},{18,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[5], fromKelvin[4].Kelvin) annotation (Line(
      points={{-59,-70},{18,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[20], Presiduals[1].u2) annotation (Line(points={{-59,
          -70},{0,-70},{0,-56},{58,-56}}, color={0,0,127}));
  connect(measurements.y[21], Presiduals[2].u2) annotation (Line(points={{-59,
          -70},{0,-70},{0,-56},{58,-56}}, color={0,0,127}));
  connect(measurements.y[19], Presiduals[3].u2) annotation (Line(points={{-59,
          -70},{0,-70},{0,-56},{58,-56}}, color={0,0,127}));
  connect(N2SouPar.P[2], Presiduals[1].u1) annotation (Line(points={{1.53846,
          -0.384615},{14,-0.384615},{14,-44},{58,-44}},
                                             color={0,0,127}));
  connect(N2SouPar.P[3], Presiduals[2].u1) annotation (Line(points={{1.53846,
          0.384615},{14,0.384615},{14,-44},{58,-44}},
                                             color={0,0,127}));
  connect(N2SouPar.P[4], Presiduals[3].u1) annotation (Line(points={{1.53846,
          1.15385},{14,1.15385},{14,-44},{58,-44}},
                                           color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
  Documentation(
  info="<html>
  <p>
  This example uses <a href=\"Buildings.Rooms.Validation.HlozkirchenTwinHouses.Houses.N2House.N2SouthModel\">
  Buildings.Rooms.Validation.HlozkirchenTwinHouses.Houses..N2House.N2SouthModel</a>. 
  <br>
  The different values of the parameters describing the part of the house have to be given, just as the files with the boundary conditions, the weather data and the measurements.
  <br>
  The residuals on the air temperature are computed as the difference between the measured air temperature and the simulated one. 
  <br>
  In the particular case of the air temperature in the living room, the measured air temperature is the one at a level of 125cm.
  <br>
  The total power in each room is also extracted from the model.
  </p>
  <p></p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  June 22 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"),
    experiment(
      StartTime=2.00448e+007,
      StopTime=2.35836e+007,
      Interval=3600,
      Tolerance=1e-007,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput(events=false),
    uses(Modelica(version="3.2.1"), Buildings(version="3.0.0")));
end Experiment1N2SouthMorris;
