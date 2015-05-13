within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model LivingRoom "Model of the Living Room (Wohnen) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length intWallOnKitchenLgth = 1.915
    "Length of the wall between living room and kitchen";
  parameter Modelica.SIunits.Length doorOnKitchenLgth = 0.935
    "Length of the door between living room and kitchen";
  parameter Modelica.SIunits.Length doorOnKitchenHght = 1.98
    "Height of the door between living room and kitchen";
  parameter Modelica.SIunits.Length intWallOnLobbyLgth = 1.315
    "Length of the wall between living room and lobby";
  parameter Modelica.SIunits.Length doorOnLobbyLgth = doorOnKitchenLgth
    "Length of the door between living room and lobby";
  parameter Modelica.SIunits.Length doorOnLobbyHght = doorOnKitchenHght
    "Height of the door between living room and lobby";
  parameter Modelica.SIunits.Length intWallOnNBedroomLgth = 0.30
    "Length of the wall between living room and North bedroom";
  parameter Modelica.SIunits.Length intWallOnCorridorLgth = 2.055
    "Length of the wall between living room and corridor";
  parameter Modelica.SIunits.Length doorOnCorridorLgth = doorOnKitchenLgth
    "Length of the door between living room and corridor";
  parameter Modelica.SIunits.Length doorOnCorridorHght = doorOnKitchenHght
    "Height of the door between living room and corridor";
  parameter Modelica.SIunits.Length intWallOnSBedroomLgth = 2.89
    "Length of the wall between living room and South bedroom";
  parameter Modelica.SIunits.Area extWallSouthUnderWin3Area = 2.7722
    "Area of the external wall on the South under window 3";
  parameter Modelica.SIunits.Area extWallSouthWin3Area = 7.53215
    "Area of the external wall on the South with window 3 but without the wall under";
  parameter Modelica.SIunits.Area extWallSouthWin2Area = 2.76945
    "Area of the external wall on the South with window 2";
  parameter Modelica.SIunits.Length extWallSouthLgth = (extWallSouthUnderWin3Area + extWallSouthWin3Area + extWallSouthWin2Area)/hRoo
    "Length of the external wall on the South";
  parameter Modelica.SIunits.Length extWallSouthWestLgth = 4.67
    "Length of the external wall on the South West";
  parameter Modelica.SIunits.Length extWallNorthWestLgth = 1.79
    "Length of the external wall on the North West";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

  extends MixedAir(
    AFlo=extWallSouthLgth*(extWallSouthWestLgth+extWallNorthWestLgth),
    nConExt=2,
    nConExtWin=3,
    nConPar=0,
    nConBou=10,
    nSurBou=0,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = 0.23)),
    bouConExtWin(HDifTil(each rho = 0.23)),
    datConExt(
    layers = {extWallSNUnderWindow3_1, extWallWSLivingRoom},
    A = {extWallSouthWin3Area, hRoo*extWallSouthWestLgth},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W},
    steadyStateInitial = {false, false},
    each T_a_start=Tini_ext,
    each T_b_start=Tini_int),
    datConExtWin(
    layers = {extWallSNLivingRoom, extWallSNLivingRoom, extWallWNLivingRoom},
    A = {extWallSouthWin3Area, extWallSouthWin2Area, hRoo*extWallNorthWestLgth},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W},
    steadyStateInitial = {false, false, false},
    each T_a_start=Tini_ext,
    each T_b_start=Tini_int,
    glaSys = {windowLivingRoom, windowLivingRoom, windowLivingRoom},
    hWin = {1.54, 2.37, 1.54},
    wWin = {3.34, 1.11, 1.23},
    fFra = {0.2004, 0.3004, 0.3175},
    ove(wL = {0, 0, 0}, wR = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.12}),
    sidFin(h = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.12})),
    datConBou(
    layers = {intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, ceilingLivingRoom, groundLivingRoom},
    A = {(hRoo*intWallOnKitchenLgth+(hRoo-doorOnKitchenHght)*doorOnKitchenLgth), doorOnKitchenHght*doorOnKitchenLgth, (hRoo*intWallOnLobbyLgth+(hRoo-doorOnLobbyHght)*doorOnLobbyLgth), doorOnLobbyHght*doorOnLobbyLgth, hRoo*intWallOnNBedroomLgth, (hRoo*intWallOnCorridorLgth+(hRoo-doorOnCorridorHght)*doorOnCorridorLgth), doorOnCorridorHght*doorOnCorridorLgth, hRoo*intWallOnSBedroomLgth, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false, false, false, false, false, false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartLivingRoom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.IntWall1 intWall1LivingRoom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingLivingRoom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundLivingRoom
    annotation (Placement(transformation(extent={{382,-160},{402,-140}})));
  Data.OpaqueConstructions.Constructions.ExtWallWN extWallWNLivingRoom
    annotation (Placement(transformation(extent={{380,-120},{400,-100}})));
  Data.OpaqueConstructions.Constructions.ExtWallSNUnderWindow3
    extWallSNUnderWindow3_1
    annotation (Placement(transformation(extent={{420,-80},{440,-60}})));
  Data.OpaqueConstructions.Constructions.ExtWallWS extWallWSLivingRoom
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNLivingRoom
    annotation (Placement(transformation(extent={{380,-80},{400,-60}})));
  Data.GlazingSystems.Window windowLivingRoom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -220},{460,200}}), graphics));
end LivingRoom;
