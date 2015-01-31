within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Corridor
  "Model of the Corridor (Flur - Centre of house) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Angle HolzkirchenLat = 47.874
    "Latitude of the buildings in Holzkirchen site";
  parameter Modelica.SIunits.Height hRooGroundFloor = 2.495
    "Height of the ground floor";
  parameter Modelica.SIunits.Area AFloor "Area of the floor";
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth
    "Length of the wall between corridor and North bedroom";
  parameter Modelica.SIunits.Length DoorOnNBedroomLgth
    "Length of the door between corridor and North bedroom";
  parameter Modelica.SIunits.Length IntWallOnBathroomLgth
    "Length of the wall between corridor and bathroom";
  parameter Modelica.SIunits.Length DoorOnBathroomLgth
    "Length of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length IntWallOnSBedroomLgth
    "Length of the wall between corridor and South bedroom";
  parameter Modelica.SIunits.Length DoorOnSBedroomLgth
    "Length of the door between corridor and South bedroom";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth
    "Length of the wall between corridor and living room";
  parameter Modelica.SIunits.Length DoorOnLivRoomLgth
    "Length of the door between corridor and living room";

  extends MixedAir(
    lat=HolzkirchenLat,
    AFlo=AFloor,
    hRoo=hRooGroundFloor,
    nConExt=0,
    nConExtWin=0,
    nConPar=0,
    nConBou=6,
    nSurBou=4,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConBou(
    layers = {intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, ceilingCorridor, groundCorridor},
    A = {hRooGroundFloor*IntWallOnNBedroomLgth, hRooGroundFloor*DoorOnNBedroomLgth, hRooGroundFloor*IntWallOnBathroomLgth, hRooGroundFloor*DoorOnBathroomLgth, AFloor, AFloor},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true, true, true, true}),
    surBou(
    A = {hRooGroundFloor*IntWallOnSBedroomLgth, hRooGroundFloor*DoorOnSBedroomLgth, hRooGroundFloor*IntWallOnLivRoomLgth, hRooGroundFloor*DoorOnLivRoomLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    each absIR = 0.9,
    each absSol = 0.9));

  Data.OpaqueConstructions.Constructions.IntWall1 intWall1Corridor
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.IntWall2 intWall2Corridor
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartCorridor
    annotation (Placement(transformation(extent={{418,-160},{438,-140}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingCorridor
    annotation (Placement(transformation(extent={{378,-158},{398,-138}})));
  Data.OpaqueConstructions.Constructions.Ground groundCorridor
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
end Corridor;
