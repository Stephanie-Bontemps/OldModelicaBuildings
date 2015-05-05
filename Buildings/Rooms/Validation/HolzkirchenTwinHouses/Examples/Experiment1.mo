within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples;
package Experiment1
  "First validation exercise on the models of the Holzkirchen twin houses"
  extends Modelica.Icons.ExamplesPackage;

  model Experiment1N2House "First validation exercise on N2 House"
    extends Modelica.Icons.Example;
    Houses.N2HouseModel  N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      NomFichierBouVenHeaCoo="D:/Berkeley/Berkeley - IEA58/N2BouVenHeaCooExp1Old.txt",
      NomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      Tini_int=303.15,
      Tini_ext=283.15,
      Tini_bou=303.15)
      annotation (Placement(transformation(extent={{-80,-40},{0,40}})));
    BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
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

    Modelica.Blocks.Sources.CombiTimeTable Measurements(
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
    Modelica.Blocks.Math.Add Residuals[7](each k1=-1, each k2=+1)
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
    connect(TairC.T, Residuals.u1) annotation (Line(
        points={{40,20},{50,20},{50,-14},{58,-14}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[10], Residuals[1].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[11], Residuals[2].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[12], Residuals[3].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[7], Residuals[4].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[8], Residuals[5].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[9], Residuals[6].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[4], add3_1.u1) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-82},{-42,-82}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[5], add3_1.u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-90},{-42,-90}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[6], add3_1.u3) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-98},{-42,-98}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add3_1.y, Residuals[7].u2) annotation (Line(
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
  end Experiment1N2House;

  model Experiment1N2House3
    "First validation exercise on N2 House using model 3"
    extends Modelica.Icons.Example;
    Houses.N2HouseModel3 N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      NomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      NomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
      NomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      Tini_int=303.15,
      Tini_ext=283.15,
      Tini_bou=303.15)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));

    BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
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
      annotation (Placement(transformation(extent={{0,60},{20,80}})));

  equation
    connect(weaDat.weaBus, N2House.weaBus) annotation (Line(
        points={{20,70},{32.2222,70},{32.2222,34.4444}},
        color={255,204,51},
        thickness=0.5,
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
  end Experiment1N2House3;

  model Experiment1N2House4
    "First validation exercise on N2 House using model 4"
    extends Modelica.Icons.Example;
    Houses.N2HouseModel4 N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      NomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      NomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      NomFichierBouVenIntGai=
          "D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
      Tini_int=303.15,
      Tini_ext=283.15,
      Tini_bou=303.15)
      annotation (Placement(transformation(extent={{-80,-40},{0,40}})));
    BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
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

    Modelica.Blocks.Sources.CombiTimeTable Measurements(
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
    Modelica.Blocks.Math.Add Residuals[7](each k1=-1, each k2=+1)
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
    connect(TairC.T, Residuals.u1) annotation (Line(
        points={{40,20},{50,20},{50,-14},{58,-14}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[10], Residuals[1].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[11], Residuals[2].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[12], Residuals[3].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[7], Residuals[4].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[8], Residuals[5].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[9], Residuals[6].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[4], add3_1.u1) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-82},{-42,-82}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[5], add3_1.u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-90},{-42,-90}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[6], add3_1.u3) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-98},{-42,-98}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add3_1.y, Residuals[7].u2) annotation (Line(
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
  end Experiment1N2House4;

  model Experiment1N2House5
    "First validation exercise on N2 House with model 5"
    extends Modelica.Icons.Example;
    Houses.N2HouseModel5 N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      NomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      NomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
      NomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      Tini_int=303.15,
      Tini_ext=283.15,
      Tini_bou=303.15)
      annotation (Placement(transformation(extent={{-80,-40},{0,40}})));

    BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
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

    Modelica.Blocks.Sources.CombiTimeTable Measurements(
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
    Modelica.Blocks.Math.Add Residuals[7](each k1=-1, each k2=+1)
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
    connect(TairC.T, Residuals.u1) annotation (Line(
        points={{40,20},{50,20},{50,-14},{58,-14}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[10], Residuals[1].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[11], Residuals[2].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[12], Residuals[3].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[7], Residuals[4].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[8], Residuals[5].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[9], Residuals[6].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[4], add3_1.u1) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-82},{-42,-82}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[5], add3_1.u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-90},{-42,-90}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[6], add3_1.u3) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-98},{-42,-98}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add3_1.y, Residuals[7].u2) annotation (Line(
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
  end Experiment1N2House5;

  model Experiment1N2House6
    "First validation exercise on N2 House using model 6"
    extends Modelica.Icons.Example;
    Houses.N2HouseModel6 N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      NomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      NomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      NomFichierBouVenIntGai=
          "D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
      Tini_int=303.15,
      Tini_ext=283.15,
      Tini_bou=303.15)
      annotation (Placement(transformation(extent={{-80,-40},{0,40}})));
    BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
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

    Modelica.Blocks.Sources.CombiTimeTable Measurements(
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
    Modelica.Blocks.Math.Add Residuals[7](each k1=-1, each k2=+1)
      annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
    Modelica.Blocks.Math.Add3 add3_1(
      k1=+1/3,
      k2=+1/3,
      k3=+1/3)
      annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  equation
    connect(weaDat.weaBus, N2House.weaBus) annotation (Line(
        points={{-30,70},{-7.77778,70},{-7.77778,36.6667}},
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
    connect(TairC.T, Residuals.u1) annotation (Line(
        points={{40,20},{50,20},{50,-14},{58,-14}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[10], Residuals[1].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[11], Residuals[2].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[12], Residuals[3].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[7], Residuals[4].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[8], Residuals[5].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[9], Residuals[6].u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-60},{50,-60},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[4], add3_1.u1) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-82},{-42,-82}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[5], add3_1.u2) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-90},{-42,-90}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Measurements.y[6], add3_1.u3) annotation (Line(
        points={{-59,-70},{-50,-70},{-50,-98},{-42,-98}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add3_1.y, Residuals[7].u2) annotation (Line(
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
  end Experiment1N2House6;

  model ZenExp1
    "Calculation of the zenith angle to calculate the direct normal radiation with an external file"
    extends Modelica.Icons.Example;

  protected
    Utilities.Time.ModelTime modTim "Model time"
      annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
    BoundaryConditions.WeatherData.BaseClasses.LocalCivilTime           locTim(final
        timZon=3600, final lon=0.20469221467389) "Local civil time"
      annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    BoundaryConditions.WeatherData.BaseClasses.EquationOfTime
                               eqnTim "Equation of time"
      annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
    BoundaryConditions.WeatherData.BaseClasses.SolarTime
                          solTim "Solar time"
      annotation (Placement(transformation(extent={{-20,20},{0,40}})));
     BoundaryConditions.SolarGeometry.BaseClasses.ZenithAngle
                                           zenAng(final lat=0.83301074539185)
      "Zenith angle"
      annotation (Placement(transformation(extent={{60,-10},{80,10}})));
     BoundaryConditions.SolarGeometry.BaseClasses.Declination
                                           decAng "Declination angle"
      annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
     BoundaryConditions.SolarGeometry.BaseClasses.SolarHourAngle
      solHouAng
      annotation (Placement(transformation(extent={{20,20},{40,40}})));
  public
    Modelica.Blocks.Interfaces.RealOutput zen
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  equation
    connect(modTim.y,locTim. cloTim) annotation (Line(
        points={{-79,10},{-62,10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(modTim.y,eqnTim. nDay) annotation (Line(
        points={{-79,10},{-70,10},{-70,50},{-62,50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(eqnTim.eqnTim,solTim. equTim) annotation (Line(
        points={{-39,50},{-30,50},{-30,36},{-22,36}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(locTim.locTim,solTim. locTim) annotation (Line(
        points={{-39,10},{-30,10},{-30,24.6},{-22,24.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(solHouAng.solTim,solTim. solTim) annotation (Line(
        points={{18,30},{1,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(decAng.nDay,modTim. y) annotation (Line(
        points={{-62,-30},{-70,-30},{-70,10},{-79,10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(decAng.decAng, zenAng.decAng) annotation (Line(
        points={{-39,-30},{-10,-30},{-10,5.4},{58,5.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(solHouAng.solHouAng, zenAng.solHouAng) annotation (Line(
        points={{41,30},{48,30},{48,-4.8},{58,-4.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zenAng.zen, zen) annotation (Line(
        points={{81,0},{110,0}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics),
      experiment(
        StartTime=2.00448e+007,
        StopTime=2.35872e+007,
        Interval=1800),
      __Dymola_experimentSetupOutput);
  end ZenExp1;

  model MeasurementsN2HouseExp1
    "Extraction of the measurements on N2 House during Experimentation 1"
    Modelica.Blocks.Sources.CombiTimeTable combiTable1Ds(
      tableOnFile=true,
      tableName="data",
      fileName=
          "D:/Berkeley/Berkeley - IEA58/Twin_house_exp1_house_N2_60min_modified.txt",
      columns=2:35)
      annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

    annotation (experiment(
        StartTime=2.00448e+007,
        StopTime=2.35872e+007,
        Interval=3600,
        __Dymola_Algorithm="Dassl"), __Dymola_experimentSetupOutput);
  end MeasurementsN2HouseExp1;
end Experiment1;
