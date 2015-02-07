within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model ComparisonReaderTMY3
  "Comparison of two readers of weather file with direct normal radiation from file and calculated from global horizontal and diffuse horizontal radiations"

  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    pAtmSou=Buildings.BoundaryConditions.Types.DataSource.File,
    ceiHeiSou=Buildings.BoundaryConditions.Types.DataSource.File,
    totSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.File,
    opaSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDryBulSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=Buildings.BoundaryConditions.Types.DataSource.File,
    relHumSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winSpeSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winDirSou=Buildings.BoundaryConditions.Types.DataSource.File,
    HInfHorSou=Buildings.BoundaryConditions.Types.DataSource.File,
    HSou=Buildings.BoundaryConditions.Types.RadiationDataSource.File,
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    filNam="C:/Users/bontemps/Documents/Dymola/modelica-buildings/Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    "Direct normal radiation from file"
    annotation (Placement(transformation(extent={{80,40},{100,60}})));

  ReaderTMY3bis weaDat1(
    pAtmSou=Buildings.BoundaryConditions.Types.DataSource.File,
    ceiHeiSou=Buildings.BoundaryConditions.Types.DataSource.File,
    totSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.File,
    opaSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDryBulSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=Buildings.BoundaryConditions.Types.DataSource.File,
    relHumSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winSpeSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winDirSou=Buildings.BoundaryConditions.Types.DataSource.File,
    HInfHorSou=Buildings.BoundaryConditions.Types.DataSource.File,
    HSou=Buildings.BoundaryConditions.Types.RadiationDataSource.Input_HGloHor_HDifHor,
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    filNam="C:/Users/bontemps/Documents/Dymola/modelica-buildings/Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    "New calculation of the direct normal radiation"
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));

  BoundaryConditions.WeatherData.ReaderTMY3 weaDat2(
    pAtmSou=Buildings.BoundaryConditions.Types.DataSource.File,
    ceiHeiSou=Buildings.BoundaryConditions.Types.DataSource.File,
    totSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.File,
    opaSkyCovSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDryBulSou=Buildings.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=Buildings.BoundaryConditions.Types.DataSource.File,
    relHumSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winSpeSou=Buildings.BoundaryConditions.Types.DataSource.File,
    winDirSou=Buildings.BoundaryConditions.Types.DataSource.File,
    HInfHorSou=Buildings.BoundaryConditions.Types.DataSource.File,
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    HSou=Buildings.BoundaryConditions.Types.RadiationDataSource.Input_HGloHor_HDifHor,
    filNam="C:/Users/bontemps/Documents/Dymola/modelica-buildings/Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    "Direct normal radiation calculated with base model"
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));

protected
  BoundaryConditions.WeatherData.BaseClasses.ConvertRadiation
                               conGloHorRad
    annotation (Placement(transformation(extent={{30,-20},{50,0}})));
  BoundaryConditions.WeatherData.BaseClasses.ConvertRadiation conDifHorRad
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
  Utilities.SimulationTime simTim "Simulation time"
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
  Modelica.Blocks.Math.Add add
    "Add 30 minutes to time to shift weather data reader"
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
  Modelica.Blocks.Sources.Constant con30mins(final k=1800)
    "Constant used to shift weather data reader"
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Blocks.Tables.CombiTable1Ds datRea1(
    final tableOnFile=true,
    final tableName="tab1",
    final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    final columns={9,11},
    final fileName="C:/Users/bontemps/Documents/Dymola/modelica-buildings/Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    "Data reader"
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  BoundaryConditions.WeatherData.BaseClasses.ConvertTime           conTim1
    "Convert simulation time to calendar time"
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
equation
  connect(conGloHorRad.HOut, weaDat1.HGloHor_in) annotation (Line(
      points={{51,-10},{70,-10},{70,-8.6},{79,-8.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conGloHorRad.HOut, weaDat2.HGloHor_in) annotation (Line(
      points={{51,-10},{70,-10},{70,-58.6},{79,-58.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conDifHorRad.HOut, weaDat1.HDifHor_in) annotation (Line(
      points={{51,-50},{60,-50},{60,-7.6},{79,-7.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conDifHorRad.HOut, weaDat2.HDifHor_in) annotation (Line(
      points={{51,-50},{60,-50},{60,-57.6},{79,-57.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y,conTim1. simTim) annotation (Line(
      points={{-49,-30},{-42,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conTim1.calTim,datRea1. u) annotation (Line(
      points={{-19,-30},{-12,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(con30mins.y, add.u1) annotation (Line(
      points={{-79,10},{-76,10},{-76,-24},{-72,-24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simTim.y, add.u2) annotation (Line(
      points={{-79,-70},{-76,-70},{-76,-36},{-72,-36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(datRea1.y[1], conGloHorRad.HIn) annotation (Line(
      points={{11,-30.5},{20,-30.5},{20,-10},{28,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(datRea1.y[2], conDifHorRad.HIn) annotation (Line(
      points={{11,-29.5},{20,-29.5},{20,-50},{28,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics),
    experiment(StopTime=8.64e+006),
    __Dymola_experimentSetupOutput);
end ComparisonReaderTMY3;
