within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model TestReaderWeatherFile
  ReaderWeatherFile weaDat(
    filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherExp1.txt",
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    lon=0.20469221467389,
    lat=0.83555892609977,
    timZon=3600)
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));

  ReaderWeatherFile2 weaDat1(
    filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherExp1.txt",
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    lon=0.20469221467389,
    lat=0.83555892609977,
    timZon=3600)
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));

  annotation (experiment(StopTime=3.5424e+006, Interval=3600),
      __Dymola_experimentSetupOutput);
end TestReaderWeatherFile;
