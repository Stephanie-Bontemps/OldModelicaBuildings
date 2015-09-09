within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model LobbyNorthPartModel
  "Model of the lobby (flur on north side of building) in Holzkirchen Twin Houses for north part model"
  parameter Modelica.SIunits.Length lExtWalNor = 1.255
    "Length of the external wall on the north" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lExtDooNor = 0.995
    "Length of the external door on the north" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length hExtDooNor = 2.025
    "Height of the external door on the north" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lIntWalOnNorBed = 2.61
    "Length of the wall between lobby and north Bedroom" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lDooOnLivRoo = 0.935
    "Length of the door between lobby and living room" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length hDooOnLivRoo = 1.98
    "Height of the door between lobby and living room" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = (lExtWalNor + lExtDooNor) - lDooOnLivRoo
    "Length of the wall between lobby and living room" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lIntWalOnKit = lIntWalOnNorBed
    "Length of the wall between lobby and kitchen" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length hWin = 0.535 "Window height";
  parameter Modelica.SIunits.Length wWin = 0.585 "Window width";
  parameter Modelica.SIunits.Length fraWin = 0.01 "Proportion of window frame";
  parameter Modelica.SIunits.Length wLOve = 0.20 "Overhang left length";
  parameter Modelica.SIunits.Length wROve = 0.20 "Overhang right length";
  parameter Modelica.SIunits.Length gapOve = 0.20 "Overhang gap";
  parameter Modelica.SIunits.Length depOve = 0.37 "Overhang depth";
  parameter Modelica.SIunits.Length hSidFin = 0.20 "Side fins height";
  parameter Modelica.SIunits.Length gapSidFin = 0.20 "Side fins gap";
  parameter Modelica.SIunits.Length depSidFin = 0.37 "Side fins depth";
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room" annotation(Evaluate=false);
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature" annotation(Evaluate=false);
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions" annotation(Evaluate=false);
  parameter Real albedo = 0.23 "Ground reflectivity" annotation(Evaluate=false);
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
  parameter Buildings.HeatTransfer.Data.GlazingSystems.Generic window
    "Properties of the window on the external door";

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
    glaSys = {window},
    hWin = {hWin},
    wWin = {wWin},
    fFra = {fraWin},
    ove(wL = {wLOve},
        wR = {wROve},
        gap = {gapOve},
        dep = {depOve}),
    sidFin(h = {hSidFin},
           gap = {gapSidFin},
           dep = {depSidFin}),
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

  annotation(Documentation(info="<html>
    <p>
    This is a model for the lobby in the Holzkirchen twin houses. It was built in order to model just the north bedroom and the lobby together with boundary conditions 
    all around these two rooms. It was duplicated from the lobby model but the heat conduction through all these constructions is modeled in this room model. 
    The default values for the lengths of the different walls, windows and doors are the ones of the N2 house.
    This room is connected to other rooms as described in the documentation on the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2LobbyNorthBedroomModel\">
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2LobbyNorthBedroomModel</a>.
    <br>
    See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
    Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for more details.
    </p>
    
    <p>
    The wall sections connected to the lobby are shown in the figure below.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/Rooms/Lobby.png\" border=\"1\" alt=\"Wall sections in lobby model\"/>
    </p>
    
    <p>
    The different wall sections are represented in the model according to the following table.
    </p>
    <br>
    <table border = \"1\" summary = \"Wall sections in Closet model\">
    <tr>
    <th>Wall Section Number</th>
    <th>Description</th>
    <th>Location in Model</th>
    <th>Corresponding Layer</th>
    </tr>
    <tr>
    <td>1</td>
    <td>North wall on outside</td>
    <td>datConExt[1]</td>
    <td>ExtWallSN</td>
    </tr>
    <tr>
    <td>2</td>
    <td>North door on outside</td>
    <td>datConExtWin[1]</td>
    <td>extDoorOpaquePart</td>
    </tr>
    <tr>
    <td>3</td>
    <td>East wall on north bedroom</td>
    <td>datConBou[1]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>4</td>
    <td>South wall on the living room</td>
    <td>datConBou[2]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>5</td>
    <td>South door on the living room</td>
    <td>datConBou[3]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>6</td>
    <td>West wall on the kitchen</td>
    <td>datConBou[4]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>7</td>
    <td>Ceiling</td>
    <td>datConBou[5]</td>
    <td>Ceiling</td>
    </tr>
    <tr>
    <td>8</td>
    <td>Floor</td>
    <td>datConBou[6]</td>
    <td>Ground</td>
    </tr>
    </table>
    <p></p>
    </html>",
    revisions = "<html>
    <ul>
    <li>June 12 2015, by Stephanie Bontemps:<br/>
    Wall compositions are put in the house model and not in the room models.</li>
    <li>June 10 2015, by Stephanie Bontemps:<br/>
    First implementation.</li>
    </ul>
    </html)"));
end LobbyNorthPartModel;
