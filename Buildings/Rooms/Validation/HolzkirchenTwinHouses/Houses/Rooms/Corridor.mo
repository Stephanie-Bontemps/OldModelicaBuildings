within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Corridor
  "Model of the Corridor (Flur - Centre of house) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length intWallOnNBedroomLgth = 0.685
    "Length of the wall between corridor and North bedroom";
  parameter Modelica.SIunits.Length doorOnNBedroomLgth = 0.935
    "Length of the door between corridor and North bedroom";
  parameter Modelica.SIunits.Length doorOnNBedroomHght = 1.98
    "Height of the door between corridor and North bedroom";
  parameter Modelica.SIunits.Length intWallOnBathroomLgth = 2.055
    "Length of the wall between corridor and bathroom";
  parameter Modelica.SIunits.Length doorOnBathroomLgth = doorOnNBedroomLgth
    "Length of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length doorOnBathroomHght = doorOnNBedroomHght
    "Height of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length intWallOnSBedroomLgth = intWallOnNBedroomLgth
    "Length of the wall between corridor and South bedroom";
  parameter Modelica.SIunits.Length doorOnSBedroomLgth = doorOnNBedroomLgth
    "Length of the door between corridor and South bedroom";
  parameter Modelica.SIunits.Length doorOnSBedroomHght = doorOnNBedroomHght
    "Height of the door between corridor and South bedroom";
  parameter Modelica.SIunits.Length intWallOnLivRoomLgth = intWallOnBathroomLgth
    "Length of the wall between corridor and living room";
  parameter Modelica.SIunits.Length doorOnLivRoomLgth = doorOnNBedroomLgth
    "Length of the door between corridor and living room";
  parameter Modelica.SIunits.Length doorOnLivRoomHght = doorOnNBedroomHght
    "Height of the door between corridor and living room";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

  extends MixedAir(
    AFlo=(intWallOnNBedroomLgth + doorOnNBedroomLgth) * (intWallOnBathroomLgth + doorOnBathroomLgth),
    nConExt=0,
    nConExtWin=0,
    nConPar=0,
    nConBou=6,
    nSurBou=4,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConBou(
    layers = {intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, ceilingCorridor, groundCorridor},
    A = {(hRoo*intWallOnNBedroomLgth+(hRoo-doorOnNBedroomHght)*doorOnNBedroomLgth), doorOnNBedroomHght*doorOnNBedroomLgth, (hRoo*intWallOnBathroomLgth+(hRoo-doorOnBathroomHght)*doorOnBathroomLgth), doorOnBathroomHght*doorOnBathroomLgth, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false, false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*intWallOnSBedroomLgth+(hRoo-doorOnSBedroomHght)*doorOnSBedroomLgth), doorOnSBedroomHght*doorOnSBedroomLgth, (hRoo*intWallOnLivRoomLgth+(hRoo-doorOnLivRoomHght)*doorOnLivRoomLgth), doorOnLivRoomHght*doorOnLivRoomLgth},
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
