within ;
model Experiment1N2SouthMorris
  "First validation exercise on the model of a part of N2 Twin House (bathroom, corridor, south bedroom, living room)"
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
  Modelica.Blocks.Math.Add residuals[4](each k1=-1, each k2=+1)
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin[4]
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Modelica.Blocks.Interfaces.RealOutput P[4] "Total power in each room"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
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
  connect(TairC.T, residuals.u1) annotation (Line(
      points={{40,20},{50,20},{50,-14},{58,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fromKelvin.Celsius, residuals.u2) annotation (Line(
      points={{41,-70},{50,-70},{50,-26},{58,-26}},
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
  connect(N2SouPar.P, P) annotation (Line(points={{1.53846,0},{1.53846,0},{110,
          0}},
        color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    experiment(
      StartTime=2.00448e+007,
      StopTime=2.35836e+007,
      Interval=3600,
      Tolerance=1e-007,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentSetupOutput(events=false),
    uses(Modelica(version="3.2.1"), Buildings(version="2.0.1")));
end Experiment1N2SouthMorris;
