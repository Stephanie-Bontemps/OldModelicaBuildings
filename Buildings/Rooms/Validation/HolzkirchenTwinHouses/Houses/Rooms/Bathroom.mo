within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Bathroom "Model of the Bathroom (Bad WC) in Holzkirchen Twin Houses"
  parameter Modelica.SIunits.Angle HolzkirchenLat = 47.874
    "Latitude of the buildings in Holzkirchen site";
  parameter Modelica.SIunits.Height hRooGroundFloor = 2.495
    "Height of the ground floor";
  parameter Modelica.SIunits.Area AFloor "Area of the floor";
  parameter Modelica.SIunits.Length IntWallOnNBedroomLgth
    "Length of the wall between bathroom and North bedroom";
  parameter Modelica.SIunits.Length ExtWallEastLgth
    "Length of the external wall on the East";
  parameter Modelica.SIunits.Length IntWallOnSBedroomLgth
    "Length of the wall between bathroom and South bedroom";
  parameter Modelica.SIunits.Length IntWallOnCorridorLgth
    "Length of the wall between bathroom and corridor";
  parameter Modelica.SIunits.Length DoorOnCorridorLgth
    "Length of the door between bathroom and corridor";

  extends MixedAir(
    lat=HolzkirchenLat,
    AFlo=AFloor,
    hRoo=hRooGroundFloor,
    nConExt=0,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=3,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConExtWin(
    layers = {extWallEBathroom},
    A = {hRooGroundFloor*ExtWallEastLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall},
    azi = {Buildings.HeatTransfer.Types.Azimuth.E},
    steadyStateInitial = {true},
    glaSys = {windowBathroom},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.12}),
    sidFin(h = {0}, gap = {0}, dep = {0.12})),
    datConBou(
    layers = {intWall2Bathroom, ceilingBathroom, groundBathroom},
    A = {hRooGroundFloor*IntWallOnNBedroomLgth, AFloor, AFloor},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Ceiling, Buildings.HeatTransfer.Types.Tilt.Floor},
    steadyStateInitial = {true, true, true}),
    surBou(
    A = {hRooGroundFloor*IntWallOnSBedroomLgth, hRooGroundFloor*IntWallOnCorridorLgth, hRooGroundFloor*DoorOnCorridorLgth},
    til = {Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall, Buildings.HeatTransfer.Types.Tilt.Wall},
    each absIR = 0.9,
    each absSol = 0.9));

  Data.OpaqueConstructions.Constructions.IntWall2 intWall2Bathroom
    annotation (Placement(transformation(extent={{420,-200},{440,-180}})));
  Data.OpaqueConstructions.Constructions.ExtWallE extWallEBathroom
    annotation (Placement(transformation(extent={{380,-200},{400,-180}})));
  Data.OpaqueConstructions.Constructions.Ceiling ceilingBathroom
    annotation (Placement(transformation(extent={{420,-160},{440,-140}})));
  Data.OpaqueConstructions.Constructions.Ground groundBathroom
    annotation (Placement(transformation(extent={{380,-160},{400,-140}})));
  Data.GlazingSystems.Window windowBathroom(haveExteriorShade=true, shade=
        Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems.RollerBlinds())
    annotation (Placement(transformation(extent={{340,-200},{360,-180}})));
end Bathroom;
