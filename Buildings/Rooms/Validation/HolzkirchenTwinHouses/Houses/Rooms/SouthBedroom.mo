within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model SouthBedroom
  "Model of the south bedroom (schlafen - also referred as children's bedroom) in Holzkirchen Twin Houses"

  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";
  parameter Modelica.SIunits.Length lIntWalOnCor = 0.685
    "Length of the wall between south bedroom and corridor" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnCor = 0.935
    "Length of the door between south bedroom and corridor" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnCor = 1.98
    "Height of the door between south bedroom and corridor" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnBat = 2.07
    "Length of the wall between south bedroom and bathroom" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lExtWalEas = 2.89
    "Length of the external wall on the east" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lExtWalSou = 3.83
    "Length of the external wall on the south" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = lExtWalEas
    "Length of the wall between south bedroom and living room" annotation (Dialog(group="Length and area of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallE
    "Properties of the external wall on the east" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallSN
    "Properties of the external wall on the south and the north" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall2
    "Properties of internal wall with a thickness of 14cm" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intDoorOpaquePart
    "Properties of internal door" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ceiling
    "Properties of ceiling" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ground
    "Properties of floor" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.GlazingSystems.Generic window
    "Properties of the window" annotation (Dialog(group="Composition of walls"));

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
    layers = {extWallE},
    A = {hRoo*lExtWalEas},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.E},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallSN},
    A = {hRoo*lExtWalSou},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int},
    glaSys = {window},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.16}),
    sidFin(h = {0}, gap = {0}, dep = {0.16})),
    datConBou(
    layers = {intWall2, intDoorOpaquePart, intWall2, ceiling, ground},
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

    annotation(Documentation(info="<html>
    <p>
    This is a model for the south bedroom in the Holzkirchen twin houses.
    The default values for the lengths of the different walls, windows and doors are the ones of the N2 house.
    This room is connected to other rooms as described in the documentation on the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel\">
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel</a>.
    <br>
    See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
    Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for more details.
    </p>
    
    <p>
    The wall sections connected to the south bedroom are shown in the figure below.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/Rooms/SouthBedroom.png\" border=\"1\" alt=\"Wall sections in south bedroom model\"/>
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
    <td>North wall on the corridor</td>
    <td>datConBou[1]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>2</td>
    <td>North door on the corridor</td>
    <td>datConBou[2]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>3</td>
    <td>North wall on the bathroom</td>
    <td>datConBou[3]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>4</td>
    <td>East wall on outside</td>
    <td>datConExt[1]</td>
    <td>ExtWallE</td>
    </tr>
    <tr>
    <td>5</td>
    <td>South wall on outside</td>
    <td>datConExtWin[1]</td>
    <td>ExtWallSN</td>
    </tr>
    <tr>
    <td>6</td>
    <td>West wall on the living room</td>
    <td>surBou[1]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>7</td>
    <td>Ceiling</td>
    <td>datConBou[4]</td>
    <td>Ceiling</td>
    </tr>
    <tr>
    <td>8</td>
    <td>Floor</td>
    <td>datConBou[5]</td>
    <td>Ground</td>
    </tr>
    </table>
    <p></p>
    </html>",
    revisions = "<html>
    <ul>
    <li>June 12 2015, by Stephanie Bontemps:<br/>
    Wall compositions are put in the house model and not in the room models.</li>
    <li>February 10 2015, by Stephanie Bontemps:<br/>
    First implementation.</li>
    </ul>
    </html)"));
end SouthBedroom;
