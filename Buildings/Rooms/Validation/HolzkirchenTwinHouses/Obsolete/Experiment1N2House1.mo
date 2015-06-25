within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete;
model Experiment1N2House1 "First validation exercise on N2 House using Model1"
  extends Modelica.Icons.Example;
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete.N2HouseModel1
    N2House(
    kHea=1E6,
    kCoo=0,
    kDooOpeKitLiv=0,
    kDooOpeLobLiv=0,
    kDooOpeNthBedCor=0,
    kDooOpeBatCor=1,
    kDooOpeSthBedCor=1,
    kDooOpeCorLiv=1,
    nomFichierBouVenHeaCoo=
        "D:/Berkeley/Berkeley - IEA58/N2BouVenHeaCooExp1Old.txt",
    nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
    lat(displayUnit="deg") = 0.83555892609977,
    redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
    Tini_int=303.15,
    Tini_ext=283.15,
    Tini_bou=303.15)
    annotation (Placement(transformation(extent={{-80,-40},{0,40}})));

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    pAtmSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    ceiHeiSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    totSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    opaSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    TDryBulSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    relHumSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winSpeSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winDirSou=Buildings.BoundaryConditions.Types.DataSource.File,
    HSou=Buildings.BoundaryConditions.Types.RadiationDataSource.File,
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    HInfHorSou=Buildings.BoundaryConditions.Types.DataSource.File,
    filNam="D:/Berkeley/Berkeley - IEA58/Holzkirchen_EXP1_TMY3.mos")
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));

  Modelica.Blocks.Sources.CombiTimeTable measurements(
    tableOnFile=true,
    tableName="data",
    fileName="D:/Berkeley/Berkeley - IEA58/Twin_house_exp1_house_N2_60min_modified.txt",
    columns=2:35)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));

  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TairC[7]
    "Air temperature in the different rooms in °C"
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TradC[7]
    "Radiative temperature in the different rooms in °C"
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica.Blocks.Math.Add residuals[7](each k1=-1, each k2=+1)
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k1=+1/3,
    k2=+1/3,
    k3=+1/3)
    annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
equation
  connect(weaDat.weaBus, N2House.weaBus) annotation (Line(
      points={{-30,70},{-7.77778,70},{-7.77778,34.4444}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(N2House.Tair, TairC.port) annotation (Line(
      points={{-1.11111,20},{20,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(N2House.Trad, TradC.port) annotation (Line(
      points={{-1.11111,-20},{20,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TairC.T, residuals.u1) annotation (Line(
      points={{40,20},{50,20},{50,-14},{58,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[10], residuals[1].u2) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[11], residuals[2].u2) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[12], residuals[3].u2) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[7], residuals[4].u2) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[8], residuals[5].u2) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[9], residuals[6].u2) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[4], add3_1.u1) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-82},{-42,-82}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[5], add3_1.u2) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-90},{-42,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(measurements.y[6], add3_1.u3) annotation (Line(
      points={{-59,-70},{-50,-70},{-50,-98},{-42,-98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.y, residuals[7].u2) annotation (Line(
      points={{-19,-90},{50,-90},{50,-26},{58,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics),
    experiment(
      StartTime=2.00448e+007,
      StopTime=2.35836e+007,
      Interval=3600,
      Tolerance=1e-005,
      __Dymola_Algorithm="Radau"),
    __Dymola_experimentSetupOutput(events=false));
end Experiment1N2House1;
