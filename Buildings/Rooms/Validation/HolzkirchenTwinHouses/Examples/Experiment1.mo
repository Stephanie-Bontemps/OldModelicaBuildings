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
      NomFichierBouVenHeaCoo=
          "D:/Berkeley/Berkeley - IEA58/N2BouVenHeaCooExp1.txt",
      NomFichierBlinds="D:/Berkeley/Berkeley - IEA58/N2BliPosExp1.txt",
      lat(displayUnit="deg") = 0.83555892609977,
      redeclare package MediumA =
          Buildings.Media.GasesConstantDensity.MoistAirUnsaturated,
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
        points={{20,70},{38.75,70},{38.75,38.75}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics),
      experiment(
        StartTime=2.00448e+007,
        StopTime=2.35872e+007,
        Interval=3600,
        Tolerance=1e-005,
        __Dymola_Algorithm="Radau"),
      __Dymola_experimentSetupOutput);
  end Experiment1N2House;

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
