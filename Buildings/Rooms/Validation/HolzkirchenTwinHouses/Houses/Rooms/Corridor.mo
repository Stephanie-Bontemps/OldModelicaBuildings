within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Corridor
  "Model of the Corridor (Flur - Centre of house) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth = 0.685
    "Length of the wall between corridor and North bedroom";
  parameter Modelica.SIunits.Length DoorOnNBedroomLgth = 0.935
    "Length of the door between corridor and North bedroom";
  parameter Modelica.SIunits.Length DoorOnNBedroomHght = 1.98
    "Height of the door between corridor and North bedroom";
  parameter Modelica.SIunits.Length IntWallOnBathroomLgth = 2.055
    "Length of the wall between corridor and bathroom";
  parameter Modelica.SIunits.Length DoorOnBathroomLgth = 0.935
    "Length of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length DoorOnBathroomHght = 1.98
    "Height of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length IntWallOnSBedroomLgth = 0.685
    "Length of the wall between corridor and South bedroom";
  parameter Modelica.SIunits.Length DoorOnSBedroomLgth = 0.935
    "Length of the door between corridor and South bedroom";
  parameter Modelica.SIunits.Length DoorOnSBedroomHght = 1.98
    "Height of the door between corridor and South bedroom";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth = 2.055
    "Length of the wall between corridor and living room";
  parameter Modelica.SIunits.Length DoorOnLivRoomLgth = 0.935
    "Length of the door between corridor and living room";
  parameter Modelica.SIunits.Length DoorOnLivRoomHght = 1.98
    "Height of the door between corridor and living room";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

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
    A = {(hRoo*IntWallOnNBedroomLgth+(hRoo-DoorOnNBedroomHght)*DoorOnNBedroomLgth), DoorOnNBedroomHght*DoorOnNBedroomLgth, (hRoo*IntWallOnBathroomLgth+(hRoo-DoorOnBathroomHght)*DoorOnBathroomLgth), DoorOnBathroomHght*DoorOnBathroomLgth, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false, false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*IntWallOnSBedroomLgth+(hRoo-DoorOnSBedroomHght)*DoorOnSBedroomLgth), DoorOnSBedroomHght*DoorOnSBedroomLgth, (hRoo*IntWallOnLivRoomLgth+(hRoo-DoorOnLivRoomHght)*DoorOnLivRoomLgth), DoorOnLivRoomHght*DoorOnLivRoomLgth},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6, 0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

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
