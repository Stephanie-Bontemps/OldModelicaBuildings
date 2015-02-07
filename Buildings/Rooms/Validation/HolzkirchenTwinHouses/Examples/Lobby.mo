within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples;
model Lobby
  "Model of the lobby in the N2 Twin House to resolve the probelm when included in the global model"
  extends Modelica.Icons.Example;

  Houses.Rooms.Lobby lobby(
    redeclare package Medium = Buildings.Media.IdealGases.SimpleAir,
    nPorts=1,
    ExtWallNorthLgth=1.25,
    ExtDoorNorthLgth=1.00,
    IntWallOnNBedroomLgth=2.61,
    IntWallOnLivRoomLgth=1.315,
    DoorOnLivRoomLgth=0.935,
    IntWallOnKitchenLgth=2.61)
    annotation (Placement(transformation(extent={{120,-18},{140,2}})));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature TairBou[2]
    annotation (Placement(transformation(extent={{-82,82},{-62,102}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a[2]
    annotation (Placement(transformation(extent={{-34,82},{-14,102}})));

  Modelica.Blocks.Sources.CombiTimeTable bouVenHeaCoo(
    final tableOnFile=true,
    final tableName="BouVenHeaCoo",
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints,
    columns=2:31,
    final fileName="D:/Berkeley Lab/Berkeley IEA58/N2BouVenHeaCooExp1.txt")
    "Boundary conditions for ceiling (1 for East, 2 for West) and floor (3); ventilation supply flow rate (6) and its temperature (4); ventilation extraction flow rate (7) and its temperature (5); heating or cooling power for the different rooms (8: kitchen, 9: lobby, 10: North bedroom, 11: corridor, 12: bathroom, 13: South bedroom, 14: living room); heating temperature set point for the different rooms (15: kitchen, 16: lobby, 17: North bedroom, 18: corridor, 19: bathroom, 20: South bedroom, 21: living room); cooling temperature set point for the different rooms (22: kitchen, 23: lobby, 24: North bedroom, 25: corridor, 26: bathroom, 27: South bedroom, 28: living room); internal gains in the kitchen (29)"
    annotation (Placement(transformation(extent={{-160,82},{-140,102}})));

  BaseClasses.MultiThermalBridge  mulTherBri(
    gKit=4.860,
    gLob=4.130,
    gCor=2.469,
    gBat=3.313,
    gLivRoo=10.579,
    gNorBed=5.976,
    gSouBed=5.752)
    annotation (Placement(transformation(extent={{-140,-98},{-120,-78}})));
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
    annotation (Placement(transformation(extent={{-140,-138},{-120,-118}})));
  BaseClasses.InternalGains intGaiLob(
    kRadGai=0,
    kConGai=0,
    kLatGai=0)
    annotation (Placement(transformation(extent={{80,22},{100,42}})));

  BaseClasses.ReaderWeatherFile2 weaDat(
    filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherExp1.txt",
    calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    lon=0.20469221467389,
    lat=0.83555892609977,
    timZon=3600)
    annotation (Placement(transformation(extent={{80,62},{100,82}})));
  BaseClasses.HeatingCoolingSchedule heaCooSch
    annotation (Placement(transformation(extent={{-120,-54},{-84,-18}})));
equation
  connect(mulTherBri.port_b[2], lobby.heaPorAir) annotation (Line(
      points={{-120,-88.5714},{-120,-88},{-60,-88},{-60,-8},{129.5,-8}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(port_a[2], lobby.surf_conBou[3]) annotation (Line(
      points={{-24,97},{-22,97},{-22,-38},{134,-38},{134,-26},{133,-26},{133,
          -15.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[1], lobby.surf_conBou[2]) annotation (Line(
      points={{-24,87},{-22,87},{-22,-38},{134,-38},{134,-26},{133,-26},{133,
          -16}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(lobby.ports[1], MulAirLea.ports_b[2]) annotation (Line(
      points={{122.5,-13},{80,-13},{80,-130},{-102,-130},{-102,-130.286},{-121,
          -130.286}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(intGaiLob.y, lobby.qGai_flow) annotation (Line(
      points={{101,32},{110,32},{110,-4},{119,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[1], TairBou[1].T) annotation (Line(
      points={{-139,92},{-84,92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[2], TairBou[2].T) annotation (Line(
      points={{-139,92},{-84,92}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TairBou.port, port_a) annotation (Line(
      points={{-62,92},{-24,92}},
      color={191,0,0},
      smooth=Smooth.None));




  connect(weaDat.weaBus, lobby.weaBus) annotation (Line(
      points={{100,72},{138.95,72},{138.95,0.95}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaDat.weaBus, mulTherBri.weaBus) annotation (Line(
      points={{100,72},{140,72},{140,120},{-158,120},{-158,-88},{-139,-88}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(weaDat.weaBus, MulAirLea.weaBus) annotation (Line(
      points={{100,72},{140,72},{140,120},{-158,120},{-158,-128},{-139,-128}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(heaCooSch.port_bCon, lobby.heaPorAir) annotation (Line(
      points={{-84,-31},{94,-31},{94,-8},{129.5,-8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCooSch.port_bTSet, lobby.heaPorAir) annotation (Line(
      points={{-84,-36},{96,-36},{96,-8},{129.5,-8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCooSch.port_bRad, lobby.heaPorRad) annotation (Line(
      points={{-84,-41},{96,-41},{96,-9.9},{129.5,-9.9}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[9], heaCooSch.heaCooFlo) annotation (Line(
      points={{-139,92},{-132,92},{-132,-26},{-122,-26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[16], heaCooSch.TSetHea) annotation (Line(
      points={{-139,92},{-132,92},{-132,-42},{-122,-42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[23], heaCooSch.TSetCoo) annotation (Line(
      points={{-139,92},{-132,92},{-132,-48},{-122,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHeaCoo.y[30], heaCooSch.schChoice) annotation (Line(
      points={{-139,92},{-132,92},{-132,-36},{-122,-36}},
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
end Lobby;
