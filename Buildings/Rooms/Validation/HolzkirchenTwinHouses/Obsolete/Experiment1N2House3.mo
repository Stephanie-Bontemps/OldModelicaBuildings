within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete;
model Experiment1N2House3 "First validation exercise on N2 House using model3"
  extends Modelica.Icons.Example;
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete.N2HouseModel3
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
    nomFichierBouVenIntGai=
        "D:/Berkeley/Berkeley - IEA58/N2BouVenRhoIntGaiExp1.txt",
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
