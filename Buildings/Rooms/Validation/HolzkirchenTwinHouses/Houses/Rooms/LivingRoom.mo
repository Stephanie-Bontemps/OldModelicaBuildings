within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model LivingRoom "Model of the Living Room (Wohnen) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Angle HolzkirchenLat = 47.874
    "Latitude of the buildings in Holzkirchen site";
  parameter Modelica.SIunits.Height hRooGroundFloor = 2.495
    "Height of the ground floor";
  parameter Modelica.SIunits.Area AFloor "Area of the floor";
  parameter Modelica.SIunits.Length IntWallOnKitchenLgth
    "Length of the wall between living room and kitchen";
  parameter Modelica.SIunits.Length DoorOnKitchenLgth
    "Length of the door between living room and kitchen";
  parameter Modelica.SIunits.Length IntWallOnLobbyLgth
    "Length of the wall between living room and lobby";
  parameter Modelica.SIunits.Length DoorOnLobbyLgth
    "Length of the door between living room and lobby";
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth
    "Length of the wall between living room and North bedroom";
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth
    "Length of the wall between living room and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth
    "Length of the door between living room and corridor";
  parameter Modelica.SIunits.Length IntWallOnSBedroomLgth
    "Length of the wall between living room and South bedroom";
  parameter Modelica.SIunits.Length ExtWallSouthWin3Lgth
    "Length of the external wall on the South under window 3";
  parameter Modelica.SIunits.Length ExtWallSouthWin2Lgth
    "Length of the external wall on the South with window 2";
  parameter Modelica.SIunits.Length ExtWallSouthWestLgth
    "Length of the external wall on the South West";
  parameter Modelica.SIunits.Length ExtWallNorthWestLgth
    "Length of the external wall on the North West";

  extends MixedAir(
    lat=HolzkirchenLat,
    AFlo=AFloor,
    hRoo=hRooGroundFloor,
    nConExt=1,
    nConExtWin=3,
    nConPar=0,
    nConBou=10,
    nSurBou=0,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallWSLivingRoom},
    A = {hRooGroundFloor*ExtWallSouthWestLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.W},
    steadyStateInitial = {true}),
    datConExtWin(
    layers = {extWallSNUnderWindow3_1, extWallSNLivingRoom, extWallWNLivingRoom},
    A = {hRooGroundFloor*ExtWallSouthWin3Lgth, hRooGroundFloor*ExtWallSouthWin2Lgth, hRooGroundFloor*ExtWallNorthWestLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.S, Buildings.HeatTransfer.Types.Azimuth.S, Buildings.HeatTransfer.Types.Azimuth.W},
    steadyStateInitial = {true, true, true},
    glaSys = {windowLivingRoom, windowLivingRoom, windowLivingRoom},
    hWin = {1.54, 2.37, 1.54},
    wWin = {3.34, 1.11, 1.23},
    fFra = {0.2004, 0.3004, 0.3175},
    ove(wL = {0, 0, 0}, wR = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.16}),
    sidFin(h = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.16})),
    datConBou(
    layers = {intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, ceilingLivingRoom, groundLivingRoom},
    A = {hRooGroundFloor*IntWallOnKitchenLgth, hRooGroundFloor*DoorOnKitchenLgth, hRooGroundFloor*IntWallOnLobbyLgth, hRooGroundFloor*DoorOnLobbyLgth, hRooGroundFloor*IntWallOnNBedroomLgth, hRooGroundFloor*IntWallOnCorridorLgth, hRooGroundFloor*DoorOnCorridorLgth, hRooGroundFloor*IntWallOnSBedroomLgth, AFloor, AFloor},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true, true, true, true, true, true, true, true}));

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
  Data.OpaqueConstructions.Constructions.ExtWallSNUnderWindow3 extWallSNUnderWindow3_1
    annotation (Placement(transformation(extent={{420,-80},{440,-60}})));
  Data.OpaqueConstructions.Constructions.ExtWallWS extWallWSLivingRoom
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNLivingRoom
    annotation (Placement(transformation(extent={{380,-80},{400,-60}})));
  Data.GlazingSystems.Window windowLivingRoom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end LivingRoom;
