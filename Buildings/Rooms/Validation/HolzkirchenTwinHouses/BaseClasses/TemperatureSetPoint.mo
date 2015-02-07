within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model TemperatureSetPoint
  "Model to heat or to cool a room considering a temperature set point"
  parameter Real kHea=1E6 "Gain value multiplied with input signal for heating";
  parameter Real kCoo=-1E6
    "Gain value multiplied with input signal for cooling";

  Controls.Continuous.LimPID           conHea(
    Td=60,
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    Ti=300,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.1) "Controller for heating"
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Controls.Continuous.LimPID           conCoo(
    Td=60,
    reverseAction=true,
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    Ti=300,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=0.1) "Controller for cooling"
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Math.Gain gaiHea(k=kHea) "Gain for heating"
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Math.Gain gaiCoo(k=kCoo) "Gain for cooling"
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Math.Sum sum1(nin=2)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Routing.Multiplex2 multiplex2
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Continuous.Integrator EHea(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J")) "Heating energy in Joules"
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Blocks.Continuous.Integrator ECoo(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J")) "Cooling energy in Joules"
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Math.Mean PHea(f=1/3600) "Hourly averaged heating power"
    annotation (Placement(transformation(extent={{0,80},{20,100}})));
  Modelica.Blocks.Math.Mean PCoo(f=1/3600) "Hourly averaged cooling power"
    annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
  Modelica.Blocks.Interfaces.RealInput TSetHea
    "Heating temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-140,30},{-100,70}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput TSetCoo
    "Cooling temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-140,-70},{-100,-30}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,
            10}})));
  Modelica.Blocks.Interfaces.RealInput TRooAir
    "Calculated air temperature in the room"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(conHea.y,gaiHea. u) annotation (Line(
      points={{-59,50},{-42,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(conCoo.y,gaiCoo. u)  annotation (Line(
      points={{-59,-50},{-42,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gaiCoo.y,multiplex2. u2[1]) annotation (Line(
      points={{-19,-50},{-10,-50},{-10,-6},{-2,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(EHea.u,gaiHea. y) annotation (Line(
      points={{-2,50},{-19,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ECoo.u,gaiCoo. y) annotation (Line(
      points={{-2,-50},{-19,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PHea.u,gaiHea. y) annotation (Line(
      points={{-2,90},{-10,90},{-10,50},{-19,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea,conHea. u_s) annotation (Line(
      points={{-120,50},{-82,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo,conCoo. u_s) annotation (Line(
      points={{-120,-50},{-82,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplex2.y,sum1. u) annotation (Line(
      points={{21,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gaiCoo.y, PCoo.u) annotation (Line(
      points={{-19,-50},{-10,-50},{-10,-90},{-2,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gaiHea.y, multiplex2.u1[1]) annotation (Line(
      points={{-19,50},{-10,50},{-10,6},{-2,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sum1.y, y) annotation (Line(
      points={{61,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y, y) annotation (Line(
      points={{110,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir, conHea.u_m) annotation (Line(
      points={{-120,0},{-70,0},{-70,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir, conCoo.u_m) annotation (Line(
      points={{-120,0},{-70,0},{-70,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-94,112},{94,144}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}));
end TemperatureSetPoint;
