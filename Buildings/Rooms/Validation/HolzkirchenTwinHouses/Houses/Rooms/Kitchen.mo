within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Kitchen "Model of the Kitchen (Küche) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Angle HolzkirchenLat = 47.874
    "Latitude of the buildings in Holzkirchen site";
  parameter Modelica.SIunits.Height hRooGroundFloor = 2.495
    "Height of the ground floor";
  parameter Modelica.SIunits.Area AFloor "Area of the floor";
  parameter Modelica.SIunits.Length ExtWallNorthLgth
    "Length of the external wall on the North";
  parameter Modelica.SIunits.Length IntWallOnLobbyLgth
    "Length of the wall between kitchen and lobby";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth
    "Length of the wall between kitchen and living room";
  parameter Modelica.SIunits.Length DoorOnLivRoomLgth
    "Length of the door between kitchen and living room";
  parameter Modelica.SIunits.Length ExtWallWestLgth
    "Length of the external wall on the West";

  extends MixedAir(
    lat=HolzkirchenLat,
    AFlo=AFloor,
    hRoo=hRooGroundFloor,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=2,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallSNKitchen},
    A = {hRooGroundFloor*ExtWallNorthLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.N},
    steadyStateInitial = {true}),
    datConExtWin(
    layers = {extWallWNKitchen},
    A = {hRooGroundFloor*ExtWallWestLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.N},
    steadyStateInitial = {true},
    glaSys = {windowKitchen},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.12}),
    sidFin(h = {0}, gap = {0}, dep = {0.12})),
    datConBou(
    layers = {intWall2Kitchen, ceilingKitchen, groundKitchen},
    A = {hRooGroundFloor*IntWallOnLobbyLgth, AFloor, AFloor},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true}),
    surBou(
    A = {hRooGroundFloor*IntWallOnLivRoomLgth, hRooGroundFloor*DoorOnLivRoomLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    each absIR = 0.9,
    each absSol = 0.9));

  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNKitchen
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtWallWN extWallWNKitchen
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.IntWall2 intWall2Kitchen
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingKitchen
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundKitchen
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.GlazingSystems.Window windowKitchen(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Kitchen;
