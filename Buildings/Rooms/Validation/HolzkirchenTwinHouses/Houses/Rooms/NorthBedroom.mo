within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model NorthBedroom
  "Model of the North Bedroom (Schladen - referred as bedroom) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Angle HolzkirchenLat = 47.874
    "Latitude of the buildings in Holzkirchen site";
  parameter Modelica.SIunits.Height hRooGroundFloor = 2.495
    "Height of the ground floor";
  parameter Modelica.SIunits.Area AFloor "Area of the floor";
  parameter Modelica.SIunits.Length ExtWallNorthLgth
    "Length of the external wall on the North";
  parameter Modelica.SIunits.Length ExtWallEastLgth
    "Length of the external wall on the East";
  parameter Modelica.SIunits.Length IntWallOnBathroomLgth
    "Length of the wall between North bedroom and bathroom";
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth
    "Length of the wall between North bedroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth
    "Length of the door between North bedroom and corridor";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth
    "Length of the wall between North bedroom and living room";
  parameter Modelica.SIunits.Length IntWallOnLobbyLgth
    "Length of the wall between North bedroom and lobby";

  extends MixedAir(
    lat=HolzkirchenLat,
    AFlo=AFloor,
    hRoo=hRooGroundFloor,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=2,
    nSurBou=5,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallENBedroom},
    A = {hRooGroundFloor*ExtWallEastLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.E},
    steadyStateInitial = {true}),
    datConExtWin(
    layers = {extWallSNNBedroom},
    A = {hRooGroundFloor*ExtWallNorthLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.N},
    steadyStateInitial = {true, true, true},
    glaSys = {windowNBedroom},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.16}),
    sidFin(h = {0}, gap = {0}, dep = {0.16})),
    datConBou(
    layers = {ceilingNBedroom, groundNBedroom},
    A = {AFloor, AFloor},
    til = {Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true}),
    surBou(
    A = {hRooGroundFloor*IntWallOnBathroomLgth, hRooGroundFloor*IntWallOnCorridorLgth, hRooGroundFloor*DoorOnCorridorLgth, hRooGroundFloor*IntWallOnLivRoomLgth, hRooGroundFloor*IntWallOnLobbyLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    each absIR = 0.9,
    each absSol = 0.9));

  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNNBedroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtWallE extWallENBedroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingNBedroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundNBedroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.GlazingSystems.Window windowNBedroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{338,-200},{358,-180}})));
end NorthBedroom;
