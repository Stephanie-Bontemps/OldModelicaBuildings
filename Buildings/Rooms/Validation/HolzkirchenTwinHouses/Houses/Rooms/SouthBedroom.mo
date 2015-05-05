within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model SouthBedroom
  "Model of the South Bedroom (Schlafen - also referred as children's bedroom) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth = 0.685
    "Length of the wall between South bedroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth = 0.935
    "Length of the door between South bedroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorHght = 1.98
    "Height of the door between South bedroom and corridor";
  parameter Modelica.SIunits.Length IntWallOnBathroomLgth = 2.07
    "Length of the wall between South bedroom and bathroom";
  parameter Modelica.SIunits.Length ExtWallEastLgth = 2.89
    "Length of the external wall on the East";
  parameter Modelica.SIunits.Length ExtWallSouthLgth = 3.83
    "Length of the external wall on the South";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth = ExtWallEastLgth
    "Length of the wall between South bedroom and living room";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

  extends MixedAir(
    AFlo=ExtWallEastLgth*ExtWallSouthLgth,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=5,
    nSurBou=1,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = 0.23)),
    bouConExtWin(HDifTil(each rho = 0.23)),
    datConExt(
    layers = {extWallESBedroom},
    A = {hRoo*ExtWallEastLgth},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallSNSBedroom},
    A = {hRoo*ExtWallSouthLgth},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int},
    glaSys = {windowSBedroom},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.16}),
    sidFin(h = {0}, gap = {0}, dep = {0.16})),
    datConBou(
    layers = {intWall2SBedroom, intDoorOpaquePartSBedroom, intWall2SBedroom, intWall2SBedroom, ceilingSBedroom, groundSBedroom},
    A = {(hRoo*IntWallOnCorridorLgth+(hRoo-DoorOnCorridorHght)*DoorOnCorridorLgth), DoorOnCorridorHght*DoorOnCorridorLgth, hRoo*IntWallOnBathroomLgth, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {hRoo*IntWallOnLivRoomLgth},
    til = {Buildings.Types.Tilt.Wall},
    absIR = {0.9},
    absSol = {0.17}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNSBedroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtWallE extWallESBedroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.IntWall2 intWall2SBedroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartSBedroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingSBedroom
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.OpaqueConstructions.Constructions.Ground groundSBedroom
    annotation (Placement(transformation(extent={{380,-120},{400,-100}})));
  Data.GlazingSystems.Window windowSBedroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end SouthBedroom;
