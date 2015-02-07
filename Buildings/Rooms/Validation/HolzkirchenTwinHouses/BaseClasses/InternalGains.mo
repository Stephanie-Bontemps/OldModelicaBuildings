within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model InternalGains
  "Model to define the internal gains using a file or a constant value"

  parameter Boolean yRadGai=true "y = true: constant value, y = false: file";
  parameter Boolean yConGai=true "y = true: constant value, y = false: file";
  parameter Boolean  yLatGai=true "y = true: constant value, y = false: file";
  parameter Real kRadGai=0 "Constant output value for radiative gains";
  parameter Real kConGai=0 "Constant output value for convective heat gains";
  parameter Real kLatGai=0 "Constant output value for latent heat gains";

  Modelica.Blocks.Sources.Constant qConGai(k=kConGai) if (yConGai==true)
    "Convective heat gain"
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.Constant qRadGai(k=kRadGai) if (yRadGai==true)
    "Radiative heat gain"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_1
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.Constant qLatGai(k=kLatGai) if (yLatGai==true)
    "Latent heat gain"
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Blocks.Interfaces.RealOutput y[3]
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput tabRadGai if (yRadGai==false)
    "Table with radiative gains"
    annotation (Placement(transformation(extent={{-120,40},{-100,60}}),
        iconTransformation(extent={{-120,40},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput tabConGai if (yConGai==false)
    "Table with convective gains"
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}}),
        iconTransformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Interfaces.RealInput tabLatGai if (yLatGai==false)
    "Table with latent heat gains"
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}}),
        iconTransformation(extent={{-120,-60},{-100,-40}})));

equation
  connect(multiplex3_1.y, y) annotation (Line(
      points={{61,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qRadGai.y, multiplex3_1.u1[1]) annotation (Line(
      points={{-79,90},{-20,90},{-20,7},{38,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tabRadGai, multiplex3_1.u1[1]) annotation (Line(
      points={{-110,50},{-20,50},{-20,7},{38,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qConGai.y, multiplex3_1.u2[1]) annotation (Line(
      points={{-79,30},{-40,30},{-40,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tabConGai, multiplex3_1.u2[1]) annotation (Line(
      points={{-110,0},{38,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qLatGai.y, multiplex3_1.u3[1]) annotation (Line(
      points={{-79,-20},{-60,-20},{-60,-7},{38,-7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tabLatGai, multiplex3_1.u3[1]) annotation (Line(
      points={{-110,-50},{-60,-50},{-60,-7},{38,-7}},
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
            lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end InternalGains;
