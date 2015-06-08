within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model LobbyNorthPartModel
  "Model of the lobby (flur on north side of building) in Holzkirchen Twin Houses for north part model"
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

  extends Buildings.Rooms.MixedAir(
    AFlo=(lExtWalNor + lExtDooNor) * lIntWalOnNorBed,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=6,
    nSurBou=0,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = 0.23)),
    bouConExtWin(HDifTil(each rho = 0.23)),
    datConExt(
    layers = {extWallSNLobby},
    A = {(hRoo*lExtWalNor + (hRoo-hExtDooNor)*lExtDooNor)},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extDoorOpaquePartLobby},
    A = {hExtDooNor*lExtDooNor},
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
    layers = {intWall1Lobby, intWall1Lobby, intDoorOpaquePartLobby, intWall2Lobby, ceilingLobby, groundLobby},
    A = {hRoo*lIntWalOnNorBed, (hRoo*lIntWalOnLivRoo + (hRoo-hDooOnLivRoo)*lDooOnLivRoo), hDooOnLivRoo*lDooOnLivRoo, hRoo*lIntWalOnKit, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
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
  Data.OpaqueConstructions.Constructions.IntWall2 intWall2Lobby
    annotation (Placement(transformation(extent={{380,-120},{400,-100}})));
  Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartLobby
    annotation (Placement(transformation(extent={{340,-160},{360,-140}})));
end LobbyNorthPartModel;
