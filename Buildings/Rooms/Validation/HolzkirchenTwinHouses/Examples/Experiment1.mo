within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples;
package Experiment1
  "First validation exercise on the models of the Holzkirchen twin houses"
  extends Modelica.Icons.ExamplesPackage;
  model Experiment1N2House "First validation exercise on N2 House"
    extends Modelica.Icons.Example;
    Houses.N2HouseModel N2House(
      NomFichierBlinds="D:/Berkeley Lab/Berkeley IEA58/N2BliPosExp1.txt",
      NomFichierBouVenHeaCoo=
          "D:/Berkeley Lab/Berkeley IEA58/N2BouVenHeaCooExp1.txt",
      kHea=1E6,
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      redeclare package MediumA = Buildings.Media.IdealGases.SimpleAir,
      Tini_int=303.15,
      Tini_ext=283.15,
      Tini_bou=303.15)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    Houses.BaseClasses.ReaderWeatherFile2 weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherExp1.txt",
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600,
      calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation)
      annotation (Placement(transformation(extent={{0,60},{20,80}})));
  equation
    connect(weaDat.weaBus, N2House.weaBus) annotation (Line(
        points={{20,70},{38.75,70},{38.75,38.75}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}), graphics),
      experiment(StopTime=3.5424e+006, Interval=3600),
      __Dymola_experimentSetupOutput);
  end Experiment1N2House;
end Experiment1;
