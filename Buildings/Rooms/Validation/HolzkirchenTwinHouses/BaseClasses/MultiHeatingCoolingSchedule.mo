within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model MultiHeatingCoolingSchedule
  "Heating and cooling experimental schedule using imposed constant temperature or imposed heat or cooling power for all the rooms"

  parameter Real kHea=1E6 "Gain value multiplied with input signal for heating";
  parameter Real kCoo=-1E6
    "Gain value multiplied with input signal for cooling";

  Modelica.Blocks.Logical.GreaterThreshold booTabTorFlo[7](each threshold=0.5)
    "Boolean table to choose the scenario(constant temperature set point or imposed heat flow)"
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput heaCooFlo[7]
    "Heat or cooling power input applied depending on the scenario" annotation (
     Placement(transformation(extent={{-180,30},{-140,70}}), iconTransformation(
          extent={{-180,30},{-140,70}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloCon[7]
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bCon[7]
    "Convective split" annotation (Placement(transformation(extent={{130,20},{150,
            40}}), iconTransformation(extent={{130,20},{150,40}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRad[7]
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bRad[7]
    "Radiative split" annotation (Placement(transformation(extent={{130,-20},{150,
            0}}),   iconTransformation(extent={{130,-20},{150,0}})));
  Separate sep[7](each k1=0.7, each k2=0.3)
    "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Blocks.Interfaces.RealInput TSetHea[7]
    "Heating temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-180,-50},{-140,-10}}),
        iconTransformation(extent={{-240,-80},{-200,-40}})));
  Modelica.Blocks.Interfaces.RealInput TSetCoo[7]
    "Cooling temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-180,-110},{-140,-70}}),
        iconTransformation(extent={{-180,-110},{-140,-70}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TRooAir[7]
    "Room air temperature"
    annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));

  Modelica.Blocks.Logical.Switch swi[7]
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bTSet[7]
    "Calculated temperature used for the set point" annotation (Placement(
        transformation(extent={{-150,-70},{-130,-50}}), iconTransformation(
          extent={{-150,-70},{-130,-50}})));
  TemperatureSetPoint TSetPoi[7](each kHea=kHea, each kCoo=kCoo)
    "Temperature set point for the kitchen"
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Modelica.Blocks.Interfaces.RealInput schChoice[7]
    "Temperature set point or heating and cooling power" annotation (Placement(
        transformation(extent={{-180,-10},{-140,30}}), iconTransformation(
          extent={{-180,-10},{-140,30}})));
equation

  connect(port_bTSet, TRooAir.port) annotation (Line(
      points={{-140,-60},{-120,-60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TSetHea, TSetPoi.TSetHea) annotation (Line(
      points={{-160,-30},{-80,-30},{-80,-4},{-42,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir.T, TSetPoi.TRooAir) annotation (Line(
      points={{-100,-60},{-70,-60},{-70,-10},{-42,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo, TSetPoi.TSetCoo) annotation (Line(
      points={{-160,-90},{-60,-90},{-60,-16},{-42,-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoi.y, swi.u3) annotation (Line(
      points={{-19,-10},{-10,-10},{-10,2},{-2,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo, swi.u1) annotation (Line(
      points={{-160,50},{-10,50},{-10,18},{-2,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swi.y, sep.u) annotation (Line(
      points={{21,10},{38,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sep.y2, preHeaCooFloRad.Q_flow) annotation (Line(
      points={{61,5},{69.5,5},{69.5,-10},{80,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sep.y1, preHeaCooFloCon.Q_flow) annotation (Line(
      points={{61,15},{70.5,15},{70.5,30},{80,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preHeaCooFloRad.port, port_bRad) annotation (Line(
      points={{100,-10},{140,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloCon.port, port_bCon) annotation (Line(
      points={{100,30},{140,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swi.u2) annotation (Line(
      points={{-79,10},{-2,10}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(schChoice, booTabTorFlo.u) annotation (Line(
      points={{-160,10},{-102,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -140},{140,140}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-140,-140},{140,140}}), graphics={
                               Rectangle(extent={{-180,180},{180,-180}},
            lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-90,194},{98,226}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}), defaultComponentName="mulHeaCooSch",
              Documentation(
  info="<html>
  Model to choose the kind of scenario used depending on the period in the experiment. A constant temperature set point can be used if boolean=false or an imposed heat or cooling power if boolean=true.
  <br/>
  The constant temperature set point is applied comparing the set point to the air temperature in the room.
  <br/>
  Once the heat or cooling heat flow defined, it is separated between a radiative (30%) and a convective (70%) parts. 
  <br/>
  This model is used for all the rooms in the house.
  </html>",
  revisions="<html>
<ul>
<li>
February 2 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end MultiHeatingCoolingSchedule;
