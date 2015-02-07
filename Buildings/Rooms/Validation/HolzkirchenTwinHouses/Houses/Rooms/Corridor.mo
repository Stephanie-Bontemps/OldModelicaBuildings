within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Corridor
  "Model of the Corridor (Flur - Centre of house) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth = 0.685
    "Length of the wall between corridor and North bedroom";
  parameter Modelica.SIunits.Length DoorOnNBedroomLgth = 0.935
    "Length of the door between corridor and North bedroom";
  parameter Modelica.SIunits.Length IntWallOnBathroomLgth = 2.055
    "Length of the wall between corridor and bathroom";
  parameter Modelica.SIunits.Length DoorOnBathroomLgth = 0.935
    "Length of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length IntWallOnSBedroomLgth = 0.685
    "Length of the wall between corridor and South bedroom";
  parameter Modelica.SIunits.Length DoorOnSBedroomLgth = 0.935
    "Length of the door between corridor and South bedroom";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth = 2.055
    "Length of the wall between corridor and living room";
  parameter Modelica.SIunits.Length DoorOnLivRoomLgth = 0.935
    "Length of the door between corridor and living room";

  extends MixedAir(
    lat=47.874,
    hRoo=2.495,
    AFlo=4.8438,
    nConExt=0,
    nConExtWin=0,
    nConPar=0,
    nConBou=6,
    nSurBou=4,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConBou(
    layers = {intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, ceilingCorridor, groundCorridor},
    A = {hRoo*IntWallOnNBedroomLgth, hRoo*DoorOnNBedroomLgth, hRoo*IntWallOnBathroomLgth, hRoo*DoorOnBathroomLgth, AFlo, AFlo},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true, true, true, true}),
    surBou(
    A = {hRoo*IntWallOnSBedroomLgth, hRoo*DoorOnSBedroomLgth, hRoo*IntWallOnLivRoomLgth, hRoo*DoorOnLivRoomLgth},
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
