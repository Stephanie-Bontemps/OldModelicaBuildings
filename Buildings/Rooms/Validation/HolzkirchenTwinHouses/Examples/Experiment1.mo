within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples;
package Experiment1
  "First validation exercise on the models of the Holzkirchen twin houses"
  extends Modelica.Icons.ExamplesPackage;

  model Experiment1N2House1
    "First validation exercise on N2 House using Model1"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel1
                                                                                  N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      nomFichierBouVenHeaCoo="D:/Berkeley/Berkeley - IEA58/N2BouVenHeaCooExp1Old.txt",
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

  model Experiment1N2House3
    "First validation exercise on N2 House using model3"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel3
                                                                                  N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      nomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
      nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      Tini_int=303.15,
      Tini_ext=283.15,
      Tini_bou=303.15)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));

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
    "First validation exercise on N2 House using model4"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel4
                                                                                  N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      nomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
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
  end Experiment1N2House4;

  model Experiment1N2House5 "First validation exercise on N2 House with model5"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel5
                                                                                  N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      nomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
      nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
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
  end Experiment1N2House5;

  model Experiment1N2House6
    "First validation exercise on N2 House using model6"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel6
                                                                                  N2House(
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1Old.txt",
      nomFichierBouVenIntGai=
          "D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1Old.txt",
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
    Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin[7]
      annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
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
    connect(TairC.T, residuals.u1) annotation (Line(
        points={{40,20},{50,20},{50,-14},{58,-14}},
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
    connect(add3_1.y, fromKelvin[7].Kelvin) annotation (Line(
        points={{-19,-90},{0,-90},{0,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[9], fromKelvin[6].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[8], fromKelvin[5].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[7], fromKelvin[4].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[12], fromKelvin[3].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[11], fromKelvin[2].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[10], fromKelvin[1].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(fromKelvin.Celsius, residuals.u2) annotation (Line(
        points={{41,-70},{50,-70},{50,-26},{58,-26}},
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

  model Experiment1N2LobbyNorthBedroom
    "First validation exercise on the model of a part of N2 Twin House (lobby and north bedroom)"
    extends Modelica.Icons.Example;
    Houses.N2House.N2LobbyNorthBedroomModel
      N2LobNorBed(
      kHea=1E6,
      kCoo=0,
      nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      nomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
      nomFichierBouOthRoo=
          "D:/Berkeley/Berkeley - IEA58/BouOthRooLobNorBedExp1.txt",
      nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      extWallSN=extWallSN,
      extWallE=extWallE,
      extDoorOpaquePart=extDoorOpaquePart,
      intDoorOpaquePart=intDoorOpaquePart,
      intWall1=intWall1,
      intWall2=intWall2,
      ceiling=ceiling,
      ground=ground,
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
      fileName="D:/Berkeley/Berkeley - IEA58/Twin_house_exp1_house_N2_60min_modified.txt")
      annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));

    Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TairC[2]
      "Air temperature in the different rooms in °C"
      annotation (Placement(transformation(extent={{20,30},{40,50}})));
    Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TradC[2]
      "Radiative temperature in the different rooms in °C"
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica.Blocks.Math.Add residuals[2](each k1=-1, each k2=+1)
      annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin[2]
      annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  public
    Houses.Data.OpaqueConstructions.Constructions.ExtWallSN
                                                     extWallSN
      annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
    Houses.Data.OpaqueConstructions.Constructions.ExtWallE
                                                    extWallE
      annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
    Houses.Data.OpaqueConstructions.Constructions.IntWall1
                                                    intWall1
      annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
    Houses.Data.OpaqueConstructions.Constructions.IntWall2
                                                    intWall2
      annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
    Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                   ceiling
      annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
    Houses.Data.OpaqueConstructions.Constructions.Ground
                                                  ground
      annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
    Houses.Data.OpaqueConstructions.Constructions.ExtDoorOpaquePart
                                                             extDoorOpaquePart
      annotation (Placement(transformation(extent={{20,-100},{40,-80}})));
    Houses.Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
                                                             intDoorOpaquePart
      annotation (Placement(transformation(extent={{40,-100},{60,-80}})));

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
        points={{40,40},{50,40},{50,6},{58,6}},
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
        points={{41,-50},{50,-50},{50,-6},{58,-6}},
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
  end Experiment1N2LobbyNorthBedroom;

  model Experiment1N2LobbyNorthBedroomTsurBou
    "Model to check that the model of a part of N2 Twin House (lobby and north bedroom) gives same results as model 6"
    extends Modelica.Icons.Example;
    Houses.N2House.N2LobbyNorthBedroomModelTsurBou
      N2LobNorBed(
      kHea=1E6,
      kCoo=0,
      nomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      nomFichierBouOthRoo="D:/Berkeley/Berkeley - IEA58/BouOthRooLobNorBedTestComputedTsurBouExp1.txt",
      nomFichierHeaCoo="D:/Berkeley/Berkeley - IEA58/N2HeaCooExp1.txt",
      nomFichierBouVenIntGai="D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
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

    Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TairC[2]
      "Air temperature in the different rooms in °C"
      annotation (Placement(transformation(extent={{20,10},{40,30}})));
    Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor TradC[2]
      "Radiative temperature in the different rooms in °C"
      annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
    Modelica.Blocks.Math.Add residuals[2](each k1=-1, each k2=+1)
      annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
    Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin[2]
      annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  equation
    connect(weaDat.weaBus, N2LobNorBed.weaBus) annotation (Line(
        points={{-30,70},{-2.22222,70},{-2.22222,37.7778}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    connect(N2LobNorBed.Tair, TairC.port) annotation (Line(
        points={{-2.22222,20},{20,20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(N2LobNorBed.Trad, TradC.port) annotation (Line(
        points={{-2.22222,-20},{20,-20}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(TairC.T, residuals.u1) annotation (Line(
        points={{40,20},{50,20},{50,-14},{58,-14}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[12], fromKelvin[2].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(measurements.y[11], fromKelvin[1].Kelvin) annotation (Line(
        points={{-59,-70},{18,-70}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(fromKelvin.Celsius, residuals.u2) annotation (Line(
        points={{41,-70},{50,-70},{50,-26},{58,-26}},
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
  end Experiment1N2LobbyNorthBedroomTsurBou;

  model Experiment1N2South
    "First validation exercise on the model of a part of N2 Twin House (bathroom, corridor, south bedroom, living room)"
    extends Modelica.Icons.Example;
    Houses.N2House.N2SouthModel N2SouPar(
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
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics),
      experiment(
        StartTime=2.00448e+007,
        StopTime=2.35836e+007,
        Interval=3600,
        Tolerance=1e-005,
        __Dymola_Algorithm="Radau"),
      __Dymola_experimentSetupOutput(events=false));
  end Experiment1N2South;

  model ZenExp1
    "Calculation of the zenith angle to calculate the direct normal radiation with an external file"
    extends Modelica.Icons.Example;

  protected
    Buildings.Utilities.Time.ModelTime modTim "Model time"
      annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.LocalCivilTime           locTim(final
        timZon=3600, final lon=0.20469221467389) "Local civil time"
      annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.EquationOfTime
                               eqnTim "Equation of time"
      annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.SolarTime
                          solTim "Solar time"
      annotation (Placement(transformation(extent={{-20,20},{0,40}})));
     Buildings.BoundaryConditions.SolarGeometry.BaseClasses.ZenithAngle
                                           zenAng(final lat=0.83301074539185)
      "Zenith angle"
      annotation (Placement(transformation(extent={{60,-10},{80,10}})));
     Buildings.BoundaryConditions.SolarGeometry.BaseClasses.Declination
                                           decAng "Declination angle"
      annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
     Buildings.BoundaryConditions.SolarGeometry.BaseClasses.SolarHourAngle
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
    extends Modelica.Icons.Example;

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
