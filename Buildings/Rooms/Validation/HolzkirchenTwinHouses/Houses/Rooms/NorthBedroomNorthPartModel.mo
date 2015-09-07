within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model NorthBedroomNorthPartModel
  "Model of the north bedroom (schladen - referred as bedroom) in Holzkirchen Twin Houses for the north part model"
  parameter Modelica.SIunits.Length lExtWalNor = 3.83
    "Length of the external wall on the north" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lExtWalEas = 3.18
    "Length of the external wall on the east" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lIntWalOnBat = 2.07
    "Length of the wall between north bedroom and bathroom" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lIntWalOnCor = 0.685
    "Length of the wall between north bedroom and corridor" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lDooOnCor = 0.935
    "Length of the door between north bedroom and corridor" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length hDooOnCor = 1.98
    "Height of the door between north bedroom and corridor" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = 0.30
    "Length of the wall between north bedroom and living room" annotation(Evaluate=false);
  parameter Modelica.SIunits.Length lIntWalOnLob = 2.61
    "Length of the wall between north bedroom and lobby" annotation(Evaluate=false);
  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room" annotation(Evaluate=false);
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature" annotation(Evaluate=false);
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions" annotation(Evaluate=false);
  parameter Real albedo = 0.23 "Ground reflectivity" annotation(Evaluate=false);
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
  parameter Buildings.HeatTransfer.Data.GlazingSystems.Generic window
    "Properties of the window on the external wall";

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
    glaSys = {window},
    hWin = {1.54} annotation(Evaluate=false),
    wWin = {1.23} annotation(Evaluate=false),
    fFra = {0.3175} annotation(Evaluate=false),
    ove(wL = {0} annotation(Evaluate=false),
        wR = {0} annotation(Evaluate=false),
        gap = {0} annotation(Evaluate=false),
        dep = {0.16} annotation(Evaluate=false)),
    sidFin(h = {0} annotation(Evaluate=false),
           gap = {0} annotation(Evaluate=false),
           dep = {0.16} annotation(Evaluate=false))),
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
    each absIR = 0.9 annotation(Evaluate=false),
    absSol = {0.17} annotation(Evaluate=false)),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  annotation(Documentation(info="<html>
    <p>
    This is a model for the north bedroom in the Holzkirchen twin houses. It was built in order to model just the north bedroom and the lobby together with boundary conditions 
    all around these two rooms. It was duplicated from the north bedroom model but the heat conduction through all these constructions is modeled in this room model 
    (except for the wall between the lobby and the north bedroom). 
    The default values for the lengths of the different walls, windows and doors are the ones of the N2 house.
    This room is connected to other rooms as described in the documentation on the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2LobbyNorthBedroomModel\">
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2LobbyNorthBedroomModel</a>.
    <br>
    See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
    Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for more details.
    </p>
    
    <p>
    The wall sections connected to the north bedroom are shown in the figure below.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/Rooms/NorthBedroom.png\" border=\"1\" alt=\"Wall sections in north bedroom model\"/>
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
    <td>datConExtWin[1]</td>
    <td>ExtWallSN</td>
    </tr>
    <tr>
    <td>2</td>
    <td>East wall on outside</td>
    <td>datConExt[1]</td>
    <td>ExtWallE</td>
    </tr>
    <tr>
    <td>3</td>
    <td>South wall on the bathroom</td>
    <td>datConBou[1]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>4</td>
    <td>South wall on the corridor</td>
    <td>datConBou[2]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>5</td>
    <td>South door on the corridor</td>
    <td>datConBou[3]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>6</td>
    <td>West wall on the living room</td>
    <td>datConBou[4]</td>
    <td>IntWall1</td>
    </tr><tr>
    <td>7</td>
    <td>West wall on the lobby</td>
    <td>surBou[1]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>8</td>
    <td>Ceiling</td>
    <td>datConBou[5]</td>
    <td>Ceiling</td>
    </tr>
    <tr>
    <td>9</td>
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
end NorthBedroomNorthPartModel;
