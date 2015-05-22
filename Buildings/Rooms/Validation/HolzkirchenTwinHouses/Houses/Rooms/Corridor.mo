within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Corridor
  "Model of the corridor (flur - Centre of house) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length lIntWalOnNorBed = 0.685
    "Length of the wall between corridor and north bedroom";
  parameter Modelica.SIunits.Length lDooOnNorBed = 0.935
    "Length of the door between corridor and north bedroom";
  parameter Modelica.SIunits.Length hDooOnNorBed = 1.98
    "Height of the door between corridor and north bedroom";
  parameter Modelica.SIunits.Length lIntWallOnBat = 2.055
    "Length of the wall between corridor and bathroom";
  parameter Modelica.SIunits.Length lDooOnBat = lDooOnNorBed
    "Length of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length hDooOnBat = hDooOnNorBed
    "Height of the door between corridor and bathroom";
  parameter Modelica.SIunits.Length lIntWalOnSouBed = lIntWalOnNorBed
    "Length of the wall between corridor and south bedroom";
  parameter Modelica.SIunits.Length lDooOnSouBed = lDooOnNorBed
    "Length of the door between corridor and south bedroom";
  parameter Modelica.SIunits.Length hDooOnSouBed = hDooOnNorBed
    "Height of the door between corridor and south bedroom";
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = lIntWallOnBat
    "Length of the wall between corridor and living room";
  parameter Modelica.SIunits.Length lDooOnLivRoo = lDooOnNorBed
    "Length of the door between corridor and living room";
  parameter Modelica.SIunits.Length hDooOnLivRoo = hDooOnNorBed
    "Height of the door between corridor and living room";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";

  extends Buildings.Rooms.MixedAir(
    AFlo=(lIntWalOnNorBed + lDooOnNorBed) * (lIntWallOnBat + lDooOnBat),
    nConExt=0,
    nConExtWin=0,
    nConPar=0,
    nConBou=6,
    nSurBou=4,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConBou(
    layers = {intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, intWall1Corridor, intDoorOpaquePartCorridor, intWall1Corridor, ceilingCorridor, groundCorridor},
    A = {(hRoo*lIntWalOnNorBed+(hRoo-hDooOnNorBed)*lDooOnNorBed), hDooOnNorBed*lDooOnNorBed, (hRoo*lIntWallOnBat+(hRoo-hDooOnBat)*lDooOnBat), hDooOnBat*lDooOnBat, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false, false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*lIntWalOnSouBed+(hRoo-hDooOnSouBed)*lDooOnSouBed), hDooOnSouBed*lDooOnSouBed, (hRoo*lIntWalOnLivRoo+(hRoo-hDooOnLivRoo)*lDooOnLivRoo), hDooOnLivRoo*lDooOnLivRoo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6, 0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntWall1
                                                                                                        intWall1Corridor
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntWall2
                                                                                                        intWall2Corridor
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartCorridor
    annotation (Placement(transformation(extent={{418,-160},{438,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                                                                        ceilingCorridor
    annotation (Placement(transformation(extent={{378,-158},{398,-138}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ground
                                                                                                        groundCorridor
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
end Corridor;
