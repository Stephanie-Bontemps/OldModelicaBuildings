within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Lobby
  "Model of the lobby (flur on north side of building) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length lExtWalNor = 1.255
    "Length of the external wall on the north";
  parameter Modelica.SIunits.Length lExtDooNor = 0.995
    "Length of the external door on the north";
  parameter Modelica.SIunits.Length hExtDooNor = 2.025
    "Height of the external door on the north";
  parameter Modelica.SIunits.Length lIntWalOnNorBed = 2.61
    "Length of the wall between lobby and north Bedroom";
  parameter Modelica.SIunits.Length lDooOnLivRoo = 0.935
    "Length of the door between lobby and living room";
  parameter Modelica.SIunits.Length hDooOnLivRoo = 1.98
    "Height of the door between lobby and living room";
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = (lExtWalNor + lExtDooNor) - lDooOnLivRoo
    "Length of the wall between lobby and living room";
  parameter Modelica.SIunits.Length lIntWalOnKit = lIntWalOnNorBed
    "Length of the wall between lobby and kitchen";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";

  extends Buildings.Rooms.MixedAir(
    AFlo=(lExtWalNor + lExtDooNor) * lIntWalOnNorBed,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=3,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExt(
    layers = {extWallSNLobby},
    A = {(hRoo*lExtWalNor + (hRoo-hExtDooNor)*lExtDooNor)},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extDoorOpaquePartLobby},
    A = {hExtDooNor*lExtDooNor},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    each steadyStateInitial = false,
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
    A = {hRoo*lIntWalOnNorBed, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*lIntWalOnLivRoo + (hRoo-hDooOnLivRoo)*lDooOnLivRoo), hDooOnLivRoo*lDooOnLivRoo, hRoo*lIntWalOnKit},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6, 0.17}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallSN
                                                                                                        extWallSNLobby
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtDoorOpaquePart
    extDoorOpaquePartLobby
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                                                                        ceilingLobby
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ground
                                                                                                        groundLobby
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntWall1
                                                                                                        intWall1Lobby
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowLobby
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Lobby;
