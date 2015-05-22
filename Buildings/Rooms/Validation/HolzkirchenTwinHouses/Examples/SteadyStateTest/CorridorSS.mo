within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples.SteadyStateTest;
model CorridorSS
  "Model of the corridor in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
  extends Modelica.Icons.Example;

  Houses.Rooms.Corridor corridor(
    redeclare package Medium = Buildings.Media.IdealGases.SimpleAir,
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

  Houses.BaseClasses.MultiThermalBridge mulTherBri(
    gKit=4.860,
    gLob=4.130,
    gCor=2.469,
    gBat=3.313,
    gLivRoo=10.579,
    gNorBed=5.976,
    gSouBed=5.752)
    annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
  Houses.BaseClasses.InternalGains intGaiLob(
    kRadGai=0,
    kConGai=0,
    kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

  Houses.BaseClasses.ReaderWeatherFile2 weaDat(
    filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
    TDewPoi=293.15,
    lon=0.20469221467389,
    lat=0.83555892609977,
    timZon=3600)
    annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Houses.BaseClasses.MultiHeatingCoolingSchedule
                                            heaCooSch(        kCoo=0,
    kHea=1e6,
    nRoo=1)
    annotation (Placement(transformation(extent={{-120,-56},{-84,-20}})));
equation
  connect(mulTherBri.port_b[4],corridor. heaPorAir) annotation (Line(
      points={{-120,-90},{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(intGaiLob.y,corridor. qGai_flow) annotation (Line(
      points={{101,30},{110,30},{110,-6},{119,-6}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(weaDat.weaBus,corridor. weaBus) annotation (Line(
      points={{100,70},{138.95,70},{138.95,-1.05}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaDat.weaBus, mulTherBri.weaBus) annotation (Line(
      points={{100,70},{140,70},{140,120},{-180,120},{-180,-90},{-139,-90}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(heaCooSch.port_bCon,corridor. heaPorAir) annotation (Line(
      points={{-84,-34.1429},{94,-34.1429},{94,-10},{129.5,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCooSch.port_bRad,corridor. heaPorRad) annotation (Line(
      points={{-84,-41.8571},{96,-41.8571},{96,-11.9},{129.5,-11.9}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[11], heaCooSch.heaCooFlo) annotation (Line(
      points={{-139,90},{-132,90},{-132,-29},{-122.571,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[18], heaCooSch.TSetHea) annotation (Line(
      points={{-139,90},{-132,90},{-132,-45.7143},{-122.571,-45.7143}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[25], heaCooSch.TSetCoo) annotation (Line(
      points={{-139,90},{-132,90},{-132,-53.4286},{-122.571,-53.4286}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[30], heaCooSch.schChoice) annotation (Line(
      points={{-139,90},{-132,90},{-132,-38},{-122.571,-38}},
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

  connect(port_a[17], corridor.surf_conBou[1]) annotation (Line(
      points={{-70,91},{-40,91},{-40,-80},{133,-80},{133,-18.4167}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[17], corridor.surf_conBou[2]) annotation (Line(
      points={{-70,91},{-40,91},{-40,-80},{133,-80},{133,-18.25}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[19], corridor.surf_conBou[3]) annotation (Line(
      points={{-70,92.3333},{-40,92.3333},{-40,-80},{133,-80},{133,-18.0833}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[19], corridor.surf_conBou[4]) annotation (Line(
      points={{-70,92.3333},{-40,92.3333},{-40,-80},{133,-80},{133,-17.9167}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[1], corridor.surf_conBou[5]) annotation (Line(
      points={{-70,80.3333},{-40,80.3333},{-40,-80},{133,-80},{133,-17.75}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], corridor.surf_conBou[6]) annotation (Line(
      points={{-70,81.6667},{-40,81.6667},{-40,-80},{133,-80},{133,-17.5833}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[20], corridor.surf_surBou[1]) annotation (Line(
      points={{-70,93},{-20,93},{-20,-60},{128.1,-60},{128.1,-17.375}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[20], corridor.surf_surBou[2]) annotation (Line(
      points={{-70,93},{-20,93},{-20,-60},{128.1,-60},{128.1,-17.125}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[21], corridor.surf_surBou[3]) annotation (Line(
      points={{-70,93.6667},{-20,93.6667},{-20,-60},{128.1,-60},{128.1,-16.875}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(port_a[21], corridor.surf_surBou[4]) annotation (Line(
      points={{-70,93.6667},{-20,93.6667},{-20,-60},{128.1,-60},{128.1,-16.625}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(heaCooSch.port_aTSet[1], corridor.heaPorAir) annotation (Line(
      points={{-120,-49.5714},{-10,-49.5714},{-10,-50},{100,-50},{100,-10},{
          129.5,-10}},
      color={191,0,0},
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
end CorridorSS;
