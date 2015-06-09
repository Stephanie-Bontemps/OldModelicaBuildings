within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model LivingRoom "Model of the living room (wohnen) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length lIntWalOnKit = 1.915
    "Length of the wall between living room and kitchen";
  parameter Modelica.SIunits.Length lDooOnKit = 0.935
    "Length of the door between living room and kitchen";
  parameter Modelica.SIunits.Length hDooOnKit = 1.98
    "Height of the door between living room and kitchen";
  parameter Modelica.SIunits.Length lIntWalOnLob = 1.315
    "Length of the wall between living room and lobby";
  parameter Modelica.SIunits.Length lDooOnLob = lDooOnKit
    "Length of the door between living room and lobby";
  parameter Modelica.SIunits.Length hDooOnLob = hDooOnKit
    "Height of the door between living room and lobby";
  parameter Modelica.SIunits.Length lIntWalOnNorBed = 0.30
    "Length of the wall between living room and north bedroom";
  parameter Modelica.SIunits.Length lIntWalOnCor = 2.055
    "Length of the wall between living room and corridor";
  parameter Modelica.SIunits.Length lDooOnCor = lDooOnKit
    "Length of the door between living room and corridor";
  parameter Modelica.SIunits.Length hDooOnCor = hDooOnKit
    "Height of the door between living room and corridor";
  parameter Modelica.SIunits.Length lIntWalOnSouBed = 2.89
    "Length of the wall between living room and south bedroom";
  parameter Modelica.SIunits.Area AExtWalSouUndWin3 = 2.7722
    "Area of the external wall on the south under window 3";
  parameter Modelica.SIunits.Area AExtWalSouWin3 = 7.53215
    "Area of the external wall on the south with window 3 but without the wall under";
  parameter Modelica.SIunits.Area AExtWalSouWin2 = 2.76945
    "Area of the external wall on the south with window 2";
  parameter Modelica.SIunits.Length lExtWalSou = (AExtWalSouUndWin3 + AExtWalSouWin3 + AExtWalSouWin2)/hRoo
    "Length of the external wall on the south";
  parameter Modelica.SIunits.Length lExtWalSouWes = 4.67
    "Length of the external wall on the south west";
  parameter Modelica.SIunits.Length lExtWalNorWes = 1.79
    "Length of the external wall on the north west";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";

  extends Buildings.Rooms.MixedAir(
    AFlo=lExtWalSou*(lExtWalSouWes+lExtWalNorWes),
    nConExt=2,
    nConExtWin=3,
    nConPar=0,
    nConBou=10,
    nSurBou=0,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExt(
    layers = {extWallSNUnderWindow3_1, extWallWSLivingRoom},
    A = {AExtWalSouWin3, hRoo*lExtWalSouWes},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W},
    each steadyStateInitial = false,
    each T_a_start=Tini_ext,
    each T_b_start=Tini_int),
    datConExtWin(
    layers = {extWallSNLivingRoom, extWallSNLivingRoom, extWallWNLivingRoom},
    A = {AExtWalSouWin3, AExtWalSouWin2, hRoo*lExtWalNorWes},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W},
    each steadyStateInitial = false,
    each T_a_start=Tini_ext,
    each T_b_start=Tini_int,
    glaSys = {windowLivingRoom, windowLivingRoom, windowLivingRoom},
    hWin = {1.54, 2.37, 1.54},
    wWin = {3.34, 1.11, 1.23},
    fFra = {0.2004, 0.3004, 0.3175},
    ove(wL = {0, 0, 0}, wR = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.12}),
    sidFin(h = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.12})),
    datConBou(
    layers = {intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, ceilingLivingRoom, groundLivingRoom},
    A = {(hRoo*lIntWalOnKit+(hRoo-hDooOnKit)*lDooOnKit), hDooOnKit*lDooOnKit, (hRoo*lIntWalOnLob+(hRoo-hDooOnLob)*lDooOnLob), hDooOnLob*lDooOnLob, hRoo*lIntWalOnNorBed, (hRoo*lIntWalOnCor+(hRoo-hDooOnCor)*lDooOnCor), hDooOnCor*lDooOnCor, hRoo*lIntWalOnSouBed, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartLivingRoom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.IntWall1
                                                                                                        intWall1LivingRoom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ceiling
                                                                                                        ceilingLivingRoom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.Ground
                                                                                                        groundLivingRoom
    annotation (Placement(transformation(extent={{382,-160},{402,-140}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallWN
                                                                                                        extWallWNLivingRoom
    annotation (Placement(transformation(extent={{380,-120},{400,-100}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallSNUnderWindow3
    extWallSNUnderWindow3_1
    annotation (Placement(transformation(extent={{420,-80},{440,-60}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallWS
                                                                                                        extWallWSLivingRoom
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Constructions.ExtWallSN
                                                                                                        extWallSNLivingRoom
    annotation (Placement(transformation(extent={{380,-80},{400,-60}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.Window
                                                                                     windowLivingRoom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -220},{460,200}}), graphics));
end LivingRoom;
