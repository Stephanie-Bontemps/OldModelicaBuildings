within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model SouthBedroom
  "Model of the south bedroom (schlafen - also referred as children's bedroom) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length lIntWalOnCor = 0.685
    "Length of the wall between south bedroom and corridor";
  parameter Modelica.SIunits.Length lDooOnCor = 0.935
    "Length of the door between south bedroom and corridor";
  parameter Modelica.SIunits.Length hDooOnCor = 1.98
    "Height of the door between south bedroom and corridor";
  parameter Modelica.SIunits.Length lIntWalOnBat = 2.07
    "Length of the wall between south bedroom and bathroom";
  parameter Modelica.SIunits.Length lExtWalEas = 2.89
    "Length of the external wall on the east";
  parameter Modelica.SIunits.Length lExtWalSou = 3.83
    "Length of the external wall on the south";
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = lExtWalEas
    "Length of the wall between south bedroom and living room";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";

  extends Buildings.Rooms.MixedAir(
    AFlo=lExtWalEas*lExtWalSou,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=5,
    nSurBou=1,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExt(
    layers = {extWallESBedroom},
    A = {hRoo*lExtWalEas},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallSNSBedroom},
    A = {hRoo*lExtWalSou},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S},
    each steadyStateInitial = false,
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
    A = {(hRoo*lIntWalOnCor+(hRoo-hDooOnCor)*lDooOnCor), hDooOnCor*lDooOnCor, hRoo*lIntWalOnBat, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {hRoo*lIntWalOnLivRoo},
    til = {Buildings.Types.Tilt.Wall},
    absIR = {0.9},
    absSol = {0.17}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallSN
                                                                                                        extWallSNSBedroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallE
                                                                                                        extWallESBedroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntWall2
                                                                                                        intWall2SBedroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartSBedroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                                                                        ceilingSBedroom
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ground
                                                                                                        groundSBedroom
    annotation (Placement(transformation(extent={{380,-120},{400,-100}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowSBedroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end SouthBedroom;
