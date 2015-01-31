within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model HeatingCoolingSchedule
  "Heating and cooling experimental schedule using imposed constant temperature or imposed heat or cooling power"

  Modelica.Blocks.Sources.BooleanTable booTabTorFlo(startValue=startValue,
      table=table)
    "Boolean table to choose the sceanrio(constant temperature set point or imposed heat flow)"
    annotation (Placement(transformation(extent={{-180,-10},{-160,10}})));
  Modelica.Blocks.Interfaces.RealInput heaCooFlo
    "Heat or cooling power input applied depending on the scenario" annotation (
     Placement(transformation(extent={{-220,80},{-180,120}}),
        iconTransformation(extent={{-220,80},{-180,120}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloCon
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bCon
    "Convective split" annotation (Placement(transformation(extent={{170,20},{190,
            40}}), iconTransformation(extent={{170,20},{190,40}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRad
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bRad
    "Radiative split" annotation (Placement(transformation(extent={{170,-40},{190,
            -20}}), iconTransformation(extent={{170,-40},{190,-20}})));
  Separate separate(k1=0.7, k2=0.3)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Controls.Continuous.LimPID           conHea(
    Td=60,
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    Ti=300,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.1) "Controller for heating"
    annotation (Placement(transformation(extent={{-160,-60},{-140,-40}})));
  Controls.Continuous.LimPID           conCoo(
    Td=60,
    reverseAction=true,
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    Ti=300,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.1) "Controller for cooling"
    annotation (Placement(transformation(extent={{-160,-140},{-140,-120}})));
  Modelica.Blocks.Math.Gain gaiHea(k=kHea) "Gain for heating"
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
  Modelica.Blocks.Math.Gain gaiCoo(k=kCoo) "Gain for cooling"
    annotation (Placement(transformation(extent={{-120,-140},{-100,-120}})));
  Modelica.Blocks.Math.Sum sum1(nin=2)
    annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  Modelica.Blocks.Continuous.Integrator EHea(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J")) "Heating energy in Joules"
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Continuous.Integrator ECoo(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J")) "Cooling energy in Joules"
    annotation (Placement(transformation(extent={{-80,-140},{-60,-120}})));
  Modelica.Blocks.Math.Mean PHea(f=1/3600) "Hourly averaged heating power"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Blocks.Math.Mean PCoo(f=1/3600) "Hourly averaged cooling power"
    annotation (Placement(transformation(extent={{-80,-180},{-60,-160}})));
  Modelica.Blocks.Interfaces.RealInput TSetHea
    "Heating temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-220,-70},{-180,-30}}),
        iconTransformation(extent={{-220,-80},{-180,-40}})));
  Modelica.Blocks.Interfaces.RealInput TSetCoo
    "Cooling temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-220,-140},{-180,-100}}),
        iconTransformation(extent={{-220,-140},{-180,-100}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TRooAir
    "Room air temperature"
    annotation (Placement(transformation(extent={{100,-100},{120,-80}})));
  Modelica.Blocks.Math.Mean TRooHou(f=1/3600, y(start=293.15))
    "Hourly averaged room air temperature"
    annotation (Placement(transformation(extent={{140,-80},{160,-60}})));
  Modelica.Blocks.Math.Mean TRooAnn(f=1/86400/365, y(start=293.15))
    "Annual averaged room air temperature"
    annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
  parameter Boolean startValue=false
    "Start value of y. At time = table[1], y changes to 'not startValue'";
  parameter Modelica.SIunits.Time table[:]={0,1}
    "Vector of time points. At every time point, the output y gets its opposite value (e.g., table={0,1}). 0 = Temperature set point and 1 = Heat or cooling flow imposed";
  parameter Real kHea=1E6 "Gain value multiplied with input signal for heating";
  parameter Real kCoo=-1E6
    "Gain value multiplied with input signal for cooling";

  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(separate.y2, preHeaCooFloRad.Q_flow) annotation (Line(
      points={{81,-5},{90,-5},{90,-30},{100,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(separate.y1, preHeaCooFloCon.Q_flow) annotation (Line(
      points={{81,5},{90,5},{90,30},{100,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conHea.y,gaiHea. u) annotation (Line(
      points={{-139,-50},{-122,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conCoo.y,gaiCoo. u)  annotation (Line(
      points={{-139,-130},{-122,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gaiHea.y,multiplex2. u1[1]) annotation (Line(
      points={{-99,-50},{-90,-50},{-90,-84},{-62,-84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gaiCoo.y,multiplex2. u2[1]) annotation (Line(
      points={{-99,-130},{-90,-130},{-90,-96},{-62,-96}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(EHea.u,gaiHea. y) annotation (Line(
      points={{-82,-50},{-99,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECoo.u,gaiCoo. y) annotation (Line(
      points={{-82,-130},{-99,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PCoo.u,gaiCoo. y) annotation (Line(
      points={{-82,-170},{-90,-170},{-90,-130},{-99,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PHea.u,gaiHea. y) annotation (Line(
      points={{-82,-10},{-90,-10},{-90,-50},{-99,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea, conHea.u_s) annotation (Line(
      points={{-200,-50},{-162,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo, conCoo.u_s) annotation (Line(
      points={{-200,-120},{-182,-120},{-182,-130},{-162,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex2.y, sum1.u) annotation (Line(
      points={{-39,-90},{-22,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preHeaCooFloRad.port, port_bRad) annotation (Line(
      points={{120,-30},{180,-30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TRooAir.T,TRooHou. u) annotation (Line(
      points={{120,-90},{130,-90},{130,-70},{138,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir.T,TRooAnn. u) annotation (Line(
      points={{120,-90},{130,-90},{130,-110},{138,-110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(port_bCon, TRooAir.port) annotation (Line(
      points={{180,30},{180,0},{140,0},{140,-40},{100,-40},{100,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TRooAir.T, conHea.u_m) annotation (Line(
      points={{120,-90},{120,-70},{-150,-70},{-150,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir.T, conCoo.u_m) annotation (Line(
      points={{120,-90},{120,-150},{-150,-150},{-150,-142}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, separate.u) annotation (Line(
      points={{41,0},{58,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo, switch1.u1) annotation (Line(
      points={{-200,100},{10,100},{10,8},{18,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sum1.y, switch1.u3) annotation (Line(
      points={{1,-90},{10,-90},{10,-8},{18,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, switch1.u2) annotation (Line(
      points={{-159,0},{18,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(preHeaCooFloCon.port, port_bCon) annotation (Line(
      points={{120,30},{150,30},{150,30},{180,30}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
            -180},{180,180}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-180,-180},{180,180}}), graphics={
        Text(
          extent={{-94,196},{94,228}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name"), Rectangle(extent={{-180,180},{180,-180}},
            lineColor={0,0,0})}), defaultComponentName="heaCoolSch",
              Documentation(
  info="<html>
  Model to choose the kind of schedule used depending on the period. A constant temperature set point can be used if boolean=false or an imposed heat or cooling power if boolean=true.
  <br/>
  The constant temperature set point is applied comparing the set point to the air temperature in the room.
  <br/>
  Once the heat or cooling heat flow defined, it is separated between a radiative (30%) and a convective (70%) parts. 
  </html>",
  revisions="<html>
<ul>
<li>
January 30 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end HeatingCoolingSchedule;
