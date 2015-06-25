within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms;
model Corridor
  "Model of the corridor (flur - Centre of house) in Holzkirchen Twin Houses"

  parameter Modelica.SIunits.Temperature Tini_int = 293.15
    "Intial temperature in the room";
  parameter Modelica.SIunits.Temperature Tini_ext = 293.15
    "Outside initial temperature";
  parameter Modelica.SIunits.Temperature Tini_bou = 293.15
    "Initial temperature of the boundary conditions";
  parameter Modelica.SIunits.Length lIntWalOnNorBed = 0.685
    "Length of the wall between corridor and north bedroom"
                                                           annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnNorBed = 0.935
    "Length of the door between corridor and north bedroom"
                                                           annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnNorBed = 1.98
    "Height of the door between corridor and north bedroom"
                                                           annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWallOnBat = 2.055
    "Length of the wall between corridor and bathroom"
                                                      annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnBat = lDooOnNorBed
    "Length of the door between corridor and bathroom"
                                                      annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnBat = hDooOnNorBed
    "Height of the door between corridor and bathroom"
                                                      annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnSouBed = lIntWalOnNorBed
    "Length of the wall between corridor and south bedroom"
                                                           annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnSouBed = lDooOnNorBed
    "Length of the door between corridor and south bedroom";
  parameter Modelica.SIunits.Length hDooOnSouBed = hDooOnNorBed
    "Height of the door between corridor and south bedroom"
                                                           annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lIntWalOnLivRoo = lIntWallOnBat
    "Length of the wall between corridor and living room"
                                                         annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length lDooOnLivRoo = lDooOnNorBed
    "Length of the door between corridor and living room"
                                                         annotation (Dialog(group="Length and area of walls"));
  parameter Modelica.SIunits.Length hDooOnLivRoo = hDooOnNorBed
    "Height of the door between corridor and living room"
                                                         annotation (Dialog(group="Length and area of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intDoorOpaquePart
    "Properties of internal door" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intWall2
    "Properties of internal with a thickness of 14cm" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ceiling
    "Properties of ceiling" annotation (Dialog(group="Composition of walls"));
  parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ground
    "Properties of floor" annotation (Dialog(group="Composition of walls"));

  extends Buildings.Rooms.MixedAir(
    AFlo=(lIntWalOnNorBed + lDooOnNorBed) * (lIntWallOnBat + lDooOnBat),
    nConExt=0,
    nConExtWin=0,
    nConPar=0,
    nConBou=6,
    nSurBou=4,
    intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    extConMod=Buildings.HeatTransfer.Types.ExteriorConvection.TemperatureWind,
    datConBou(
    layers = {intWall2, intDoorOpaquePart, intWall2, intDoorOpaquePart, ceiling, ground},
    A = {(hRoo*lIntWalOnNorBed+(hRoo-hDooOnNorBed)*lDooOnNorBed), hDooOnNorBed*lDooOnNorBed, (hRoo*lIntWallOnBat+(hRoo-hDooOnBat)*lDooOnBat), hDooOnBat*lDooOnBat, AFlo, AFlo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Ceiling, Buildings.Types.Tilt.Floor},
    each steadyStateInitial = false,
    each T_a_start=Tini_bou,
    each T_b_start=Tini_int),
    surBou(
    A = {(hRoo*lIntWalOnSouBed+(hRoo-hDooOnSouBed)*lDooOnSouBed), hDooOnSouBed*lDooOnSouBed, (hRoo*lIntWalOnLivRoo+(hRoo-hDooOnLivRoo)*lDooOnLivRoo), hDooOnLivRoo*lDooOnLivRoo},
    til = {Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall},
    each absIR = 0.9,
    absSol = {0.17, 0.6, 0.17, 0.6}),
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=Tini_int);

  annotation(Documentation(info="<html>
    <p>
    This is a model for the corridor in the Holzkirchen twin houses.
    The default values for the lengths of the different walls, windows and doors are the ones of the N2 house.
    This room is connected to other rooms as described in the documentation on the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel\">
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House.N2HouseModel</a>.
    <br>
    See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
    Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for more details.
    </p>
    
    <p>
    The wall sections connected to the corridor are shown in the figure below.
    </p>
    <p align=\"center\">
    <img src=\"modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/Rooms/Corridor.png\" border=\"1\" alt=\"Wall sections in corridor model\"/>
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
    <td>North wall on the north bedroom</td>
    <td>datConBou[1]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>2</td>
    <td>North door on the north bedroom</td>
    <td>datConBou[2]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>3</td>
    <td>East wall on the bathroom</td>
    <td>datConBou[3]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>4</td>
    <td>East door on the bathroom</td>
    <td>datConBou[4]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>5</td>
    <td>South wall on the south bedroom</td>
    <td>surBou[1]</td>
    <td>IntWall2</td>
    </tr>
    <tr>
    <td>6</td>
    <td>South door on the south bedroom</td>
    <td>surBou[2]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>7</td>
    <td>West wall on the living room</td>
    <td>surBou[3]</td>
    <td>IntWall1</td>
    </tr>
    <tr>
    <td>8</td>
    <td>West door on the living room</td>
    <td>surBou[4]</td>
    <td>IntDoorOpaquePart</td>
    </tr>
    <tr>
    <td>9</td>
    <td>Ceiling</td>
    <td>datConBou[5]</td>
    <td>Ceiling</td>
    </tr>
    <tr>
    <td>10</td>
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
    <li>February 10 2015, by Stephanie Bontemps:<br/>
    First implementation.</li>
    </ul>
    </html)"));
end Corridor;
