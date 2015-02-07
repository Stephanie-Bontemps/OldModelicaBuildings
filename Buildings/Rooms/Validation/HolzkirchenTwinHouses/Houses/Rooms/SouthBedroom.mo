within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model SouthBedroom
  "Model of the South Bedroom (Schlafen - also referred as children's bedroom) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth = 0.685
    "Length of the wall between South bedroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth = 0.935
    "Length of the door between South bedroom and corridor";
  parameter Modelica.SIunits.Length IntWallOnBathroomLgth = 2.07
    "Length of the wall between South bedroom and bathroom";
  parameter Modelica.SIunits.Length ExtWallEastLgth = 2.89
    "Length of the external wall on the East";
  parameter Modelica.SIunits.Length ExtWallSouthLgth = 3.83
    "Length of the external wall on the South";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth = 2.89
    "Length of the wall between South bedroom and living room";

  extends MixedAir(
    lat=47.874,
    hRoo=2.495,
    AFlo=11.0687,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=5,
    nSurBou=1,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallESBedroom},
    A = {hRoo*ExtWallEastLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.E},
    steadyStateInitial = {true}),
    datConExtWin(
    layers = {extWallSNSBedroom},
    A = {hRoo*ExtWallSouthLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.S},
    steadyStateInitial = {true},
    glaSys = {windowSBedroom},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.16}),
    sidFin(h = {0}, gap = {0}, dep = {0.16})),
    datConBou(
    layers = {intWall2SBedroom, intDoorOpaquePartSBedroom, intWall2SBedroom, intWall2SBedroom, ceilingSBedroom, groundSBedroom},
    A = {hRoo*IntWallOnCorridorLgth, hRoo*DoorOnCorridorLgth, hRoo*IntWallOnBathroomLgth, AFlo, AFlo},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true, true, true}),
    surBou(
    A = {hRoo*IntWallOnLivRoomLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    each absIR = 0.9,
    each absSol = 0.9));

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
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end SouthBedroom;
