within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete.SteadyStateTestBeta;
model N2HouseSS "Test of the model of the N2 House in Steaty State"
  extends Modelica.Icons.Example;
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete.N2HouseModel1
    N2House(
    NomFichierBlinds="D:/Berkeley Lab/Berkeley IEA58/N2BliPosExp1.txt",
    kCoo=0,
    kDooOpeKitLiv=0,
    kDooOpeLobLiv=0,
    kDooOpeNthBedCor=0,
    kDooOpeBatCor=1,
    kDooOpeSthBedCor=1,
    kDooOpeCorLiv=1,
    NomFichierBouVenHeaCoo=
        "D:/Berkeley Lab/Berkeley IEA58/N2BouVenHeaCooSS.txt",
    kHea=0,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
    Tini_int=273.15,
    Tini_ext=293.15,
    Tini_bou=293.15)
    annotation (Placement(transformation(extent={{-40,-40},{40,40}})));

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete.ReaderWeatherFile2
    weaDat(
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
    lon=0.20469221467389,
    lat=0.83555892609977,
    timZon=3600)
    annotation (Placement(transformation(extent={{0,60},{20,80}})));

equation
  connect(weaDat.weaBus, N2House.weaBus) annotation (Line(
      points={{20,70},{32.2222,70},{32.2222,34.4444}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics),
    experiment(StopTime=3.5424e+006, Interval=3600),
    __Dymola_experimentSetupOutput);
end N2HouseSS;
