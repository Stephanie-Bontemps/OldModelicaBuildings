within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model InternalGains
  "Model to define the internal gains using a file or a constant value"

  parameter Boolean yRadGai=true "y = true: constant value, y = false: file";
  parameter Boolean yConGai=true "y = true: constant value, y = false: file";
  parameter Boolean  yLatGai=true "y = true: constant value, y = false: file";
  parameter Real kRadGai=0 "Constant output value for radiative gains";
  parameter Real kConGai=0 "Constant output value for convective heat gains";
  parameter Real kLatGai=0 "Constant output value for latent heat gains";

  Modelica.Blocks.Sources.Constant qConGai(k=kConGai) "Convective heat gain"
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Modelica.Blocks.Sources.Constant qRadGai(k=kRadGai) "Radiative heat gain"
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.Constant qLatGai(k=kLatGai) "Latent heat gain"
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y[3]
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Logical.Switch switch3
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Blocks.Sources.BooleanExpression booRadGai(y=yRadGai)
    "Boolean expression to choice a constant value or a file"
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  Modelica.Blocks.Sources.BooleanExpression booConGai(y=yConGai)
    "Boolean expression to choice a constant value or a file"
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Sources.BooleanExpression booLatGai(y=yLatGai)
    "Boolean expression to choice a constant value or a file"
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
  Modelica.Blocks.Interfaces.RealInput tabRadGai "Table with radiative gains"
    annotation (Placement(transformation(extent={{-120,40},{-100,60}}),
        iconTransformation(extent={{-120,40},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput tabConGai "Table with convective gains"
    annotation (Placement(transformation(extent={{-120,-30},{-100,-10}}),
        iconTransformation(extent={{-120,-30},{-100,-10}})));
  Modelica.Blocks.Interfaces.RealInput tabLatGai "Table with latent heat gains"
    annotation (Placement(transformation(extent={{-120,-100},{-100,-80}}),
        iconTransformation(extent={{-120,-100},{-100,-80}})));

equation
  connect(multiplex3_1.y, y) annotation (Line(
      points={{61,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qConGai.y, switch2.u1) annotation (Line(
      points={{-39,20},{-30,20},{-30,8},{-22,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qRadGai.y, switch1.u1) annotation (Line(
      points={{-39,90},{-30,90},{-30,78},{-22,78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, multiplex3_1.u1[1]) annotation (Line(
      points={{1,70},{20,70},{20,7},{38,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch2.y, multiplex3_1.u2[1]) annotation (Line(
      points={{1,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qLatGai.y, switch3.u1) annotation (Line(
      points={{-39,-50},{-30,-50},{-30,-62},{-22,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch3.y, multiplex3_1.u3[1]) annotation (Line(
      points={{1,-70},{20,-70},{20,-7},{38,-7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booRadGai.y, switch1.u2) annotation (Line(
      points={{-79,70},{-22,70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booConGai.y, switch2.u2) annotation (Line(
      points={{-79,0},{-22,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booLatGai.y, switch3.u2) annotation (Line(
      points={{-79,-70},{-22,-70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(tabRadGai, switch1.u3) annotation (Line(
      points={{-110,50},{-30,50},{-30,62},{-22,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tabConGai, switch2.u3) annotation (Line(
      points={{-110,-20},{-30,-20},{-30,-8},{-22,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tabLatGai, switch3.u3) annotation (Line(
      points={{-110,-90},{-30,-90},{-30,-78},{-22,-78}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), defaultComponentName="intGai",
              Documentation(
  info="<html>
  Model to define the internal gains (radiative, convective and latent heat gains) choosing between a constant value or a time table.
  <br/>
  If the boolean y = 1 then the constant value will be used, otherwise the time table will be used.
  </html>",
  revisions="<html>
<ul>
<li>
January 28 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Text(
          extent={{-94,106},{94,138}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name"), Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,0})}));
end InternalGains;
