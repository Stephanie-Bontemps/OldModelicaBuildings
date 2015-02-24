within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model DirectNormalCalculation
  "Different methods compared to calculate the direct normal radiation from the global and diffuse horizontal radiations"

  constant Real epsCos = 1e-6 "Small value to avoid division by 0";
  constant Real epsH = 1e-06 "Small value of the radiation";
  constant Real limitAngle = 87*2*Modelica.Constants.pi/360;
  constant Real Hext = 1.4e3 "Maximal solar radiation on the earth";
  constant Real conv = 2*Modelica.Constants.pi/360
    "Conversion from degrees to radians";
  constant Real limAng = 89;
  Real Heaviside;
  Modelica.SIunits.Angle deltaAngle = 1*2*Modelica.Constants.pi/360;
//   Modelica.SIunits.Angle zenithRadian;
//   Real test;

  BoundaryConditions.WeatherData.BaseClasses.ConvertRadiation conGloHorRad
    annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
  BoundaryConditions.WeatherData.BaseClasses.ConvertRadiation conDifHorRad
    annotation (Placement(transformation(extent={{-30,-80},{-10,-60}})));
  Utilities.SimulationTime simTim "Simulation time"
    annotation (Placement(transformation(extent={{-160,-100},{-140,-80}})));
  Modelica.Blocks.Math.Add add
    "Add 30 minutes to time to shift weather data reader"
    annotation (Placement(transformation(extent={{-130,-60},{-110,-40}})));
  Modelica.Blocks.Sources.Constant con30mins(final k=1800)
    "Constant used to shift weather data reader"
    annotation (Placement(transformation(extent={{-160,-20},{-140,0}})));
  Modelica.Blocks.Tables.CombiTable1Ds datRea1(
    final tableOnFile=true,
    final tableName="tab1",
    final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    final columns={9,11},
    final fileName="C:/Users/bontemps/Documents/Dymola/modelica-buildings/Buildings/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos")
    "Data reader"
    annotation (Placement(transformation(extent={{-70,-60},{-50,-40}})));
  BoundaryConditions.WeatherData.BaseClasses.ConvertTime conTim1
    "Convert simulation time to calendar time"
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor2
    "Based calculation in ReaderTMY3"
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor3
    "Splice Function and Smooth Function"
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor4
    "Smooth Functions and Heaviside"
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor5
    "Smooth Direct Normal Radiation"
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor6
    "Smooth Direct Normal Radiation"
    annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor7
    "Smooth Direct Normal Radiation"
    annotation (Placement(transformation(extent={{60,-140},{80,-120}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor8
    "Smooth Direct Normal Radiation"
    annotation (Placement(transformation(extent={{60,-180},{80,-160}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor9
    "Smooth Direct Normal Radiation"
    annotation (Placement(transformation(extent={{60,-220},{80,-200}})));
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
    annotation (Placement(transformation(extent={{-140,140},{-120,160}})));
  BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-100,120},{-60,160}}),
                                                     iconTransformation(extent={
            {-308,70},{-288,90}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheGloHorRad
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDifHorRad
    annotation (Placement(transformation(extent={{0,-80},{20,-60}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad2
    annotation (Placement(transformation(extent={{100,60},{120,80}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad3
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad4
    annotation (Placement(transformation(extent={{100,-20},{120,0}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad5
    annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad6
    annotation (Placement(transformation(extent={{100,-100},{120,-80}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad7
    annotation (Placement(transformation(extent={{100,-140},{120,-120}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad8
    annotation (Placement(transformation(extent={{100,-180},{120,-160}})));
  BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad9
    annotation (Placement(transformation(extent={{100,-220},{120,-200}})));
  Modelica.Blocks.Interfaces.RealOutput HDirNor1 "From weather file"
    annotation (Placement(transformation(extent={{-20,120},{0,140}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad1(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{20,120},{40,140}})));
Modelica.Blocks.Continuous.Integrator EDirNorRad2(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,60},{160,80}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad3(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,20},{160,40}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad4(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,-20},{160,0}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad5(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad6(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,-100},{160,-80}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad7(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,-140},{160,-120}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad8(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,-180},{160,-160}})));
  Modelica.Blocks.Continuous.Integrator EDirNorRad9(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W/m2"),
    y(unit="J/m2"))
    annotation (Placement(transformation(extent={{140,-220},{160,-200}})));
  Modelica.Blocks.Interfaces.RealOutput zenAng
    annotation (Placement(transformation(extent={{-20,130},{20,170}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=limAng*
        conv)
    annotation (Placement(transformation(extent={{60,140},{80,160}})));
  Modelica.Blocks.Logical.Switch zenAngOpt
    annotation (Placement(transformation(extent={{120,120},{140,140}})));
  Modelica.Blocks.Sources.Constant const(k=limAng*conv)
    annotation (Placement(transformation(extent={{80,160},{100,180}})));

  BoundaryConditions.WeatherData.Bus weaBus1 annotation (Placement(
        transformation(extent={{-90,-190},{-50,-150}}), iconTransformation(
          extent={{-292,20},{-272,40}})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat1(
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
    filNam=
        "D:/Berkeley Lab/Berkeley IEA58/Weather reader model/USA_CA_San.FranciscoModified.Intl.AP.724940_TMY3.mos")
    "Direct normal radiation from file"
    annotation (Placement(transformation(extent={{-140,-180},{-120,-160}})));
equation
  HDirNor2 = (cheGloHorRad.HOut -cheDifHorRad.HOut)/Buildings.Utilities.Math.Functions.smoothMax(x1=cos(zenAng), x2=epsCos, deltaX=0.1*epsCos);
  HDirNor3 = Buildings.Utilities.Math.Functions.spliceFunction(pos=HDirNor2, neg=epsH, x=cos(zenAng)-epsCos, deltax=0.1*epsCos);
  HDirNor4 = Buildings.Utilities.Math.Functions.smoothMin(x1=HDirNor2, x2=Hext*Buildings.Utilities.Math.Functions.smoothHeaviside(x=zenAng, delta=limitAngle), deltaX=0.1*epsH);
  HDirNor5 = Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses.smoothDirectNormalRadiation(zen=zenAng, lim=87, x1=HDirNor2, x2=epsH);
  HDirNor6 = Buildings.Utilities.Math.Functions.smoothMin(x1=HDirNor2, x2=Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses.smoothDirectNormalRadiation(zen=zenAng, lim=87,x1=Hext, x2=epsH), deltaX=0.1*epsH);
  HDirNor7 = (cheGloHorRad.HOut - cheDifHorRad.HOut)/cos(zenAngOpt.y);
  Heaviside = Buildings.Utilities.Math.Functions.spliceFunction(0, 1, (zenAng-limAng*conv),  deltaAngle);
  HDirNor9 = HDirNor7*Heaviside;
  connect(add.y,conTim1.simTim) annotation (Line(
      points={{-109,-50},{-102,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conTim1.calTim,datRea1.u) annotation (Line(
      points={{-79,-50},{-72,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(con30mins.y,add.u1) annotation (Line(
      points={{-139,-10},{-136,-10},{-136,-44},{-132,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(simTim.y,add.u2) annotation (Line(
      points={{-139,-90},{-136,-90},{-136,-56},{-132,-56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(datRea1.y[1],conGloHorRad.HIn) annotation (Line(
      points={{-49,-50.5},{-40,-50.5},{-40,-30},{-32,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(datRea1.y[2],conDifHorRad.HIn) annotation (Line(
      points={{-49,-49.5},{-40,-49.5},{-40,-70},{-32,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conGloHorRad.HOut, cheGloHorRad.HIn) annotation (Line(
      points={{-9,-30},{-2,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conDifHorRad.HOut, cheDifHorRad.HIn) annotation (Line(
      points={{-9,-70},{-2,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad2.HIn, HDirNor2) annotation (Line(
      points={{98,70},{70,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad3.HIn, HDirNor3) annotation (Line(
      points={{98,30},{70,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad4.HIn, HDirNor4) annotation (Line(
      points={{98,-10},{70,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad5.HIn, HDirNor5) annotation (Line(
      points={{98,-50},{70,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad6.HIn, HDirNor6) annotation (Line(
      points={{98,-90},{70,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad2.HOut, EDirNorRad2.u) annotation (Line(
      points={{121,70},{138,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad3.HOut, EDirNorRad3.u) annotation (Line(
      points={{121,30},{138,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad4.HOut, EDirNorRad4.u) annotation (Line(
      points={{121,-10},{138,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad5.HOut, EDirNorRad5.u) annotation (Line(
      points={{121,-50},{138,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad6.HOut, EDirNorRad6.u) annotation (Line(
      points={{121,-90},{138,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-120,150},{-102,150},{-102,140},{-80,140}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(weaBus.HDirNor, HDirNor1) annotation (Line(
      points={{-80,140},{-48,140},{-48,130},{-10,130}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus.solZen, zenAng) annotation (Line(
      points={{-80,140},{-48,140},{-48,150},{0,150}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(EDirNorRad1.u, HDirNor1) annotation (Line(
      points={{18,130},{-10,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(greaterThreshold.y, zenAngOpt.u2) annotation (Line(
      points={{81,150},{90,150},{90,130},{118,130}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(zenAng, greaterThreshold.u) annotation (Line(
      points={{0,150},{58,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(zenAng, zenAngOpt.u3) annotation (Line(
      points={{0,150},{50,150},{50,122},{118,122}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, zenAngOpt.u1) annotation (Line(
      points={{101,170},{108,170},{108,138},{118,138}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad7.HIn,HDirNor7)  annotation (Line(
      points={{98,-130},{70,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad7.HOut,EDirNorRad7. u) annotation (Line(
      points={{121,-130},{138,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad8.HIn,HDirNor8)  annotation (Line(
      points={{98,-170},{70,-170}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad8.HOut,EDirNorRad8. u) annotation (Line(
      points={{121,-170},{138,-170}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weaBus1.HDirNor, HDirNor8) annotation (Line(
      points={{-70,-170},{70,-170}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaDat1.weaBus, weaBus1) annotation (Line(
      points={{-120,-170},{-70,-170}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(cheDirNorRad9.HIn,HDirNor9)  annotation (Line(
      points={{98,-210},{70,-210}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cheDirNorRad9.HOut,EDirNorRad9. u) annotation (Line(
      points={{121,-210},{138,-210}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -240},{180,180}}), graphics),
    experiment(StopTime=3.15324e+007, Interval=600),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-180,-240},{180,180}})));
end DirectNormalCalculation;
