within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model NorthBedroomNorthPartModel
  "Model of the north bedroom (schladen - referred as bedroom) in Holzkirchen Twin Houses for the north part model"
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
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallSN
    "Properties of  external wall on south and north";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallE
    "Properties of external wall on east";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall1
    "Properties of internal wall with a thickness of 27cm";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall2
    "Properties of internal with a thickness of 14cm";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intDoorOpaquePart
    "Properties of internal door";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ceiling
    "Properties of ceiling";
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ground
    "Pproperties of floor";

  extends Buildings.Rooms.MixedAir(
    AFlo = lExtWalNor * lExtWalEas,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=6,
    nSurBou=1,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExt(
    layers = {extWallE},
    A = {hRoo*lExtWalEas},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallSN},
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
    layers = {intWall2, intWall2, intDoorOpaquePart, intWall1, ceiling, ground},
    A = {hRoo*lIntWalOnBat, (hRoo*lIntWalOnCor+(hRoo-hDooOnCor)*lDooOnCor), hDooOnCor*lDooOnCor, hRoo*lIntWalOnLivRoo, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {hRoo*lIntWalOnLob},
    til = {Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowNBedroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{338,-200},{358,-180}})));
end NorthBedroomNorthPartModel;
