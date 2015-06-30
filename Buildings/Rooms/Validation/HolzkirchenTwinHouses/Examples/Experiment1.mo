within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples;
package Experiment1
  "First validation exercise on the models of the Holzkirchen twin houses"
  extends Modelica.Icons.ExamplesPackage;

  model Experiment1N2House "First validation exercise on N2 House"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel
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
      nomFichierBouVenIntGai=
          "D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
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
    Modelica.Thermal.HeatTransfer.Celsius.FromKelvin fromKelvin[7]
      annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
    Modelica.Blocks.Interfaces.RealOutput P[7] "Total power in each room"
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
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
    connect(measurements.y[5], fromKelvin[7].Kelvin)
      annotation (Line(points={{-59,-70},{-20,-70},{18,-70}}, color={0,0,127}));
    connect(fromKelvin.Celsius, residuals.u2) annotation (Line(
        points={{41,-70},{50,-70},{50,-26},{58,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(N2House.P, P) annotation (Line(points={{1.11111,0},{1.11111,0},{110,
            0}},
          color={0,0,127}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
    Documentation(
    info="<html>
  <p>
  This example uses <a href=\"Buildings.Rooms.Validation.HlozkirchenTwinHouses.Houses.N2House.N2HouseModel\">
  Buildings.Rooms.Validation.HlozkirchenTwinHouses.Houses..N2House.N2HouseModel</a>. 
  <br>
  The different values of the parameters describing the house have to be given, just as the files with the boundary conditions, the weather data and the measurements.
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
  March 24 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"),
      experiment(
        StartTime=2.00448e+007,
        StopTime=2.35836e+007,
        Interval=3600,
        Tolerance=1e-005,
        __Dymola_Algorithm="Cvode"),
      __Dymola_experimentSetupOutput(events=false));
  end Experiment1N2House;

  model Experiment1N2LobbyNorthBedroom
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
            {110,20}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),
    Documentation(
    info="<html>
  <p>
  This example uses <a href=\"Buildings.Rooms.Validation.HlozkirchenTwinHouses.Houses.N2House.N2LobbyNorthBedroomModel\">
  Buildings.Rooms.Validation.HlozkirchenTwinHouses.Houses..N2House.N2LobbyNorthBedroomModel</a>. 
  <br>
  The different values of the parameters describing the part of the house have to be given, just as the files with the boundary conditions, the weather data and the measurements.
  <br>
  The residuals on the air temperature are computed as the difference between the measured air temperature and the simulated one. 
  <br>
  The total power in each room is also extracted from the model.
  </p>
  <p></p>
  </html>",
    revisions="<html>
  <ul>
  <li>
  May 21 2015, by Stephanie Bontemps:<br/>
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
      __Dymola_experimentSetupOutput(events=false));
  end Experiment1N2LobbyNorthBedroom;

  model Experiment1N2South
    "First validation exercise on the model of a part of N2 Twin House (corridor, bathroom, south bedroom, living room)"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2SouthModel
                                                                                 N2SouPar(
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
    connect(N2SouPar.P, P) annotation (Line(points={{1.53846,0},{1.53846,0},{
            110,0}},
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
      __Dymola_experimentSetupOutput(events=false));
  end Experiment1N2South;

  model ZenExp1 "Calculation of the zenith angle"
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
    Documentation(
    info="<html>
  <p>
  This example is used to compute the zenith angle in order to compute the direct normal radiation in an external file. 
  </p>
  <p>
  It uses different components included in <a href=\"Buildings.BoundaryConditions.WeatherData.ReaderTMY3\">Buildings.BoundaryConditions.WeatherData.ReaderTMY3</a>. 
  </p>
  <p></p>
  </html>",
    revisions="<html>
  <ul>
  <li>
  February 23 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"),
      experiment(
        StartTime=2.00448e+007,
        StopTime=2.35872e+007,
        Interval=1800),
      __Dymola_experimentSetupOutput);
  end ZenExp1;

end Experiment1;
