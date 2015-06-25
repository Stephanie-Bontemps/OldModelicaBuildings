within ;
model Experiment1N2LobbyNorthBedroomMorris
  "First validation exercise on the model of a part of N2 Twin House (lobby and north bedroom)"
  extends Modelica.Icons.Example;
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2LobbyNorthBedroomModel
    N2LobNorBed(
    kHea=1E6,
    kCoo=0,
    nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
    lat(displayUnit="deg") = 0.83555892609977,
    redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
    nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
    nomFichierBouVenIntGai=
        "D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
    nomFichierBouOthRoo=
        "D:/Berkeley/Berkeley - IEA58/BouOthRooLobNorBedExp1.txt",
    Tini_int=303.15,
    Tini_ext=283.15,
    Tini_bou=303.15)
    annotation (Placement(transformation(extent={{-80,-20},{0,60}})));

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
    annotation (Placement(transformation(extent={{-50,80},{-30,100}})));

  Modelica.Blocks.Sources.CombiTimeTable measurements(
    tableOnFile=true,
    tableName="data",
    columns=2:35,
    fileName=
        "D:/Berkeley/Berkeley - IEA58/Twin_house_exp1_house_N2_60min_modified.txt")
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));

  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TairC[2]
    "Air temperature in the different rooms in °C"
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TradC[2]
    "Radiative temperature in the different rooms in °C"
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Add residuals[2](each k1=-1, each k2=+1)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin[2]
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));

  Modelica.Blocks.Interfaces.RealOutput P[2] "Total power in each room"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  connect(weaDat.weaBus, N2LobNorBed.weaBus) annotation (Line(
      points={{-30,90},{-2.22222,90},{-2.22222,57.7778}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(N2LobNorBed.Tair, TairC.port) annotation (Line(
      points={{-2.22222,40},{20,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(N2LobNorBed.Trad, TradC.port) annotation (Line(
      points={{-2.22222,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TairC.T, residuals.u1) annotation (Line(
      points={{40,40},{60,40},{60,6},{78,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[12], fromKelvin[2].Kelvin) annotation (Line(
      points={{-59,-50},{18,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[11], fromKelvin[1].Kelvin) annotation (Line(
      points={{-59,-50},{18,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fromKelvin.Celsius, residuals.u2) annotation (Line(
      points={{41,-50},{60,-50},{60,-6},{78,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(N2LobNorBed.P, P) annotation (Line(points={{2.22222,20},{2.22222,20},
          {110,20}},
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
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    uses(Modelica(version="3.2.1")));
end Experiment1N2LobbyNorthBedroomMorris;
