within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
block Separate "Divide the input in two outputs"
  extends Modelica.Blocks.Icons.Block;

  parameter Real k1=0.5 "Gain of upper output";
  parameter Real k2=0.5 "Gain of lower output";
  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
      rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y1 "Connector 1 of Real output signals"
    annotation (Placement(transformation(extent={{100,40},{120,60}},
      rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y2 "Connector 2 of Real output signals"
    annotation (Placement(transformation(extent={{100,-60},{120,-40}},
      rotation=0)));
equation
  y1 = k1*u;
  y2 = k2*u;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), defaultComponentName="separate",
              Documentation(
  info="<html>
  Model to separate the inputs in two outputs according to the coefficients <CODE>k1</CODE> and <CODE>k2</CODE>.
  </html>",
  revisions="<html>
<ul>
<li>
January 30 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end Separate;
