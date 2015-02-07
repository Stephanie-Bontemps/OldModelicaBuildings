within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model LivingRoom "Model of the Living Room (Wohnen) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Length IntWallOnKitchenLgth = 1.915
    "Length of the wall between living room and kitchen";
  parameter Modelica.SIunits.Length DoorOnKitchenLgth = 0.935
    "Length of the door between living room and kitchen";
  parameter Modelica.SIunits.Length IntWallOnLobbyLgth = 1.315
    "Length of the wall between living room and lobby";
  parameter Modelica.SIunits.Length DoorOnLobbyLgth = 0.935
    "Length of the door between living room and lobby";
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth = 0.30
    "Length of the wall between living room and North bedroom";
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth = 2.055
    "Length of the wall between living room and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth = 0.935
    "Length of the door between living room and corridor";
  parameter Modelica.SIunits.Length IntWallOnSBedroomLgth = 2.89
    "Length of the wall between living room and South bedroom";
  parameter Modelica.SIunits.Area ExtWallSouthUnderWin3Area = 2.7722
    "Area of the external wall on the South under window 3";
  parameter Modelica.SIunits.Area ExtWallSouthWin3Area = 7.53215
    "Area of the external wall on the South with window 3 but without the wall under";
  parameter Modelica.SIunits.Area ExtWallSouthWin2Area = 2.76945
    "Area of the external wall on the South with window 2";
  parameter Modelica.SIunits.Length ExtWallSouthWestLgth = 4.67
    "Length of the external wall on the South West";
  parameter Modelica.SIunits.Length ExtWallNorthWestLgth = 1.79
    "Length of the external wall on the North West";

  extends MixedAir(
    lat=47.874,
    hRoo=2.495,
    AFlo=33.8504,
    nConExt=2,
    nConExtWin=3,
    nConPar=0,
    nConBou=10,
    nSurBou=0,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExt(
    layers = {extWallSNUnderWindow3_1, extWallWSLivingRoom},
    A = {ExtWallSouthWin3Area, hRoo*ExtWallSouthWestLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.S, Buildings.HeatTransfer.Types.Azimuth.W},
    steadyStateInitial = {true, true}),
    datConExtWin(
    layers = {extWallSNLivingRoom, extWallSNLivingRoom, extWallWNLivingRoom},
    A = {ExtWallSouthWin3Area, ExtWallSouthWin2Area, hRoo*ExtWallNorthWestLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.S, Buildings.HeatTransfer.Types.Azimuth.S, Buildings.HeatTransfer.Types.Azimuth.W},
    steadyStateInitial = {true, true, true},
    glaSys = {windowLivingRoom, windowLivingRoom, windowLivingRoom},
    hWin = {1.54, 2.37, 1.54},
    wWin = {3.34, 1.11, 1.23},
    fFra = {0.2004, 0.3004, 0.3175},
    ove(wL = {0, 0, 0}, wR = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.16}),
    sidFin(h = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.16})),
    datConBou(
    layers = {intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, intWall1LivingRoom, intDoorOpaquePartLivingRoom, intWall1LivingRoom, ceilingLivingRoom, groundLivingRoom},
    A = {hRoo*IntWallOnKitchenLgth, hRoo*DoorOnKitchenLgth, hRoo*IntWallOnLobbyLgth, hRoo*DoorOnLobbyLgth, hRoo*IntWallOnNBedroomLgth, hRoo*IntWallOnCorridorLgth, hRoo*DoorOnCorridorLgth, hRoo*IntWallOnSBedroomLgth, AFlo, AFlo},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true, true, true, true, true, true, true, true}));

  Data.OpaqueConstructions.Constructions.IntDoorOpaquePart
    intDoorOpaquePartLivingRoom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.IntWall1 intWall1LivingRoom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingLivingRoom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundLivingRoom
    annotation (Placement(transformation(extent={{382,-160},{402,-140}})));
  Data.OpaqueConstructions.Constructions.ExtWallWN extWallWNLivingRoom
    annotation (Placement(transformation(extent={{380,-120},{400,-100}})));
  Data.OpaqueConstructions.Constructions.ExtWallSNUnderWindow3 extWallSNUnderWindow3_1
    annotation (Placement(transformation(extent={{420,-80},{440,-60}})));
  Data.OpaqueConstructions.Constructions.ExtWallWS extWallWSLivingRoom
    annotation (Placement(transformation(extent={{420,-120},{440,-100}})));
  Data.OpaqueConstructions.Constructions.ExtWallSN extWallSNLivingRoom
    annotation (Placement(transformation(extent={{380,-80},{400,-60}})));
  Data.GlazingSystems.Window windowLivingRoom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -220},{460,200}}), graphics));
end LivingRoom;
