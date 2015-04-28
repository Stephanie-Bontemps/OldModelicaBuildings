within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Kitchen "Model of the Kitchen (Küche) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Angle latitude = 47.874 "Latitude";
  parameter Modelica.SIunits.Length heiRoo = 2.495 "Height under ceiling";
  parameter Modelica.SIunits.Length ExtWallNorthLgth = 2.85
    "Length of the external wall on the North";
  parameter Modelica.SIunits.Length ExtWallWestLgth = 2.61
    "Length of the external wall on the West";
  parameter Modelica.SIunits.Length DoorOnLivRoomLgth = 0.935
    "Length of the door between kitchen and living room";
  parameter Modelica.SIunits.Length DoorOnLivRoomHght = 1.98
    "Height of the door between kitchen and living room";
  parameter Modelica.SIunits.Length IntWallOnLobbyLgth = ExtWallWestLgth
    "Length of the wall between kitchen and lobby";
  parameter Modelica.SIunits.Length IntWallOnLivRoomLgth = ExtWallNorthLgth - DoorOnLivRoomLgth
    "Length of the wall between kitchen and living room";
  parameter Modelica.SIunits.Temperature Tini_int
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou
    "Initial temperature of the boundary conditions";

  extends MixedAir(
    lat=latitude,
    hRoo=heiRoo,
    AFlo=ExtWallNorthLgth*ExtWallWestLgth,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=2,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallSNKitchen},
    A = {hRoo*ExtWallNorthLgth},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    steadyStateInitial = {false},
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallWNKitchen},
    A = {hRoo*ExtWallWestLgth},
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
    A = {hRoo*IntWallOnLobbyLgth, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    steadyStateInitial = {false, false, false},
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*IntWallOnLivRoomLgth+(hRoo-DoorOnLivRoomHght)*DoorOnLivRoomLgth), DoorOnLivRoomHght*DoorOnLivRoomLgth},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNKitchen
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtWallWN extWallWNKitchen
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.IntWall2 intWall2Kitchen
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingKitchen
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundKitchen
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.GlazingSystems.Window windowKitchen(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Kitchen;
