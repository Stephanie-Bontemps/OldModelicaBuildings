within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples;
model KitchenSS
  "Model of the kitchen in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
  extends Modelica.Icons.Example;

  Houses.Rooms.Kitchen kitchen(
    redeclare package Medium = Buildings.Media.IdealGases.SimpleAir,
    nPorts=1,
    Tini_int=273.15,
    Tini_ext=293.15,
    Tini_bou=293.15)
    annotation (Placement(transformation(extent={{120,-20},{140,0}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature    TairBou[30]
    "Warning : contain all the data in the boundary conditions file, including the ventilation flow rates, heating powers... "
    annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a[30]
    "Warning : contain all the data in the boundary conditions file, including the ventilation flow rates, heating powers... "
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));

  Modelica.Blocks.Sources.CombiTimeTable bouVenHeaCoo(
    final tableOnFile=true,
    final tableName="BouVenHeaCoo",
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints,
    columns=2:31,
    final fileName="D:/Berkeley Lab/Berkeley IEA58/N2BouVenHeaCooSSbyRoom.txt")
    "Boundary conditions for ceiling (1 for East, 2 for West) and floor (3); ventilation supply flow rate (6) and its temperature (4); ventilation extraction flow rate (7) and its temperature (5); heating or cooling power for the different rooms (8: kitchen, 9: lobby, 10: North bedroom, 11: corridor, 12: bathroom, 13: South bedroom, 14: living room); heating temperature set point for the different rooms (15: kitchen, 16: lobby, 17: North bedroom, 18: corridor, 19: bathroom, 20: South bedroom, 21: living room); cooling temperature set point for the different rooms (22: kitchen, 23: lobby, 24: North bedroom, 25: corridor, 26: bathroom, 27: South bedroom, 28: living room); internal gains in the kitchen (29)"
    annotation (Placement(transformation(extent={{-160,80},{-140,100}})));

  BaseClasses.MultiThermalBridge  mulTherBri(
    gKit=4.860,
    gLob=4.130,
    gCor=2.469,
    gBat=3.313,
    gLivRoo=10.579,
    gNorBed=5.976,
    gSouBed=5.752)
    annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
  BaseClasses.MultiEffectiveAirLeakageArea MulAirLea(
    LBat=1.71e-04,
    LKit=1.71e-04,
    LLob=1.86e-04,
    LNorBed=1.71e-04,
    LSouBed=1.71e-04,
    LLivRoo1=6.10e-04,
    LLivRoo2=1.71e-04,
    sNor=1,
    sEas=1,
    sSou=1,
    sWes=1,
    redeclare package MediumB = Buildings.Media.IdealGases.SimpleAir)
    annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
  BaseClasses.InternalGains intGaiLob(
    kRadGai=0,
    kConGai=0,
    kLatGai=0)
    annotation (Placement(transformation(extent={{80,20},{100,40}})));

  BaseClasses.ReaderWeatherFile2 weaDat(
    filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
    TDewPoi=293.15,
    lon=0.20469221467389,
    lat=0.83555892609977,
    timZon=3600)
    annotation (Placement(transformation(extent={{80,60},{100,80}})));
  BaseClasses.HeatingCoolingSchedule heaCooSch(kHea=0, kCoo=0)
    annotation (Placement(transformation(extent={{-120,-56},{-84,-20}})));
  Modelica.Blocks.Sources.CombiTimeTable bliPos(
    final tableOnFile=true,
    final tableName="BliPos",
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints,
    columns=2:8,
    final fileName="D:/Berkeley Lab/Berkeley IEA58/N2BliPosExp1.txt")
    "Scenario of the blinds position applied on the South windows"
    annotation (Placement(transformation(extent={{-160,40},{-140,60}})));
equation
  connect(mulTherBri.port_b[1], kitchen.heaPorAir) annotation (Line(
      points={{-120,-90.8571},{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(kitchen.ports[1], MulAirLea.ports_b[1]) annotation (Line(
      points={{122.5,-15},{80,-15},{80,-132},{-102,-132},{-102,-133.429},{-121,
          -133.429}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(intGaiLob.y, kitchen.qGai_flow) annotation (Line(
      points={{101,30},{110,30},{110,-6},{119,-6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(weaDat.weaBus, kitchen.weaBus) annotation (Line(
      points={{100,70},{138.95,70},{138.95,-1.05}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaDat.weaBus, mulTherBri.weaBus) annotation (Line(
      points={{100,70},{140,70},{140,120},{-180,120},{-180,-90},{-139,-90}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaDat.weaBus, MulAirLea.weaBus) annotation (Line(
      points={{100,70},{140,70},{140,120},{-180,120},{-180,-130},{-139,-130}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(heaCooSch.port_bCon, kitchen.heaPorAir) annotation (Line(
      points={{-84,-33},{94,-33},{94,-10},{129.5,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCooSch.port_bTSet, kitchen.heaPorAir) annotation (Line(
      points={{-84,-38},{96,-38},{96,-10},{129.5,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCooSch.port_bRad, kitchen.heaPorRad) annotation (Line(
      points={{-84,-43},{96,-43},{96,-11.9},{129.5,-11.9}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[8], heaCooSch.heaCooFlo) annotation (Line(
      points={{-139,90},{-132,90},{-132,-28},{-122,-28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[15], heaCooSch.TSetHea) annotation (Line(
      points={{-139,90},{-132,90},{-132,-44},{-122,-44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[22], heaCooSch.TSetCoo) annotation (Line(
      points={{-139,90},{-132,90},{-132,-50},{-122,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[30], heaCooSch.schChoice) annotation (Line(
      points={{-139,90},{-132,90},{-132,-38},{-122,-38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y, TairBou.T) annotation (Line(
      points={{-139,90},{-122,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TairBou.port, port_a) annotation (Line(
      points={{-100,90},{-70,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[16], kitchen.surf_conBou[1]) annotation (Line(
      points={{-70,90.3333},{-40,90.3333},{-40,-80},{133,-80},{133,-18.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[2], kitchen.surf_conBou[2]) annotation (Line(
      points={{-70,81},{-40,81},{-40,-80},{133,-80},{133,-18}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], kitchen.surf_conBou[3]) annotation (Line(
      points={{-70,81.6667},{-40,81.6667},{-40,-80},{133,-80},{133,-17.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[21], kitchen.surf_surBou[1]) annotation (Line(
      points={{-70,93.6667},{-20,93.6667},{-20,-60},{128.1,-60},{128.1,-17.25}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(port_a[21], kitchen.surf_surBou[2]) annotation (Line(
      points={{-70,93.6667},{-20,93.6667},{-20,-60},{128.1,-60},{128.1,-16.75}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(bliPos.y[1], kitchen.uSha[1]) annotation (Line(
      points={{-139,50},{-10,50},{-10,-2},{119,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -180},{180,180}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-180,-180},{180,180}}), graphics={Text(
          extent={{-198,398},{194,342}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),  defaultComponentName="N2House",
    experiment(StopTime=3.5424e+006, Interval=3600),
    __Dymola_experimentSetupOutput);
end KitchenSS;
