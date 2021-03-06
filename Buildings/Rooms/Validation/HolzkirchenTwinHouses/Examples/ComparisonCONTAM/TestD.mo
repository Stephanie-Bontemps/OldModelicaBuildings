within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples.ComparisonCONTAM;
model TestD "Test D carried on Dymola and CONTAM"
  extends Modelica.Icons.Example;
  Obsolete.N2HouseModel1 N2House(
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
    NomFichierBouVenHeaCoo=
        "D:/Berkeley/Berkeley - IEA58/N2BouVenHeaCooTestADE.txt",
    redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
    Tini_int=303.15,
    Tini_ext=303.15,
    Tini_bou=303.15)
    annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    pAtmSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    ceiHeiSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    totSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    opaSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    TDryBulSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    HSou=Buildings.BoundaryConditions.Types.RadiationDataSource.File,
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    HInfHorSou=Buildings.BoundaryConditions.Types.DataSource.File,
    pAtm(displayUnit="Pa") = 93418.4,
    relHumSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    relHum=0,
    winSpeSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    winDirSou=Buildings.BoundaryConditions.Types.DataSource.Parameter,
    filNam="D:/Berkeley/Berkeley - IEA58/Holzkirchen_TestADE_TMY3.mos",
    winSpe=10,
    winDir=0.017453292519943)
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
      StopTime=2.06496e+007,
      Interval=3600,
      Tolerance=1e-005,
      __Dymola_Algorithm="Radau"),
    __Dymola_experimentSetupOutput(events=false));
end TestD;
