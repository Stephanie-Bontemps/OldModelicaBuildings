within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Kitchen "Model of the kitchen (küche) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length lExtWalNor = 2.85
    "Length of the external wall on the north";
  parameter Modelica.SIunits.Length lExtWalWes = 2.61
    "Length of the external wall on the west";
  parameter Modelica.SIunits.Length lDooOnLivRoo = 0.935
    "Length of the door between kitchen and living room";
  parameter Modelica.SIunits.Length hDooOnLivRoo = 1.98
    "Height of the door between kitchen and living room";
  parameter Modelica.SIunits.Length lIntWalOnLob = lExtWalWes
    "Length of the wall between kitchen and lobby";
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = lExtWalNor - lDooOnLivRoo
    "Length of the wall between kitchen and living room";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";

  extends Buildings.Rooms.MixedAir(
    AFlo=lExtWalNor*lExtWalWes,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=2,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = 0.23)),
    bouConExtWin(HDifTil(each rho = 0.23)),
    datConExt(
    layers = {extWallSNKitchen},
    A = {hRoo*lExtWalNor},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallWNKitchen},
    A = {hRoo*lExtWalWes},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int},
    glaSys = {windowKitchen},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.12}),
    sidFin(h = {0}, gap = {0}, dep = {0.12})),
    datConBou(
    layers = {intWall2Kitchen, ceilingKitchen, groundKitchen},
    A = {hRoo*lIntWalOnLob, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*lIntWalOnLivRoo+(hRoo-hDooOnLivRoo)*lDooOnLivRoo), hDooOnLivRoo*lDooOnLivRoo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallSN
                                                                                                        extWallSNKitchen
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallWN
                                                                                                        extWallWNKitchen
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntWall2
                                                                                                        intWall2Kitchen
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                                                                        ceilingKitchen
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ground
                                                                                                        groundKitchen
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowKitchen(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Kitchen;
