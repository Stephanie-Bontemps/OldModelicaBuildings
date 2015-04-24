within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Bathroom "Model of the Bathroom (Bad WC) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth = 2.07
    "Length of the wall between bathroom and North bedroom";
  parameter Modelica.SIunits.Length ExtWallEastLgth = 2.99
    "Length of the external wall on the East";
  parameter Modelica.SIunits.Length IntWallOnSBedroomLgth = 2.07
    "Length of the wall between bathroom and South bedroom";
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth = 2.055
    "Length of the wall between bathroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth = 0.935
    "Length of the door between bathroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorHght = 1.98
    "Height of the door between bathroom and corridor";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

  extends MixedAir(
    lat=47.874,
    hRoo=2.495,
    AFlo=6.1893,
    nConExt=0,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=3,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExtWin(
    layers = {extWallEBathroom},
    A = {hRoo*ExtWallEastLgth},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int},
    glaSys = {windowBathroom},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.12}),
    sidFin(h = {0}, gap = {0}, dep = {0.12})),
    datConBou(
    layers = {intWall2Bathroom, ceilingBathroom, groundBathroom},
    A = {hRoo*IntWallOnNBedroomLgth, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {hRoo*IntWallOnSBedroomLgth, (hRoo*IntWallOnCorridorLgth+(hRoo-DoorOnCorridorHght)*DoorOnCorridorLgth), DoorOnCorridorHght*DoorOnCorridorLgth},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Data.OpaqueConstructions.Constructions.IntWall2 intWall2Bathroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtWallE extWallEBathroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingBathroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundBathroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.GlazingSystems.Window windowBathroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Bathroom;
