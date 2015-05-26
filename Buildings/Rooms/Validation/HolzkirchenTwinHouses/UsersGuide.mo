within Buildings.Rooms.Validation.HolzkirchenTwinHouses;
package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

annotation(preferredView="info",
  Documentation(info="<html>
  <p>
  The <code>Buildings.Rooms.Validation.HolzkirchenTwinHouses</code> package contains models of houses of the Fraunhofer test site located in Holzkirchen (Germany). 
  It is composed of models of N2 and O5 houses, rooms, wall constructions, window constructions, and examples demonstrating their use during several experiments. 
  These models were developed within the framework of the IEA Annex 58 to carry out experimental validations. 
  The <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples\">Buildings.Rooms.Validation.HolzkirchenTwinHouses.Examples</a> 
  package gives the different experiments carried out in this context. 
  <br>
  A complete description of the experimental platform can be found in <a href=\"#Waiting for reference 1\">Waiting for reference 1</a>. 
  The models in this package are based on this document.
  </p>
  
  <h4>Implementation</h4>
  <p>
  Each house is modeled as a multi-zone building with one zone for one room.
  The houses models are located in the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House\">
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.N2House</a> and <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.O5House\">
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.O5House</a> packages.
  The room models are located in the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms\">
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Rooms</a> package.
  The data records for walls can be found in <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions\">
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions</a>.
  The data records for glazing systems are in <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems\">
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems</a>.
  </p>
  <p>
  Several models of the library are used to model these houses:
  <ul> 
  <li>
  Each room model is created by extending the <a href=\"modelica://Buildings.Rooms.MixedAir\">Buildings.Rooms.MixedAir</a> model 
  which is described in <a href=\"modelica://Buildings.Rooms.UsersGuide.MixedAir\">Buildings.Rooms.UsersGuide.MixedAir</a>. 
  </li>
  <li>
  To model the bi-directional airflow going through the internal open or closed doors, the <a href=\"modelica://Buildings.Airflow.Multizone.DoorDiscretizedOperable\">
  Buildings.Airflow.Multizone.DoorDiscretizedOperable</a> model is used.
  </li>
  <li>
  <a href=\"modelica://Buildings.Airflow.Multizone.EffectiveAirLeakageArea\">Buildings.Airflow.Multizone.EffectiveAirLeakageArea</a> is used to model the air leakage areas.
  </li>
  <li>
  To model the ventilation system the <a href=\"modelica://Buildings.Fluid.Sources.MassFlowSource_T\">Buildings.Fluid.Sources.MassFlowSource_T</a> model
  is used as the supplied and extracted mass flow rates with the associated temperature are known.
  </li>
  <li>
  To model heating and cooling, the <a href=\"modelica://Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule\">
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.MultiHeatingCoolingSchedule</a> model was developed where it is possible to choose between an imposed constant
  temperature or imposed heating and cooling powers for each room. If the constant temperature set point is chosen, the set point is compared to the air temperature port in the room.
  The heating and cooling powers are determined using PI controller with anti-windup. 
  If heating and cooling powers are imposed, an input file with the measured values is used. 
  Once the heating or cooling flow is defined according to the type of scenario, it is separated between a radiative (30%) and a convective (70%) parts according to the known experiments.
  The convective part is linked to the air temperature port and the radiative part to the radiative temperature port.
  </li>
  <li>
  To describe the thermal bridges, <a href=\"modelica://Modelica.Thermal.HeatTransfer.Components.ThermalConductor\">Modelica.Thermal.HeatTransfer.Components.ThermalConductor</a>
  model is applied for which heat is transported without being stored. It is connected to a prescribed temperature. 
  For thermal bridges on the external walls, the external temperature supplied by the weather file is applied. 
  For the internal walls in contact with the ground, the cellar temperature is used and for the ones in contact with the ceiling, the attic temperature is used.
  West attic temperature is applied for the walls between living room, kitchen and lobby and the east one for the other walls. 
  The thermal bridge conductance for each type of boundary conditions in each room is computed using the linear and point thermal transmittances.
  </li>
  <li>
  To model the weather conditions, <a href=\"modelica://Buildings.BoundaryConditions.WeatherData.ReaderTMY3\">Buildings.BoundaryConditions.WeatherData.ReaderTMY3</a> model is used. 
  This model reads TMY3 weather data. Thus, the on-site measured data need to be converted before being inserted in the model.
  </li>
  <li>
  In the known experiments, heat losses are observed in the kitchen because of the uninsulated duct going through the kitchen. 
  The supplied estimated values are implemented as internal convective gains. 
  </li>
  </ul>
  </p>
  
  <h4>Assumptions and limitations</h4>
  <p>
  <ul>
  <li>
  Internal lengths are used for the description of the opaque constructions.
  </li>
  <li>
  When available in the experiment test case report, the supplied parameters values are used.
  The orifice parameters values used in <a href=\"modelica://Buildings.Airflow.Multizone.DoorDiscretizedOperable\">Buildings.Airflow.Multizone.DoorDiscretizedOperable</a> and
  <a href=\"modelica://Buildings.Airflow.Multizone.EffectiveAirLeakageArea\">Buildings.Airflow.Multizone.EffectiveAirLeakageArea</a> are adopted according to 
  <a href=\"#Wetter2006\">Wetter (2006)</a>.
  The effective air leakage areas values are computed as described in <a href=\"Waiting for reference 2\">Waiting for reference 2</a>.
  For the weather data, when parameters values are unknown, the default constant values are used (ceiling height for example), except for the direct normal radiation. 
  Its values are computed out of the model as described in <a href=\"Waiting for reference 2\">Waiting for reference 2</a> and the obtained values are inserted in the TMY3 file.
  Otherwise, the suggested values included in the model are used. 
  </li>
  <li>
  As the studied test cases only envolve the ground floor in the known experiments, just this floor is modeled.
  </li>
  <li>
  Windows on internal doors are not modeled.
  </li>
  <li>
  To define the overhang and side fins properties, the windows are supposed to be aligned with the wall building material, except for the external door as the depth is given in
  <a href=\"Waiting for reference 1\">Waiting for reference 1</a>.
  </li>
  <li>
  In the present model, the extracted air mass flow rate is equally distributed between the bathroom and the south bedroom. The same temperature is applied for both rooms.
  </li>
  </ul>
  </p>
  
  <h4>References</h4>
  <p>
  <ul>
  <li>
  <a NAME=\"Waiting for reference 1\"/>
  Names Reference to insert.<br/>
  <a href=\"modelica://Buildings/Resources/Images/Rooms/2011-ibpsa-BuildingsLib.pdf\">
  Modeling of Heat Transfer in Rooms in the Modelica \"Buildings\" Library.</a><br/>
  Proc. of the 12th IBPSA Conference, p. 1096-1103. Sydney, Australia, November 2011.
  </li>
  <li>
  <a NAME=\"Wetter2006\"/>
  Michael Wetter.<br/>
  <a href=\"modelica://Buildings/Resources/Images/Rooms/2011-ibpsa-BuildingsLib.pdf\">
  Multizone airflow model in Modelica.</a><br/>
  Proc. of the 5th International Modelica Conference, p. 431-440. Vienna, Austria, September 2006.
  </li>
  <li>
  <a NAME=\"Waiting for reference 2\"/>
  Names Reference to insert.<br/>
  <a href=\"modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Wetter-airflow-2006.pdf\">
  Modeling of Heat Transfer in Rooms in the Modelica \"Buildings\" Library.</a><br/>
  Proc. of the 12th IBPSA Conference, p. 1096-1103. Sydney, Australia, November 2011.
  </li>
  </ul>
  </p>
  </html>"));

end UsersGuide;
