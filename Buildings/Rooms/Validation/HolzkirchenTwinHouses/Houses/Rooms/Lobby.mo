within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Lobby
  "Model of the Lobby (Flur on North side of building) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Angle HolzkirchenLat = 47.874
    "Latitude of the buildings in Holzkirchen site";
  parameter Modelica.SIunits.Height hRooGroundFloor = 2.495
    "Height of the ground floor";
  parameter Modelica.SIunits.Area AFloor "Area of the floor";
  parameter Modelica.SIunits.Length ExtWallNorthLgth
    "Length of the external wall on the North";
  parameter Modelica.SIunits.Length ExtDoorNorthLgth
    "Length of the external door on the North";
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth
    "Length of the wall between lobby and North Bedroom";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth
    "Length of the wall between lobby and living room";
  parameter Modelica.SIunits.Length DoorOnLivRoomLgth
    "Length of the door between lobby and living room";
  parameter Modelica.SIunits.Length IntWallOnKithenLgth
    "Length of the wall between lobby and kitchen";

  extends MixedAir(
    lat=HolzkirchenLat,
    AFlo=AFloor,
    hRoo=hRooGroundFloor,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=3,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallSNLobby},
    A = {hRooGroundFloor*ExtWallNorthLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.N},
    steadyStateInitial = {true}),
    datConExtWin(
    layers = {extDoorOpaquePartLobby},
    A = {hRooGroundFloor*ExtDoorNorthLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.N},
    steadyStateInitial = {true},
    glaSys = {windowLobby},
    hWin = {0.535},
    wWin = {0.595},
    fFra = {0},
    ove(wL = {0.20}, wR = {0.20}, gap = {0.20}, dep = {0.16}),
    sidFin(h = {0.20}, gap = {0.20}, dep = {0.16})),
    datConBou(
    layers = {intWall1Lobby, ceilingLobby, groundLobby},
    A = {hRooGroundFloor*IntWallOnNBedroomLgth, AFloor, AFloor},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true}),
    surBou(
    A = {hRooGroundFloor*IntWallOnLivRoomLgth, hRooGroundFloor*DoorOnLivRoomLgth, hRooGroundFloor*IntWallOnKithenLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    each absIR = 0.9,
    each absSol = 0.9));

  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNLobby
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtDoorOpaquePart
    extDoorOpaquePartLobby
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingLobby
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundLobby
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.OpaqueConstructions.Constructions.IntWall1 intWall1Lobby
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.GlazingSystems.Window windowLobby
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Lobby;
