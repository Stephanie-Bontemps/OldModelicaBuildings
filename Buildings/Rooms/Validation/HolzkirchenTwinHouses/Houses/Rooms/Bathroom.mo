within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Bathroom "Model of the bathroom (bad WC) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length lIntWalOnNorBed = 2.07
    "Length of the wall between bathroom and north bedroom";
  parameter Modelica.SIunits.Length lExtWalEas = 2.99
    "Length of the external wall on the east";
  parameter Modelica.SIunits.Length lIntWalOnSouBed = lIntWalOnNorBed
    "Length of the wall between bathroom and south bedroom";
  parameter Modelica.SIunits.Length lDooOnCor = 0.935
    "Length of the door between bathroom and corridor";
  parameter Modelica.SIunits.Length hDooOnCor = 1.98
    "Height of the door between bathroom and corridor";
  parameter Modelica.SIunits.Length lIntWalOnCor = lExtWalEas - lDooOnCor
    "Length of the wall between bathroom and corridor";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";

  extends Buildings.Rooms.MixedAir(
    AFlo=lIntWalOnNorBed*lExtWalEas,
    nConExt=0,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=3,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExtWin(
    layers = {extWallEBathroom},
    A = {hRoo*lExtWalEas},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    each steadyStateInitial = false,
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
    A = {hRoo*lIntWalOnNorBed, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {hRoo*lIntWalOnSouBed, (hRoo*lIntWalOnCor+(hRoo-hDooOnCor)*lDooOnCor), hDooOnCor*lDooOnCor},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntWall2
                                                                                                        intWall2Bathroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallE
                                                                                                        extWallEBathroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                                                                        ceilingBathroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ground
                                                                                                        groundBathroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowBathroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Bathroom;
