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
  parameter Real albedo = 0.23 "Ground reflectivity";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallSN
    "Properties of  external wall on south and north";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extDoorOpaquePart
    "Properties of external door";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intDoorOpaquePart
    "Properties of internal door";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall1
    "Properties of internal wall with a thickness of 27cm";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall2
    "Properties of internal with a thickness of 14cm";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ceiling
    "Properties of ceiling";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ground
    "Properties of floor";

  extends Buildings.Rooms.MixedAir(
    AFlo=(lExtWalNor + lExtDooNor) * lIntWalOnNorBed,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=6,
    nSurBou=0,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExt(
    layers = {extWallSN},
    A = {(hRoo*lExtWalNor + (hRoo-hExtDooNor)*lExtDooNor)},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extDoorOpaquePart},
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
    layers = {intWall1, intWall1, intDoorOpaquePart, intWall2, ceiling, ground},
    A = {hRoo*lIntWalOnNorBed, (hRoo*lIntWalOnLivRoo + (hRoo-hDooOnLivRoo)*lDooOnLivRoo), hDooOnLivRoo*lDooOnLivRoo, hRoo*lIntWalOnKit, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowLobby
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));

end LobbyNorthPartModel;
