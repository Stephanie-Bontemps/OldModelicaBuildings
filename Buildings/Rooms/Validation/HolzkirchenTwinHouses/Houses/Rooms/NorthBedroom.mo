within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model NorthBedroom
  "Model of the North Bedroom (Schladen - referred as bedroom) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length ExtWallNorthLgth = 3.83
    "Length of the external wall on the North";
  parameter Modelica.SIunits.Length ExtWallEastLgth = 3.18
    "Length of the external wall on the East";
  parameter Modelica.SIunits.Length IntWallOnBathroomLgth = 2.07
    "Length of the wall between North bedroom and bathroom";
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth = 0.685
    "Length of the wall between North bedroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth = 0.935
    "Length of the door between North bedroom and corridor";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth = 0.30
    "Length of the wall between North bedroom and living room";
  parameter Modelica.SIunits.Length IntWallOnLobbyLgth = 2.61
    "Length of the wall between North bedroom and lobby";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

  extends MixedAir(
    lat=47.874,
    hRoo=2.495,
    AFlo = 12.1794,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=2,
    nSurBou=5,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallENBedroom},
    A = {hRoo*ExtWallEastLgth},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallSNNBedroom},
    A = {hRoo*ExtWallNorthLgth},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    steadyStateInitial = {false, false, false},
    each T_a_start=Tini_ext,
    each T_b_start=Tini_int,
    glaSys = {windowNBedroom},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.16}),
    sidFin(h = {0}, gap = {0}, dep = {0.16})),
    datConBou(
    layers = {ceilingNBedroom, groundNBedroom},
    A = {AFlo, AFlo},
    til = {Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {hRoo*IntWallOnBathroomLgth, hRoo*IntWallOnCorridorLgth, hRoo*DoorOnCorridorLgth, hRoo*IntWallOnLivRoomLgth, hRoo*IntWallOnLobbyLgth},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.17, 0.6, 0.17, 0.17}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNNBedroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtWallE extWallENBedroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingNBedroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundNBedroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.GlazingSystems.Window windowNBedroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{338,-200},{358,-180}})));
end NorthBedroom;
