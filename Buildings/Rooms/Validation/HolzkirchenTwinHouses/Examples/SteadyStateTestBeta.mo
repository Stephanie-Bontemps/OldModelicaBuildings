within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples;
package SteadyStateTestBeta
  "Test of the rooms and the global model with steady state conditions"
extends Modelica.Icons.ExamplesPackage;
  model KitchenSS
    "Model of the kitchen in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
    extends Modelica.Icons.Example;

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms.Kitchen kitchen(
      redeclare package Medium = Buildings.Media.Specialized.Air.PerfectGas,
      nPorts=1,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15,
      lat(displayUnit="rad") = 0.83555892609977,
      hRoo=2.495)
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

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiThermalBridge
                                                                                           mulTherBri(
      gKit=4.860,
      gLob=4.130,
      gCor=2.469,
      gBat=3.313,
      gLivRoo=10.579,
      gNorBed=5.976,
      gSouBed=5.752)
      annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiEffectiveAirLeakageArea
                                                                                                     MulAirLea(
      lBat=1.71e-04,
      lKit=1.71e-04,
      lLob=1.86e-04,
      lNorBed=1.71e-04,
      lSouBed=1.71e-04,
      lLivRoo1=6.10e-04,
      lLivRoo2=1.71e-04,
      sNor=1,
      sEas=1,
      sSou=1,
      sWes=1,
      redeclare package MediumB = Buildings.Media.Specialized.Air.PerfectGas)
      annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.InternalGains
                                                                                      intGaiKit(
      kRadGai=0,
      kConGai=0,
      kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      TDewPoi=293.15,
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600)
      annotation (Placement(transformation(extent={{80,60},{100,80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule
                                              heaCooSch(        kCoo=0,
      nRoo=1,
      kHea=1e6)
      annotation (Placement(transformation(extent={{-118,-56},{-82,-20}})));
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
        points={{122.5,-15},{80,-15},{80,-132},{-102,-132},{-102,-133.429},{
            -121,-133.429}},
        color={0,127,255},
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
        points={{-82,-34.1429},{94,-34.1429},{94,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_bRad, kitchen.heaPorRad) annotation (Line(
        points={{-82,-41.8571},{96,-41.8571},{96,-11.9},{129.5,-11.9}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[8], heaCooSch.heaCooFlo) annotation (Line(
        points={{-139,90},{-132,90},{-132,-29},{-120.571,-29}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[15], heaCooSch.TSetHea) annotation (Line(
        points={{-139,90},{-132,90},{-132,-45.7143},{-120.571,-45.7143}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[22], heaCooSch.TSetCoo) annotation (Line(
        points={{-139,90},{-132,90},{-132,-53.4286},{-120.571,-53.4286}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[30], heaCooSch.schChoice) annotation (Line(
        points={{-139,90},{-132,90},{-132,-38},{-120.571,-38}},
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
    connect(heaCooSch.port_aTSet[1], kitchen.heaPorAir) annotation (Line(
        points={{-118,-49.5714},{-10,-49.5714},{-10,-50},{100,-50},{100,-10},{
            129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(intGaiKit.intGai, kitchen.qGai_flow) annotation (Line(
        points={{101,30},{110,30},{110,-6},{119,-6}},
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

  model LobbySS
    "Model of the lobby in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
    extends Modelica.Icons.Example;

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms.Lobby lobby(
      nPorts=1,
      ExtWallNorthLgth=1.25,
      ExtDoorNorthLgth=1.00,
      IntWallOnNBedroomLgth=2.61,
      IntWallOnLivRoomLgth=1.315,
      DoorOnLivRoomLgth=0.935,
      IntWallOnKitchenLgth=2.61,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15,
      redeclare package Medium = Buildings.Media.Specialized.Air.PerfectGas,
      lat(displayUnit="rad") = 0.83555892609977,
      hRoo=2.495)
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

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiThermalBridge
                                                                                           mulTherBri(
      gKit=4.860,
      gLob=4.130,
      gCor=2.469,
      gBat=3.313,
      gLivRoo=10.579,
      gNorBed=5.976,
      gSouBed=5.752)
      annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiEffectiveAirLeakageArea
                                                                                                     MulAirLea(
      lBat=1.71e-04,
      lKit=1.71e-04,
      lLob=1.86e-04,
      lNorBed=1.71e-04,
      lSouBed=1.71e-04,
      lLivRoo1=6.10e-04,
      lLivRoo2=1.71e-04,
      sNor=1,
      sEas=1,
      sSou=1,
      sWes=1,
      redeclare package MediumB = Buildings.Media.Specialized.Air.PerfectGas)
      annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.InternalGains
                                                                                      intGaiLob(
      kRadGai=0,
      kConGai=0,
      kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      TDewPoi=293.15,
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600)
      annotation (Placement(transformation(extent={{80,60},{100,80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule
                                              heaCooSch(        kCoo=0,
      kHea=1e6,
      nRoo=1)
      annotation (Placement(transformation(extent={{-120,-56},{-84,-20}})));
  equation
    connect(mulTherBri.port_b[2], lobby.heaPorAir) annotation (Line(
        points={{-120,-90.5714},{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(lobby.ports[1], MulAirLea.ports_b[2]) annotation (Line(
        points={{122.5,-15},{80,-15},{80,-132},{-102,-132},{-102,-132.286},{
            -121,-132.286}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(intGaiLob.y, lobby.qGai_flow) annotation (Line(
        points={{101,30},{110,30},{110,-6},{119,-6}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(weaDat.weaBus, lobby.weaBus) annotation (Line(
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
    connect(heaCooSch.port_bCon, lobby.heaPorAir) annotation (Line(
        points={{-84,-34.1429},{94,-34.1429},{94,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_bRad, lobby.heaPorRad) annotation (Line(
        points={{-84,-41.8571},{96,-41.8571},{96,-11.9},{129.5,-11.9}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[9], heaCooSch.heaCooFlo) annotation (Line(
        points={{-139,90},{-132,90},{-132,-29},{-122.571,-29}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[16], heaCooSch.TSetHea) annotation (Line(
        points={{-139,90},{-132,90},{-132,-45.7143},{-122.571,-45.7143}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[23], heaCooSch.TSetCoo) annotation (Line(
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
    connect(port_a[2], lobby.surf_conBou[2]) annotation (Line(
        points={{-70,81},{0,81},{0,-60},{133,-60},{133,-18}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[3], lobby.surf_conBou[3]) annotation (Line(
        points={{-70,81.6667},{0,81.6667},{0,-60},{133,-60},{133,-17.6667}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[17], lobby.surf_conBou[1]) annotation (Line(
        points={{-70,91},{0,91},{0,-60},{133,-60},{133,-18.3333}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[21], lobby.surf_surBou[1]) annotation (Line(
        points={{-70,93.6667},{20,93.6667},{20,-52},{128.1,-52},{128.1,-17.3333}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[21], lobby.surf_surBou[2]) annotation (Line(
        points={{-70,93.6667},{20,93.6667},{20,-52},{128.1,-52},{128.1,-17}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[15], lobby.surf_surBou[3]) annotation (Line(
        points={{-70,89.6667},{-26,89.6667},{-26,92},{20,92},{20,-52},{128.1,
            -52},{128.1,-16.6667}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_aTSet[1], lobby.heaPorAir) annotation (Line(
        points={{-120,-49.5714},{100,-49.5714},{100,-10},{129.5,-10}},
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
  end LobbySS;

  model NorthBedroomSS
    "Model of the North bedroom in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
    extends Modelica.Icons.Example;

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms.NorthBedroom northBedroom(
      redeclare package Medium = Buildings.Media.Specialized.Air.PerfectGas,
      nPorts=1,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15,
      lat(displayUnit="rad") = 0.83555892609977,
      hRoo=2.495)
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

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiThermalBridge
                                                                                           mulTherBri(
      gKit=4.860,
      gLob=4.130,
      gCor=2.469,
      gBat=3.313,
      gLivRoo=10.579,
      gNorBed=5.976,
      gSouBed=5.752)
      annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiEffectiveAirLeakageArea
                                                                                                     MulAirLea(
      lBat=1.71e-04,
      lKit=1.71e-04,
      lLob=1.86e-04,
      lNorBed=1.71e-04,
      lSouBed=1.71e-04,
      lLivRoo1=6.10e-04,
      lLivRoo2=1.71e-04,
      sNor=1,
      sEas=1,
      sSou=1,
      sWes=1,
      redeclare package MediumB = Buildings.Media.Specialized.Air.PerfectGas)
      annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.InternalGains
                                                                                      intGaiLob(
      kRadGai=0,
      kConGai=0,
      kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      TDewPoi=293.15,
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600)
      annotation (Placement(transformation(extent={{80,60},{100,80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule
                                              heaCooSch(        kCoo=0,
      kHea=1e6,
      nRoo=1)
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
    connect(mulTherBri.port_b[3], northBedroom.heaPorAir) annotation (Line(
        points={{-120,-90.2857},{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(northBedroom.ports[1], MulAirLea.ports_b[3]) annotation (Line(
        points={{122.5,-15},{80,-15},{80,-132},{-102,-132},{-102,-131.143},{-121,
            -131.143}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(intGaiLob.y, northBedroom.qGai_flow) annotation (Line(
        points={{101,30},{110,30},{110,-6},{119,-6}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(weaDat.weaBus, northBedroom.weaBus) annotation (Line(
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
    connect(heaCooSch.port_bCon, northBedroom.heaPorAir) annotation (Line(
        points={{-84,-34.1429},{94,-34.1429},{94,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_bRad, northBedroom.heaPorRad) annotation (Line(
        points={{-84,-41.8571},{96,-41.8571},{96,-11.9},{129.5,-11.9}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[10], heaCooSch.heaCooFlo) annotation (Line(
        points={{-139,90},{-132,90},{-132,-29},{-122.571,-29}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[17], heaCooSch.TSetHea) annotation (Line(
        points={{-139,90},{-132,90},{-132,-45.7143},{-122.571,-45.7143}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[24], heaCooSch.TSetCoo) annotation (Line(
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

    connect(bliPos.y[2], northBedroom.uSha[1]) annotation (Line(
        points={{-139,50},{-10,50},{-10,-2},{119,-2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(port_a[1], northBedroom.surf_conBou[1]) annotation (Line(
        points={{-70,80.3333},{-40,80.3333},{-40,-80},{133,-80},{133,-18.25}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[3], northBedroom.surf_conBou[2]) annotation (Line(
        points={{-70,81.6667},{-40,81.6667},{-40,-80},{133,-80},{133,-17.75}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[19], northBedroom.surf_surBou[1]) annotation (Line(
        points={{-70,92.3333},{-20,92.3333},{-20,-60},{128.1,-60},{128.1,-17.4}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(port_a[18], northBedroom.surf_surBou[2]) annotation (Line(
        points={{-70,91.6667},{-20,91.6667},{-20,-60},{128.1,-60},{128.1,-17.2}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(port_a[18], northBedroom.surf_surBou[3]) annotation (Line(
        points={{-70,91.6667},{-20,91.6667},{-20,-60},{128.1,-60},{128.1,-17}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[21], northBedroom.surf_surBou[4]) annotation (Line(
        points={{-70,93.6667},{-20,93.6667},{-20,-60},{128.1,-60},{128.1,-16.8}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(port_a[16], northBedroom.surf_surBou[5]) annotation (Line(
        points={{-70,90.3333},{-20,90.3333},{-20,-60},{128.1,-60},{128.1,-16.6}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(heaCooSch.port_aTSet[1], northBedroom.heaPorAir) annotation (Line(
        points={{-120,-49.5714},{-10,-49.5714},{-10,-50},{100,-50},{100,-10},{129.5,
            -10}},
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
  end NorthBedroomSS;

  model CorridorSS
    "Model of the corridor in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
    extends Modelica.Icons.Example;

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms.Corridor corridor(
      redeclare package Medium = Buildings.Media.Specialized.Air.PerfectGas,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15,
      lat(displayUnit="rad") = 0.83555892609977,
      hRoo=2.495)
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

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiThermalBridge
                                                                                           mulTherBri(
      gKit=4.860,
      gLob=4.130,
      gCor=2.469,
      gBat=3.313,
      gLivRoo=10.579,
      gNorBed=5.976,
      gSouBed=5.752)
      annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.InternalGains
                                                                                      intGaiLob(
      kRadGai=0,
      kConGai=0,
      kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      TDewPoi=293.15,
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600)
      annotation (Placement(transformation(extent={{80,60},{100,80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule
                                              heaCooSch(        kCoo=0,
      kHea=1e6,
      nRoo=1)
      annotation (Placement(transformation(extent={{-120,-56},{-84,-20}})));
  equation
    connect(mulTherBri.port_b[4],corridor. heaPorAir) annotation (Line(
        points={{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
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
        points={{-120,-49.5714},{-10,-49.5714},{-10,-50},{100,-50},{100,-10},{129.5,
            -10}},
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

  model BathroomSS
    "Model of the bathroom in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
    extends Modelica.Icons.Example;

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms.Bathroom bathroom(
      redeclare package Medium = Buildings.Media.Specialized.Air.PerfectGas,
      nPorts=1,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15,
      lat(displayUnit="rad") = 0.83555892609977,
      hRoo=2.495)
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

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiThermalBridge
                                                                                           mulTherBri(
      gKit=4.860,
      gLob=4.130,
      gCor=2.469,
      gBat=3.313,
      gLivRoo=10.579,
      gNorBed=5.976,
      gSouBed=5.752)
      annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiEffectiveAirLeakageArea
                                                                                                     MulAirLea(
      lBat=1.71e-04,
      lKit=1.71e-04,
      lLob=1.86e-04,
      lNorBed=1.71e-04,
      lSouBed=1.71e-04,
      lLivRoo1=6.10e-04,
      lLivRoo2=1.71e-04,
      sNor=1,
      sEas=1,
      sSou=1,
      sWes=1,
      redeclare package MediumB = Buildings.Media.Specialized.Air.PerfectGas)
      annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.InternalGains
                                                                                      intGaiLob(
      kRadGai=0,
      kConGai=0,
      kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      TDewPoi=293.15,
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600)
      annotation (Placement(transformation(extent={{80,60},{100,80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule
                                              heaCooSch(        kCoo=0,
      kHea=1e6,
      nRoo=1)
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
    connect(mulTherBri.port_b[5], bathroom.heaPorAir) annotation (Line(
        points={{-120,-89.7143},{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(bathroom.ports[1], MulAirLea.ports_b[4]) annotation (Line(
        points={{122.5,-15},{80,-15},{80,-132},{-102,-132},{-102,-130},{-121,-130}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(intGaiLob.y, bathroom.qGai_flow) annotation (Line(
        points={{101,30},{110,30},{110,-6},{119,-6}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(weaDat.weaBus, bathroom.weaBus) annotation (Line(
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
    connect(heaCooSch.port_bCon, bathroom.heaPorAir) annotation (Line(
        points={{-84,-34.1429},{94,-34.1429},{94,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_bRad, bathroom.heaPorRad) annotation (Line(
        points={{-84,-41.8571},{96,-41.8571},{96,-11.9},{129.5,-11.9}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[12], heaCooSch.heaCooFlo) annotation (Line(
        points={{-139,90},{-132,90},{-132,-29},{-122.571,-29}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[19], heaCooSch.TSetHea) annotation (Line(
        points={{-139,90},{-132,90},{-132,-45.7143},{-122.571,-45.7143}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[26], heaCooSch.TSetCoo) annotation (Line(
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
    connect(bliPos.y[3], bathroom.uSha[1]) annotation (Line(
        points={{-139,50},{-10,50},{-10,-2},{119,-2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(port_a[17], bathroom.surf_conBou[1]) annotation (Line(
        points={{-70,91},{-40,91},{-40,-80},{133,-80},{133,-18.3333}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[1], bathroom.surf_conBou[2]) annotation (Line(
        points={{-70,80.3333},{-40,80.3333},{-40,-80},{133,-80},{133,-18}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[3], bathroom.surf_conBou[3]) annotation (Line(
        points={{-70,81.6667},{-40,81.6667},{-40,-80},{133,-80},{133,-17.6667}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[20], bathroom.surf_surBou[1]) annotation (Line(
        points={{-70,93},{-20,93},{-20,-60},{128.1,-60},{128.1,-17.3333}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[18], bathroom.surf_surBou[2]) annotation (Line(
        points={{-70,91.6667},{-20,91.6667},{-20,-60},{128.1,-60},{128.1,-17}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[18], bathroom.surf_surBou[3]) annotation (Line(
        points={{-70,91.6667},{-20,91.6667},{-20,-60},{128.1,-60},{128.1,-16.6667}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(heaCooSch.port_aTSet[1], bathroom.heaPorAir) annotation (Line(
        points={{-120,-49.5714},{-10,-49.5714},{-10,-50},{100,-50},{100,-10},{129.5,
            -10}},
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
  end BathroomSS;

  model SouthBedroomSS
    "Model of the South bedroom in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
    extends Modelica.Icons.Example;

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms.SouthBedroom southBedroom(
      redeclare package Medium = Buildings.Media.Specialized.Air.PerfectGas,
      nPorts=1,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15,
      lat(displayUnit="rad") = 0.83555892609977,
      hRoo=2.495)
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

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiThermalBridge
                                                                                           mulTherBri(
      gKit=4.860,
      gLob=4.130,
      gCor=2.469,
      gBat=3.313,
      gLivRoo=10.579,
      gNorBed=5.976,
      gSouBed=5.752)
      annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiEffectiveAirLeakageArea
                                                                                                     MulAirLea(
      lBat=1.71e-04,
      lKit=1.71e-04,
      lLob=1.86e-04,
      lNorBed=1.71e-04,
      lSouBed=1.71e-04,
      lLivRoo1=6.10e-04,
      lLivRoo2=1.71e-04,
      sNor=1,
      sEas=1,
      sSou=1,
      sWes=1,
      redeclare package MediumB = Buildings.Media.Specialized.Air.PerfectGas)
      annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.InternalGains
                                                                                      intGaiLob(
      kRadGai=0,
      kConGai=0,
      kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      TDewPoi=293.15,
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600)
      annotation (Placement(transformation(extent={{80,60},{100,80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule
                                              heaCooSch(        kCoo=0,
      kHea=1e6,
      nRoo=1)
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
    connect(mulTherBri.port_b[6], southBedroom.heaPorAir) annotation (Line(
        points={{-120,-89.4286},{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(southBedroom.ports[1], MulAirLea.ports_b[5]) annotation (Line(
        points={{122.5,-15},{80,-15},{80,-132},{-102,-132},{-102,-128.857},{-121,
            -128.857}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(intGaiLob.y, southBedroom.qGai_flow) annotation (Line(
        points={{101,30},{110,30},{110,-6},{119,-6}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(weaDat.weaBus, southBedroom.weaBus) annotation (Line(
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
    connect(heaCooSch.port_bCon, southBedroom.heaPorAir) annotation (Line(
        points={{-84,-34.1429},{94,-34.1429},{94,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_bRad, southBedroom.heaPorRad) annotation (Line(
        points={{-84,-41.8571},{96,-41.8571},{96,-11.9},{129.5,-11.9}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[13], heaCooSch.heaCooFlo) annotation (Line(
        points={{-139,90},{-132,90},{-132,-29},{-122.571,-29}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[20], heaCooSch.TSetHea) annotation (Line(
        points={{-139,90},{-132,90},{-132,-45.7143},{-122.571,-45.7143}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[27], heaCooSch.TSetCoo) annotation (Line(
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

    connect(bliPos.y[4], southBedroom.uSha[1]) annotation (Line(
        points={{-139,50},{-10,50},{-10,-2},{119,-2}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(port_a[18], southBedroom.surf_conBou[1]) annotation (Line(
        points={{-70,91.6667},{-40,91.6667},{-40,-80},{133,-80},{133,-18.4}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[18], southBedroom.surf_conBou[2]) annotation (Line(
        points={{-70,91.6667},{-40,91.6667},{-40,-80},{133,-80},{133,-18.2}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[19], southBedroom.surf_conBou[3]) annotation (Line(
        points={{-70,92.3333},{-40,92.3333},{-40,-80},{133,-80},{133,-18}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[1], southBedroom.surf_conBou[4]) annotation (Line(
        points={{-70,80.3333},{-40,80.3333},{-40,-80},{133,-80},{133,-17.8}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[3], southBedroom.surf_conBou[5]) annotation (Line(
        points={{-70,81.6667},{-40,81.6667},{-40,-80},{133,-80},{133,-17.6}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[21], southBedroom.surf_surBou[1]) annotation (Line(
        points={{-70,93.6667},{-20,93.6667},{-20,-60},{128.1,-60},{128.1,-17}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_aTSet[1], southBedroom.heaPorAir) annotation (Line(
        points={{-120,-49.5714},{-10,-49.5714},{-10,-50},{100,-50},{100,-10},{129.5,
            -10}},
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
  end SouthBedroomSS;

  model LivingRoomSS
    "Model of the living room in the N2 Twin House with Steady State conditions : outside temperature and boundary temperatures have a value of 20°C, initialisation at 0°C and no radiation"
    extends Modelica.Icons.Example;

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms.LivingRoom livingRoom(
      redeclare package Medium = Buildings.Media.Specialized.Air.PerfectGas,
      nPorts=3,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15,
      lat(displayUnit="rad") = 0.83555892609977,
      hRoo=2.495)
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

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiThermalBridge
                                                                                           mulTherBri(
      gKit=4.860,
      gLob=4.130,
      gCor=2.469,
      gBat=3.313,
      gLivRoo=10.579,
      gNorBed=5.976,
      gSouBed=5.752)
      annotation (Placement(transformation(extent={{-140,-100},{-120,-80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiEffectiveAirLeakageArea
                                                                                                     MulAirLea(
      lBat=1.71e-04,
      lKit=1.71e-04,
      lLob=1.86e-04,
      lNorBed=1.71e-04,
      lSouBed=1.71e-04,
      lLivRoo1=6.10e-04,
      lLivRoo2=1.71e-04,
      sNor=1,
      sEas=1,
      sSou=1,
      sWes=1,
      redeclare package MediumB = Buildings.Media.Specialized.Air.PerfectGas)
      annotation (Placement(transformation(extent={{-140,-140},{-120,-120}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.InternalGains
                                                                                      intGaiLob(
      kRadGai=0,
      kConGai=0,
      kLatGai=0) annotation (Placement(transformation(extent={{80,20},{100,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      TDewPoi=293.15,
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600)
      annotation (Placement(transformation(extent={{80,60},{100,80}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule
                                              heaCooSch(        kCoo=0,
      kHea=1e6,
      nRoo=1)
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
    connect(mulTherBri.port_b[7], livingRoom.heaPorAir) annotation (Line(
        points={{-120,-89.1429},{-120,-90},{-60,-90},{-60,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(livingRoom.ports[1], MulAirLea.ports_b[6]) annotation (Line(
        points={{122.5,-16.3333},{80,-16.3333},{80,-132},{-102,-132},{-102,-127.714},
            {-121,-127.714}},
        color={0,127,255},
        smooth=Smooth.None));

    connect(intGaiLob.y, livingRoom.qGai_flow) annotation (Line(
        points={{101,30},{110,30},{110,-6},{119,-6}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(weaDat.weaBus, livingRoom.weaBus) annotation (Line(
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
    connect(heaCooSch.port_bCon, livingRoom.heaPorAir) annotation (Line(
        points={{-84,-34.1429},{94,-34.1429},{94,-10},{129.5,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_bRad, livingRoom.heaPorRad) annotation (Line(
        points={{-84,-41.8571},{96,-41.8571},{96,-11.9},{129.5,-11.9}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[13], heaCooSch.heaCooFlo) annotation (Line(
        points={{-139,90},{-132,90},{-132,-29},{-122.571,-29}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[20], heaCooSch.TSetHea) annotation (Line(
        points={{-139,90},{-132,90},{-132,-45.7143},{-122.571,-45.7143}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bouVenHeaCoo.y[27], heaCooSch.TSetCoo) annotation (Line(
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

    connect(port_a[15], livingRoom.surf_conBou[1]) annotation (Line(
        points={{-70,89.6667},{-40,89.6667},{-40,-80},{133,-80},{133,-18.45}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[15], livingRoom.surf_conBou[2]) annotation (Line(
        points={{-70,89.6667},{-40,89.6667},{-40,-80},{133,-80},{133,-18.35}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[16], livingRoom.surf_conBou[3]) annotation (Line(
        points={{-70,90.3333},{-40,90.3333},{-40,-80},{133,-80},{133,-18.25}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[16], livingRoom.surf_conBou[4]) annotation (Line(
        points={{-70,90.3333},{-40,90.3333},{-40,-80},{133,-80},{133,-18.15}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[17], livingRoom.surf_conBou[5]) annotation (Line(
        points={{-70,91},{-40,91},{-40,-80},{133,-80},{133,-18.05}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(bliPos.y[5], livingRoom.uSha[1]) annotation (Line(
        points={{-139,50},{-10,50},{-10,-2.66667},{119,-2.66667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bliPos.y[6], livingRoom.uSha[2]) annotation (Line(
        points={{-139,50},{-10,50},{-10,-2},{119,-2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(bliPos.y[7], livingRoom.uSha[3]) annotation (Line(
        points={{-139,50},{-10,50},{-10,-1.33333},{119,-1.33333}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(MulAirLea.ports_b[7], livingRoom.ports[2]) annotation (Line(
        points={{-121,-126.571},{0.5,-126.571},{0.5,-15},{122.5,-15}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(port_a[18], livingRoom.surf_conBou[6]) annotation (Line(
        points={{-70,91.6667},{-40,91.6667},{-40,-80},{133,-80},{133,-17.95}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[18], livingRoom.surf_conBou[7]) annotation (Line(
        points={{-70,91.6667},{-40,91.6667},{-40,-80},{133,-80},{133,-17.85}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[20], livingRoom.surf_conBou[8]) annotation (Line(
        points={{-70,93},{-40,93},{-40,-80},{133,-80},{133,-17.75}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[2], livingRoom.surf_conBou[9]) annotation (Line(
        points={{-70,81},{-40,81},{-40,-80},{133,-80},{133,-17.65}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_a[3], livingRoom.surf_conBou[10]) annotation (Line(
        points={{-70,81.6667},{-40,81.6667},{-40,-80},{133,-80},{133,-17.55}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(heaCooSch.port_aTSet[1], livingRoom.heaPorAir) annotation (Line(
        points={{-120,-49.5714},{-10,-49.5714},{-10,-50},{100,-50},{100,-10},{129.5,
            -10}},
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
  end LivingRoomSS;

  model N2HouseSS "Test of the model of the N2 House in Steaty State"
    extends Modelica.Icons.Example;
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel1
                                                                                  N2House(
      NomFichierBlinds="D:/Berkeley Lab/Berkeley IEA58/N2BliPosExp1.txt",
      kCoo=0,
      kDooOpeKitLiv=0,
      kDooOpeLobLiv=0,
      kDooOpeNthBedCor=0,
      kDooOpeBatCor=1,
      kDooOpeSthBedCor=1,
      kDooOpeCorLiv=1,
      NomFichierBouVenHeaCoo="D:/Berkeley Lab/Berkeley IEA58/N2BouVenHeaCooSS.txt",
      kHea=0,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
      redeclare package MediumA = Buildings.Media.Specialized.Air.PerfectGas,
      Tini_int=273.15,
      Tini_ext=293.15,
      Tini_bou=293.15)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));

    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ReaderWeatherFile2
                                                                                           weaDat(
      calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
      filNam="D:/Berkeley Lab/Berkeley IEA58/WeatherSS.txt",
      lon=0.20469221467389,
      lat=0.83555892609977,
      timZon=3600) annotation (Placement(transformation(extent={{0,60},{20,80}})));

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
end SteadyStateTestBeta;
