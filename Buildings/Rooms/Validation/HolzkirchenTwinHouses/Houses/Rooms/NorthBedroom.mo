within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model NorthBedroom
  "Model of the north bedroom (schladen - referred as bedroom) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length lExtWalNor = 3.83
    "Length of the external wall on the north";
  parameter Modelica.SIunits.Length lExtWalEas = 3.18
    "Length of the external wall on the east";
  parameter Modelica.SIunits.Length lIntWalOnBat = 2.07
    "Length of the wall between north bedroom and bathroom";
  parameter Modelica.SIunits.Length lIntWalOnCor = 0.685
    "Length of the wall between north bedroom and corridor";
  parameter Modelica.SIunits.Length lDooOnCor = 0.935
    "Length of the door between north bedroom and corridor";
  parameter Modelica.SIunits.Length hDooOnCor = 1.98
    "Height of the door between north bedroom and corridor";
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = 0.30
    "Length of the wall between north bedroom and living room";
  parameter Modelica.SIunits.Length lIntWalOnLob = 2.61
    "Length of the wall between north bedroom and lobby";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";

  extends Buildings.Rooms.MixedAir(
    AFlo = lExtWalNor * lExtWalEas,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=2,
    nSurBou=5,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExt(
    layers = {extWallENBedroom},
    A = {hRoo*lExtWalEas},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallSNNBedroom},
    A = {hRoo*lExtWalNor},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    each steadyStateInitial = false,
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
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {hRoo*lIntWalOnBat, (hRoo*lIntWalOnCor+(hRoo-hDooOnCor)*lDooOnCor), hDooOnCor*lDooOnCor, hRoo*lIntWalOnLivRoo, hRoo*lIntWalOnLob},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.17, 0.6, 0.17, 0.17}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallSN
                                                                                                        extWallSNNBedroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallE
                                                                                                        extWallENBedroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                                                                        ceilingNBedroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ground
                                                                                                        groundNBedroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowNBedroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{338,-200},{358,-180}})));
end NorthBedroom;
