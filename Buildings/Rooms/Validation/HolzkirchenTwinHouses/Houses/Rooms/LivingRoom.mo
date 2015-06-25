within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model LivingRoom "Model of the living room (wohnen) in Holzkirchen Twin Houses"

  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Real albedo = 0.23 "Ground reflectivity";
  parameter Modelica.SIunits.Length lIntWalOnKit = 1.915
    "Length of the wall between living room and kitchen" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnKit = 0.935
    "Length of the door between living room and kitchen" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnKit = 1.98
    "Height of the door between living room and kitchen" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnLob = 1.315
    "Length of the wall between living room and lobby" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnLob = lDooOnKit
    "Length of the door between living room and lobby" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnLob = hDooOnKit
    "Height of the door between living room and lobby" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnNorBed = 0.30
    "Length of the wall between living room and north bedroom" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnCor = 2.055
    "Length of the wall between living room and corridor" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnCor = lDooOnKit
    "Length of the door between living room and corridor" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnCor = hDooOnKit
    "Height of the door between living room and corridor" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnSouBed = 2.89
    "Length of the wall between living room and south bedroom" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lExtWalSou = (AExtWalSouUndWin3 + AExtWalSouWin3 + AExtWalSouWin2)/hRoo
    "Length of the external wall on the south" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lExtWalSouWes = 4.67
    "Length of the external wall on the south west" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lExtWalNorWes = 1.79
    "Length of the external wall on the north west" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Area AExtWalSouUndWin3 = 2.7722
    "Area of the external wall on the south under window 3" annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Area AExtWalSouWin3 = 7.53215
    "Area of the external wall on the south with window 3 but without the wall under"
                                                                                      annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Area AExtWalSouWin2 = 2.76945
    "Area of the external wall on the south with window 2" annotation (Dialog(group="Length and area of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallSN
    "Properties of  external wall on the south and the north" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallSNUnderWindow3
    "Properties of external wall under the window in the living room on the south"
                                                                                   annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallWS
    "Properties of south part of the external wall on the west" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic extWallWN
    "Properties of north part of the external wall on the west" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intDoorOpaquePart
    "Properties of internal door" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall1
    "Properties of internal wall with a thickness of 27cm" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ceiling
    "Properties of ceiling" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ground
    "Properties of floor" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.GlazingSystems.Generic window
    "Properties of the window" annotation (Dialog(group="Composition of walls"));

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
    layers = {extWallSNUnderWindow3, extWallWS},
    A = {AExtWalSouWin3, hRoo*lExtWalSouWes},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W},
    each steadyStateInitial = false,
    each T_a_start=Tini_ext,
    each T_b_start=Tini_int),
    datConExtWin(
    layers = {extWallSN, extWallSN, extWallWN},
    A = {AExtWalSouWin3, AExtWalSouWin2, hRoo*lExtWalNorWes},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    azi = {Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.S, Buildings.Types.Azimuth.W},
    each steadyStateInitial = false,
    each T_a_start=Tini_ext,
    each T_b_start=Tini_int,
    glaSys = {window, window, window},
    hWin = {1.54, 2.37, 1.54},
    wWin = {3.34, 1.11, 1.23},
    fFra = {0.2004, 0.3004, 0.3175},
    ove(wL = {0, 0, 0}, wR = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.12}),
    sidFin(h = {0, 0, 0}, gap = {0, 0, 0}, dep = {0.16, 0.16, 0.12})),
    datConBou(
    layers = {intWall1, intDoorOpaquePart, intWall1, intDoorOpaquePart, intWall1, intWall1, intDoorOpaquePart, intWall1, ceiling, ground},
    A = {(hRoo*lIntWalOnKit+(hRoo-hDooOnKit)*lDooOnKit), hDooOnKit*lDooOnKit, (hRoo*lIntWalOnLob+(hRoo-hDooOnLob)*lDooOnLob), hDooOnLob*lDooOnLob, hRoo*lIntWalOnNorBed, (hRoo*lIntWalOnCor+(hRoo-hDooOnCor)*lDooOnCor), hDooOnCor*lDooOnCor, hRoo*lIntWalOnSouBed, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -220},{460,200}}), graphics),
             Documentation(info="<html>
    <p>
    This is a model for the living room in the Holzkirchen twin houses.
    The default values for the lengths of the different walls, windows and doors are the ones of the N2 house.
    This room is connected to other rooms as described in the documentation on the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel\">
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel</a>.
    <br>
    See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
    Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for more details.
    </p>
    
    <p>
    The wall sections connected to the living room are shown in the figure below.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/Rooms/LivingRoom.png\" border=\"1\" alt=\"Wall sections in living room model\"/>
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
    <td>North wall on the kitchen</td>
    <td>datConBou[1]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>2</td>
    <td>North door on the kitchen</td>
    <td>datConBou[2]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>3</td>
    <td>North wall on the lobby</td>
    <td>datConBou[3]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>4</td>
    <td>North door on the lobby</td>
    <td>datConBou[4]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>5</td>
    <td>East wall on the north bedroom</td>
    <td>datConBou[5]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>6</td>
    <td>East wall on the corridor</td>
    <td>datConBou[6]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>7</td>
    <td>East door on the corridor</td>
    <td>datConBou[7]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>8</td>
    <td>East wall on the south bedroom</td>
    <td>datConBou[8]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>9</td>
    <td>South wall on outside above window 3</td>
    <td>datConExtWin[1]</td>
    <td>ExtWallSN</td>
    </tr>
    <tr>
    <td>10</td>
    <td>South wall on outside around window 2</td>
    <td>datConExtWin[2]</td>
    <td>ExtWallSN</td>
    </tr>
    <tr>
    <td>11</td>
    <td>South wall under window 3 on outside</td>
    <td>datConExt[1]</td>
    <td>ExtWallSNUnderWindow3</td>
    </tr>
    <tr>
    <td>12</td>
    <td>South part of the west wall on outside</td>
    <td>datConExt[2]</td>
    <td>ExtWallWS</td>
    </tr>
    <tr>
    <td>13</td>
    <td>North part of the west wall on outside</td>
    <td>datConExtWin[3]</td>
    <td>ExtWallWN</td>
    </tr>
    <tr>
    <td>14</td>
    <td>Ceiling</td>
    <td>datConBou[9]</td>
    <td>Ceiling</td>
    </tr>
    <tr>
    <td>15</td>
    <td>Floor</td>
    <td>datConBou[10]</td>
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
end LivingRoom;
