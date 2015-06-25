within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Kitchen "Model of the kitchen (k�che) in Holzkirchen Twin Houses"

  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";
  parameter Modelica.SIunits.Length lExtWalNor = 2.85
    "Length of the external wall on the north"
                                              annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lExtWalWes = 2.61
    "Length of the external wall on the west"
                                             annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnLivRoo = 0.935
    "Length of the door between kitchen and living room"
                                                        annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnLivRoo = 1.98
    "Height of the door between kitchen and living room"
                                                        annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnLob = lExtWalWes
    "Length of the wall between kitchen and lobby"
                                                  annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = lExtWalNor - lDooOnLivRoo
    "Length of the wall between kitchen and living room" annotation (Dialog(group="Length and area of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallSN
    "Properties of  external wall on the south and the north" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallWN
    "Properties of north part of the external wall on the west" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall2
    "Properties of internal wall with a thickness of 14cm" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ceiling
    "Properties of ceiling" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ground
    "Properties of floor" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.GlazingSystems.Generic window
    "Properties of the window" annotation (Dialog(group="Composition of walls"));

  extends Buildings.Rooms.MixedAir(
    AFlo=lExtWalNor*lExtWalWes,
    nConExt=1,
    nConExtWin=1,
    nConPar=0,
    nConBou=3,
    nSurBou=2,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    bouConExt(HDifTil(each rho = albedo)),
    bouConExtWin(HDifTil(each rho = albedo)),
    datConExt(
    layers = {extWallSN},
    A = {hRoo*lExtWalNor},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int}),
    datConExtWin(
    layers = {extWallWN},
    A = {hRoo*lExtWalWes},
    til = {Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.N},
    each steadyStateInitial = false,
    T_a_start={Tini_ext},
    T_b_start={Tini_int},
    glaSys = {window},
    hWin = {1.54},
    wWin = {1.23},
    fFra = {0.3175},
    ove(wL = {0}, wR = {0}, gap = {0}, dep = {0.12}),
    sidFin(h = {0}, gap = {0}, dep = {0.12})),
    datConBou(
    layers = {intWall2, ceiling, ground},
    A = {hRoo*lIntWalOnLob, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*lIntWalOnLivRoo+(hRoo-hDooOnLivRoo)*lDooOnLivRoo), hDooOnLivRoo*lDooOnLivRoo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  annotation(Documentation(info="<html>
    <p>
    This is a model for the kitchen in the Holzkirchen twin houses.
    The default values for the lengths of the different walls, windows and doors are the ones of the N2 house.
    This room is connected to other rooms as described in the documentation on the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel\">
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel</a>.
    <br>
    See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
    Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for more details.
    </p>
    
    <p>
    The wall sections connected to the kitchen are shown in the figure below.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/Rooms/Kitchen.png\" border=\"1\" alt=\"Wall sections in kitchen model\"/>
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
    <td>East wall on the lobby</td>
    <td>datConBou[1]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>3</td>
    <td>South wall on the living room</td>
    <td>SurBou[1]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>4</td>
    <td>South door on the living room</td>
    <td>SurBou[2]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>5</td>
    <td>West wall on outside</td>
    <td>datConExtWin[1]</td>
    <td>ExtWallWN</td>
    </tr>
    <tr>
    <td>6</td>
    <td>Ceiling</td>
    <td>datConBou[2]</td>
    <td>Ceiling</td>
    </tr>
    <tr>
    <td>7</td>
    <td>Floor</td>
    <td>datConBou[3]</td>
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
end Kitchen;
