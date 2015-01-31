within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses;
model N2HouseModel "Model of the N2 Twin House"
  parameter String NomFichierBouVenHeat = "NoName"
    "File where ceiling and floor boundary conditions are stored with ventilation flow rates and temperatures"
                                                                                                        annotation (Dialog(
        __Dymola_loadSelector(caption=
            "Select ceiling and floor boundary conditions file")));
  parameter String NomFichierBlinds = "NoName"
    "File where the scenario of blinds position is stored"                                           annotation (Dialog(
        __Dymola_loadSelector(caption=
            "Select blinds position file")));
  parameter String NomFichierTMasFloLiv = "NoName"
    "File where the temperature and the supplied mass flow rate are stored"                                           annotation (Dialog(
        __Dymola_loadSelector(caption=
            "Select temperature and supplied mass flow rate file")));
  parameter String NomFichierTMasFloSou = "NoName"
    "File where the temperature and the supplied mass flow rate are stored"                                           annotation (Dialog(
        __Dymola_loadSelector(caption=
            "Select temperature and extracted mass flow rate file for the South bedroom")));
  parameter String NomFichierTMasFloBat = "NoName"
    "File where the temperature and the extracted mass flow rate are stored for the bathroom"
                                                                                                        annotation (Dialog(
        __Dymola_loadSelector(caption=
            "Select temperature and supplied mass flow rate file")));

  Rooms.LivingRoom livingRoom(redeclare package Medium = MediumA, nPorts=10)
    annotation (Placement(transformation(extent={{0,-120},{20,-100}})));
  Rooms.SouthBedroom southBedroom(redeclare package Medium = MediumA, nPorts=4)
    annotation (Placement(transformation(extent={{140,-140},{160,-120}})));
  Rooms.NorthBedroom northBedroom(redeclare package Medium = MediumA, nPorts=3)
    annotation (Placement(transformation(extent={{140,80},{160,100}})));
  Rooms.Corridor corridor(redeclare package Medium = MediumA, nPorts=8)
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Rooms.Bathroom bathroom(redeclare package Medium = MediumA, nPorts=5)
    annotation (Placement(transformation(extent={{120,-20},{140,0}})));
  Rooms.Kitchen kitchen(redeclare package Medium = MediumA, nPorts=3)
    annotation (Placement(transformation(extent={{-60,120},{-40,140}})));
  Rooms.Lobby lobby(redeclare package Medium = MediumA, nPorts=3)
    annotation (Placement(transformation(extent={{40,100},{60,120}})));
  BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{200,200},{220,220}}),
                                                    iconTransformation(extent={{200,200},
            {220,220}})));
  Modelica.Blocks.Sources.CombiTimeTable bliPos(
    final tableOnFile=true,
    final fileName=
        Buildings.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(
        NomFichierBlinds),
    final tableName="BliPos")
    "Scenario of the blinds position applied on the South windows"
    annotation (Placement(transformation(extent={{-180,80},{-160,100}})));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature TairBou[3]
    annotation (Placement(transformation(extent={{-180,140},{-160,160}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a[3]
    annotation (Placement(transformation(extent={{-140,140},{-120,160}})));

  Modelica.Blocks.Sources.CombiTimeTable bouVenHea(
    final tableOnFile=true,
    final tableName="BouVenHeat",
    final fileName=
        Buildings.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(
        NomFichierBouVenHea))
    "Boundary conditions for ceiling (1 for East, 2 for West) and floor (3); ventilation supply flow rate (6) and its temperature (4); ventilation extraction flow rate (7) and its temperature (5)"
    annotation (Placement(transformation(extent={{-220,140},{-200,160}})));

  parameter Real kRad=0 "Radiative heat gain (constant output value)";
  parameter Real kCon=0 "Convective heat gain (constant output value)";
  parameter Real kLat=0 "Latent heat gain (constant output value)";
  replaceable package MediumA = Modelica.Media.Interfaces.PartialMedium;
  BaseClasses.MultiThermalBridge  MulTherBri
    annotation (Placement(transformation(extent={{-180,20},{-160,40}})));
  Fluid.Sources.MassFlowSource_T venLivRoo(
    redeclare package Medium = MediumA,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) "Supply ventilation in the living room"
    annotation (Placement(transformation(extent={{-160,-160},{-140,-140}})));
  Fluid.Sources.MassFlowSource_T venSouBed(
    nPorts=1,
    redeclare package Medium = MediumA,
    use_m_flow_in=true,
    use_T_in=true) "Ventilation extraction in the South bedroom"
    annotation (Placement(transformation(extent={{-120,-180},{-100,-160}})));
  Fluid.Sources.MassFlowSource_T venBat(
    nPorts=1,
    redeclare package Medium = MediumA,
    use_m_flow_in=true,
    use_T_in=true) "Ventilation extraction in the bathroom"
    annotation (Placement(transformation(extent={{-120,-220},{-100,-200}})));
  BaseClasses.MultiEffectiveAirLeakageArea multiEffectiveAirLeakageArea(
    LBat=1.71e-04,
    LKit=1.71e-04,
    LLob=1.86e-04,
    LNorBed=1.71e-04,
    LSouBed=1.71e-04,
    LLivRoo1=6.10e-04,
    LLivRoo2=1.71e-04)
    annotation (Placement(transformation(extent={{-180,-40},{-160,-20}})));
  BaseClasses.InternalGains intGaiLob
    annotation (Placement(transformation(extent={{0,120},{20,140}})));
  BaseClasses.InternalGains intGaiNorBed
    annotation (Placement(transformation(extent={{100,100},{120,120}})));
  BaseClasses.InternalGains intGaiCor
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  BaseClasses.InternalGains intGaiBat
    annotation (Placement(transformation(extent={{80,20},{100,40}})));
  BaseClasses.InternalGains intGaiLivRoo
    annotation (Placement(transformation(extent={{-40,-100},{-20,-80}})));
  BaseClasses.InternalGains intGaiSouBed
    annotation (Placement(transformation(extent={{100,-120},{120,-100}})));
  BaseClasses.InternalGains intGaiKit(yConGai=false)
    annotation (Placement(transformation(extent={{-100,160},{-80,180}})));
  Modelica.Blocks.Math.Division divOutVen
    "Extraction volume distributed equally to both exhaust ducts"
    annotation (Placement(transformation(extent={{-160,-200},{-140,-180}})));
  Modelica.Blocks.Sources.Constant const(k=2)
    annotation (Placement(transformation(extent={{-220,-220},{-200,-200}})));
  BaseClasses.OpenOrClosedDoor DooKitLiv(kDooOpe=0)
    "Door between kitchen and living room"
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  BaseClasses.OpenOrClosedDoor DooLobLiv(kDooOpe=0)
    "Door between lobby and living room"
    annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  BaseClasses.OpenOrClosedDoor DooNthCor(kDooOpe=0)
    "Door between North bedroom and corridor"
    annotation (Placement(transformation(extent={{110,52},{130,72}})));
  BaseClasses.OpenOrClosedDoor DooBatCor(kDooOpe=1)
    "Door between bathroom and corridor"
    annotation (Placement(transformation(extent={{82,-48},{102,-28}})));
  BaseClasses.OpenOrClosedDoor DooSthBedCor(kDooOpe=1)
    "Door between South bedroom and corridor"
    annotation (Placement(transformation(extent={{100,-86},{120,-66}})));
  BaseClasses.OpenOrClosedDoor DooCorLiv(kDooOpe=10)
    "Door between corridor and living room"
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  BaseClasses.HeatingCoolingSchedule heaCoolSch
    annotation (Placement(transformation(extent={{-180,-120},{-160,-100}})));
equation
  connect(kitchen.weaBus, weaBus) annotation (Line(
      points={{-41.05,138.95},{-41.05,210},{210,210}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(lobby.weaBus, weaBus) annotation (Line(
      points={{58.95,118.95},{58.95,210},{210,210}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(northBedroom.weaBus, weaBus) annotation (Line(
      points={{158.95,98.95},{158.95,210},{210,210}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southBedroom.weaBus, weaBus) annotation (Line(
      points={{158.95,-121.05},{158.95,-100},{220,-100},{220,210},{210,210}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(livingRoom.weaBus, weaBus) annotation (Line(
      points={{18.95,-101.05},{18.95,-100},{220,-100},{220,210},{210,210}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(kitchen.surf_conBou[1], lobby.surf_surBou[3]) annotation (Line(
      points={{-47,121.667},{-46,121.667},{-46,80},{48.1,80},{48.1,103.333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(kitchen.surf_surBou[1], livingRoom.surf_conBou[1]) annotation (Line(
      points={{-51.9,122.75},{-51.9,-140},{14,-140},{14,-130},{13,-130},{13,-118.45}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(kitchen.surf_surBou[2], livingRoom.surf_conBou[2]) annotation (Line(
      points={{-51.9,123.25},{-51.9,-140},{-22,-140},{13,-140},{13,-130},{13,-118.35}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(lobby.surf_conBou[1], northBedroom.surf_surBou[5]) annotation (Line(
      points={{53,101.667},{54,101.667},{54,60},{148.1,60},{148.1,83.4}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(lobby.surf_surBou[1], livingRoom.surf_conBou[3]) annotation (Line(
      points={{48.1,102.667},{48.1,-140},{13,-140},{13,-118.25}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(lobby.surf_surBou[2], livingRoom.surf_conBou[4]) annotation (Line(
      points={{48.1,103},{48.1,-2},{48,-2},{48,-140},{13,-140},{13,-118.15}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(northBedroom.surf_surBou[1], bathroom.surf_conBou[1]) annotation (
      Line(
      points={{148.1,82.6},{148.1,-40},{148,-40},{133,-40},{133,-18.3333},{133,
          -18.3333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(northBedroom.surf_surBou[2], corridor.surf_conBou[1]) annotation (
      Line(
      points={{148.1,82.8},{148.1,-20},{140,-20},{73,-20},{73,1.58333},{73,
          1.58333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(northBedroom.surf_surBou[3], corridor.surf_conBou[2]) annotation (
      Line(
      points={{148.1,83},{148.1,-20},{73,-20},{73,1.75}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bathroom.surf_surBou[2], corridor.surf_conBou[3]) annotation (Line(
      points={{128.1,-17},{128.1,-28},{128,-28},{128,-40},{73,-40},{73,1.91667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bathroom.surf_surBou[3], corridor.surf_conBou[4]) annotation (Line(
      points={{128.1,-16.6667},{128.1,-28},{128,-28},{128,-40},{73,-40},{73,
          2.08333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(corridor.surf_surBou[1], southBedroom.surf_conBou[1]) annotation (
      Line(
      points={{68.1,2.625},{68.1,-160},{154,-160},{154,-150},{153,-150},{153,-138.4}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(corridor.surf_surBou[2], southBedroom.surf_conBou[2]) annotation (
      Line(
      points={{68.1,2.875},{68.1,-160},{154,-160},{154,-150},{153,-150},{153,-138.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(corridor.surf_surBou[3], livingRoom.surf_conBou[6]) annotation (Line(
      points={{68.1,3.125},{68.1,-140},{13,-140},{13,-117.95}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(corridor.surf_surBou[4], livingRoom.surf_conBou[7]) annotation (Line(
      points={{68.1,3.375},{68.1,-68},{68.1,-140},{68,-140},{13,-140},{13,-117.85}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(southBedroom.surf_surBou[1], livingRoom.surf_conBou[8]) annotation (
      Line(
      points={{148.1,-137},{148.1,-160},{13,-160},{13,-117.75}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[1], northBedroom.surf_conBou[1]) annotation (Line(
      points={{-130,143.333},{-80,143.333},{-80,60},{154,60},{154,70},{153,70},
          {153,81.75}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], northBedroom.surf_conBou[2]) annotation (Line(
      points={{-130,156.667},{-80,156.667},{-80,60},{153,60},{153,82.25}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[1], corridor.surf_conBou[5]) annotation (Line(
      points={{-130,143.333},{-80,143.333},{-80,-20},{73,-20},{73,2.25}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], corridor.surf_conBou[6]) annotation (Line(
      points={{-130,156.667},{-80,156.667},{-80,-20},{73,-20},{73,2.41667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[1], bathroom.surf_conBou[2]) annotation (Line(
      points={{-130,143.333},{-80,143.333},{-80,-40},{133,-40},{133,-18}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], bathroom.surf_conBou[3]) annotation (Line(
      points={{-130,156.667},{-80,156.667},{-80,-40},{133,-40},{133,-17.6667}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[1], southBedroom.surf_conBou[4]) annotation (Line(
      points={{-130,143.333},{-80,143.333},{-80,-160},{153,-160},{153,-137.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], southBedroom.surf_conBou[5]) annotation (Line(
      points={{-130,156.667},{-80,156.667},{-80,-160},{153,-160},{153,-137.6}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[2], livingRoom.surf_conBou[9]) annotation (Line(
      points={{-130,150},{-80,150},{-80,-140},{13,-140},{13,-117.65}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], livingRoom.surf_conBou[1]) annotation (Line(
      points={{-130,156.667},{-80,156.667},{-80,-140},{13,-140},{13,-118.45}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bliPos.y[1], northBedroom.uSha[1]) annotation (Line(
      points={{-159,90},{-100,90},{-100,98},{139,98}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bliPos.y[2], bathroom.uSha[1]) annotation (Line(
      points={{-159,90},{-100,90},{-100,-2},{119,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bliPos.y[3], southBedroom.uSha[1]) annotation (Line(
      points={{-159,90},{-100,90},{-100,-122},{139,-122}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bliPos.y[4], livingRoom.uSha[1]) annotation (Line(
      points={{-159,90},{-100,90},{-100,-102},{-50,-102},{-50,-102.667},{-1,
          -102.667}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bliPos.y[5], livingRoom.uSha[2]) annotation (Line(
      points={{-159,90},{-100,90},{-100,-102},{-1,-102}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bliPos.y[6], livingRoom.uSha[3]) annotation (Line(
      points={{-159,90},{-100,90},{-100,-101.333},{-1,-101.333}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bliPos.y[7], kitchen.uSha[1]) annotation (Line(
      points={{-159,90},{-100,90},{-100,138},{-61,138}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bathroom.weaBus, weaBus) annotation (Line(
      points={{138.95,-1.05},{138.95,20},{220,20},{220,210},{210,210}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(MulTherBri.port_a[1], kitchen.heaPorAir) annotation (Line(
      points={{-161,29.1429},{-140,29.1429},{-140,30},{-120,30},{-120,130},{
          -50.5,130}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(MulTherBri.port_a[2], lobby.heaPorAir) annotation (Line(
      points={{-161,29.4286},{-140,29.4286},{-140,30},{-120,30},{-120,110},{
          49.5,110}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(MulTherBri.port_a[3], northBedroom.heaPorAir) annotation (Line(
      points={{-161,29.7143},{-140,29.7143},{-140,30},{-120,30},{-120,90},{
          149.5,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(MulTherBri.port_a[4], corridor.heaPorAir) annotation (Line(
      points={{-161,30},{-120,30},{-120,10},{69.5,10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(MulTherBri.port_a[5], bathroom.heaPorAir) annotation (Line(
      points={{-161,30.2857},{-120,30.2857},{-120,-10},{129.5,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(MulTherBri.port_a[7], livingRoom.heaPorAir) annotation (Line(
      points={{-161,30.8571},{-120,30.8571},{-120,-110},{9.5,-110}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(MulTherBri.port_a[6], southBedroom.heaPorAir) annotation (Line(
      points={{-161,30.5714},{-120,30.5714},{-120,-130},{149.5,-130}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(weaBus, corridor.weaBus) annotation (Line(
      points={{210,210},{220,210},{220,20},{78.95,20},{78.95,18.95}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus, MulTherBri.weaBus) annotation (Line(
      points={{210,210},{-220,210},{-220,30},{-179,30}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus, multiEffectiveAirLeakageArea.weaBus) annotation (Line(
      points={{210,210},{-220,210},{-220,-30},{-179,-30}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(bathroom.surf_surBou[1], southBedroom.surf_conBou[3]) annotation (
      Line(
      points={{128.1,-17.3333},{128.1,-160},{153,-160},{153,-138}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(northBedroom.surf_surBou[4], livingRoom.surf_conBou[5]) annotation (
      Line(
      points={{148.1,83.2},{148.1,-80},{80,-80},{80,-140},{13,-140},{13,-118.05}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(port_a[3], lobby.surf_conBou[3]) annotation (Line(
      points={{-130,156.667},{-80,156.667},{-80,80},{53,80},{53,102.333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[2], lobby.surf_conBou[2]) annotation (Line(
      points={{-130,150},{-80,150},{-80,80},{53,80},{53,102}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[2], kitchen.surf_conBou[2]) annotation (Line(
      points={{-130,150},{-80,150},{-80,100},{-47,100},{-47,122}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a[3], kitchen.surf_conBou[3]) annotation (Line(
      points={{-130,156.667},{-80,156.667},{-80,100},{-47,100},{-47,122.333}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(multiEffectiveAirLeakageArea.ports_b[1], kitchen.ports[1]) annotation (
     Line(
      points={{-161,-33.4286},{-160,-33.4286},{-160,-32},{-140,-32},{-140,
          123.667},{-57.5,123.667}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(lobby.ports[1], multiEffectiveAirLeakageArea.ports_b[2]) annotation (Line(
      points={{42.5,103.667},{-140,103.667},{-140,-32},{-162,-32},{-162,
          -32.2857},{-161,-32.2857}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(northBedroom.ports[1], multiEffectiveAirLeakageArea.ports_b[3]) annotation (Line(
      points={{142.5,83.6667},{-140,83.6667},{-140,-32},{-162,-32},{-162,
          -31.1429},{-161,-31.1429}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(bathroom.ports[1], multiEffectiveAirLeakageArea.ports_b[4]) annotation (Line(
      points={{122.5,-16.6},{-140,-16.6},{-140,-32},{-161,-32},{-161,-30}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(southBedroom.ports[1], multiEffectiveAirLeakageArea.ports_b[5]) annotation (Line(
      points={{142.5,-136.5},{-140,-136.5},{-140,-32},{-161,-32},{-161,-28.8571}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(livingRoom.ports[1], multiEffectiveAirLeakageArea.ports_b[6]) annotation (Line(
      points={{2.5,-116.8},{-140,-116.8},{-140,-32},{-161,-32},{-161,-27.7143}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(livingRoom.ports[2], multiEffectiveAirLeakageArea.ports_b[7]) annotation (Line(
      points={{2.5,-116.4},{-140,-116.4},{-140,-32},{-161,-32},{-161,-26.5714}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(intGaiKit.y, kitchen.qGai_flow) annotation (Line(
      points={{-79,170},{-70,170},{-70,134},{-61,134}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGaiLob.y, lobby.qGai_flow) annotation (Line(
      points={{21,130},{30,130},{30,114},{39,114}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGaiNorBed.y, northBedroom.qGai_flow) annotation (Line(
      points={{121,110},{130,110},{130,94},{139,94}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGaiCor.y, corridor.qGai_flow) annotation (Line(
      points={{41,30},{52,30},{52,14},{59,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGaiBat.y, bathroom.qGai_flow) annotation (Line(
      points={{101,30},{110,30},{110,-6},{119,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGaiLivRoo.y, livingRoom.qGai_flow) annotation (Line(
      points={{-19,-90},{-10,-90},{-10,-106},{-1,-106}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(intGaiSouBed.y, southBedroom.qGai_flow) annotation (Line(
      points={{121,-110},{132,-110},{132,-126},{139,-126}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHea.y[1], TairBou[1].T) annotation (Line(
      points={{-199,150},{-182,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHea.y[2], TairBou[2].T) annotation (Line(
      points={{-199,150},{-182,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHea.y[3], TairBou[3].T) annotation (Line(
      points={{-199,150},{-182,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TairBou.port, port_a) annotation (Line(
      points={{-160,150},{-130,150}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(venLivRoo.ports[1], livingRoom.ports[3]) annotation (Line(
      points={{-140,-150},{-130,-150},{-130,-116},{2.5,-116}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(venSouBed.ports[1], southBedroom.ports[2]) annotation (Line(
      points={{-100,-170},{136,-170},{136,-135.5},{142.5,-135.5}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(venBat.ports[1], bathroom.ports[2]) annotation (Line(
      points={{-100,-210},{92,-210},{92,-15.8},{122.5,-15.8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bouVenHea.y[4], venLivRoo.T_in) annotation (Line(
      points={{-199,150},{-190,150},{-190,-146},{-162,-146}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHea.y[5], venSouBed.T_in) annotation (Line(
      points={{-199,150},{-190,150},{-190,-166},{-122,-166}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHea.y[5], venBat.T_in) annotation (Line(
      points={{-199,150},{-190,150},{-190,-206},{-122,-206}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHea.y[6], venLivRoo.m_flow_in) annotation (Line(
      points={{-199,150},{-190,150},{-190,-142},{-160,-142}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(bouVenHea.y[7], divOutVen.u1) annotation (Line(
      points={{-199,150},{-190,150},{-190,-184},{-162,-184}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(divOutVen.y, venSouBed.m_flow_in) annotation (Line(
      points={{-139,-190},{-130,-190},{-130,-162},{-120,-162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(divOutVen.y, venBat.m_flow_in) annotation (Line(
      points={{-139,-190},{-130,-190},{-130,-202},{-120,-202}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, divOutVen.u2) annotation (Line(
      points={{-199,-210},{-180,-210},{-180,-196},{-162,-196}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(kitchen.ports[2], DooKitLiv.port_a1) annotation (Line(
      points={{-57.5,125},{-60,125},{-60,36},{-40,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(kitchen.ports[3], DooKitLiv.port_b2) annotation (Line(
      points={{-57.5,126.333},{-60,126.333},{-60,24},{-40,24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DooKitLiv.port_b1, livingRoom.ports[4]) annotation (Line(
      points={{-20,36},{0,36},{0,-114},{2,-114},{2,-114},{2,-115.6},{2.5,-115.6}},

      color={0,127,255},
      smooth=Smooth.None));
  connect(DooKitLiv.port_a2, livingRoom.ports[5]) annotation (Line(
      points={{-20,24},{0,24},{0,-115.2},{2.5,-115.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[1], DooCorLiv.port_b1) annotation (Line(
      points={{62.5,3.25},{54,3.25},{54,-64},{40,-64}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[2], DooCorLiv.port_a2) annotation (Line(
      points={{62.5,3.75},{54,3.75},{54,-76},{40,-76}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(livingRoom.ports[6], DooCorLiv.port_a1) annotation (Line(
      points={{2.5,-114.8},{-6,-114.8},{-6,-64},{20,-64}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(livingRoom.ports[7], DooCorLiv.port_b2) annotation (Line(
      points={{2.5,-114.4},{-6,-114.4},{-6,-76},{20,-76}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DooNthCor.port_b1, northBedroom.ports[2]) annotation (Line(
      points={{130,68},{140,68},{140,85},{142.5,85}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DooNthCor.port_a2, northBedroom.ports[3]) annotation (Line(
      points={{130,56},{140,56},{140,86.3333},{142.5,86.3333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[3], DooNthCor.port_a1) annotation (Line(
      points={{62.5,4.25},{104,4.25},{104,68},{110,68}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[4], DooNthCor.port_b2) annotation (Line(
      points={{62.5,4.75},{84,4.75},{84,6},{104,6},{104,56},{110,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DooBatCor.port_b1, bathroom.ports[3]) annotation (Line(
      points={{102,-32},{110,-32},{110,-15},{122.5,-15}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DooBatCor.port_a2, bathroom.ports[4]) annotation (Line(
      points={{102,-44},{110,-44},{110,-14.2},{122.5,-14.2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[5], DooBatCor.port_a1) annotation (Line(
      points={{62.5,5.25},{62.5,-32},{82,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[6], DooBatCor.port_b2) annotation (Line(
      points={{62.5,5.75},{62.5,-44},{82,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(southBedroom.ports[3], DooSthBedCor.port_b1) annotation (Line(
      points={{142.5,-134.5},{142.5,-70},{120,-70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(southBedroom.ports[4], DooSthBedCor.port_a2) annotation (Line(
      points={{142.5,-133.5},{142.5,-82},{120,-82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[7], DooSthBedCor.port_a1) annotation (Line(
      points={{62.5,6.25},{62.5,-70},{100,-70}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(corridor.ports[8], DooSthBedCor.port_b2) annotation (Line(
      points={{62.5,6.75},{62.5,-82},{100,-82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(livingRoom.ports[8], DooLobLiv.port_a1) annotation (Line(
      points={{2.5,-114},{-60,-114},{-60,-54},{-40,-54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(livingRoom.ports[9], DooLobLiv.port_b2) annotation (Line(
      points={{2.5,-113.6},{-60,-113.6},{-60,-66},{-40,-66}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DooLobLiv.port_b1, lobby.ports[2]) annotation (Line(
      points={{-20,-54},{10,-54},{10,105},{42.5,105}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(DooLobLiv.port_a2, lobby.ports[3]) annotation (Line(
      points={{-20,-66},{10,-66},{10,106.333},{42.5,106.333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(heaCoolSch.port_bCon, livingRoom.heaPorAir) annotation (Line(
      points={{-160,-108.333},{-140,-108.333},{-140,-108},{-120,-108},{-120,
          -110},{9.5,-110}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCoolSch.port_bRad, livingRoom.heaPorRad) annotation (Line(
      points={{-160,-111.667},{-76,-111.667},{-76,-111.9},{9.5,-111.9}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,
            -220},{220,220}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-220,-220},{220,220}}), graphics={Text(
          extent={{-160,180},{160,160}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
end N2HouseModel;
