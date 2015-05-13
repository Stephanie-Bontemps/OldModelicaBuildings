within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Lobby
  "Model of the Lobby (Flur on North side of building) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length extWallNorthLgth = 1.255
    "Length of the external wall on the North";
  parameter Modelica.SIunits.Length extDoorNorthLgth = 0.995
    "Length of the external door on the North";
  parameter Modelica.SIunits.Length extDoorNorthHght = 2.025
    "Height of the external door on the North";
  parameter Modelica.SIunits.Length intWallOnNBedroomLgth = 2.61
    "Length of the wall between lobby and North Bedroom";
  parameter Modelica.SIunits.Length doorOnLivRoomLgth = 0.935
    "Length of the door between lobby and living room";
  parameter Modelica.SIunits.Length doorOnLivRoomHght = 1.98
    "Height of the door between lobby and living room";
  parameter Modelica.SIunits.Length intWallOnLivRoomLgth = (extWallNorthLgth + extDoorNorthLgth) - doorOnLivRoomLgth
    "Length of the wall between lobby and living room";
  parameter Modelica.SIunits.Length intWallOnKitchenLgth = intWallOnNBedroomLgth
    "Length of the wall between lobby and kitchen";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

  extends MixedAir(
    AFlo=(extWallNorthLgth + extDoorNorthLgth) * intWallOnNBedroomLgth,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=3,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = 0.23)),
    bouConExtWin(HDifTil(each rho = 0.23)),
    datConExt(
    layers = {extWallSNLobby},
    A = {(hRoo*extWallNorthLgth + (hRoo-extDoorNorthHght)*extDoorNorthLgth)},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extDoorOpaquePartLobby},
    A = {extDoorNorthHght*extDoorNorthLgth},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    steadyStateInitial = {false},
    glaSys = {windowLobby},
    hWin = {0.535},
    wWin = {0.585},
    fFra = {0.01},
    ove(wL = {0.20}, wR = {0.20}, gap = {0.20}, dep = {0.37}),
    sidFin(h = {0.20}, gap = {0.20}, dep = {0.37}),
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConBou(
    layers = {intWall1Lobby, ceilingLobby, groundLobby},
    A = {hRoo*intWallOnNBedroomLgth, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*intWallOnLivRoomLgth + (hRoo-doorOnLivRoomHght)*doorOnLivRoomLgth), doorOnLivRoomHght*doorOnLivRoomLgth, hRoo*intWallOnKitchenLgth},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6, 0.17}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNLobby
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtDoorOpaquePart
    extDoorOpaquePartLobby
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingLobby
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundLobby
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.OpaqueConstructions.Constructions.IntWall1 intWall1Lobby
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.GlazingSystems.Window windowLobby
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Lobby;
