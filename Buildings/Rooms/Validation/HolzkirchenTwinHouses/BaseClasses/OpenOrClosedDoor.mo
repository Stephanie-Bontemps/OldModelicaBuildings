within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model OpenOrClosedDoor
  "Model to choose if the door is open or closed between 2 rooms"
  extends Fluid.Interfaces.PartialFourPortInterface(
    redeclare package Medium1 = MediumB,
    redeclare package Medium2 = MediumB,
    final allowFlowReversal1=false,
    final allowFlowReversal2=false,
    final m1_flow_nominal=10/3600*1.2,
    final m2_flow_nominal=m1_flow_nominal);

  replaceable package MediumB = Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);
  parameter Modelica.Blocks.Interfaces.BooleanOutput yDooFil=true
    "Value of Boolean output for the kind of scenario for the door (yDooFil = true: constant value, yDooFil = false: time varying scenario)";
  parameter Real kDooOpe
    "Constant output value to choose if the door is always open or closed (kDooOpe = 0: door closed or kDooOpe = 1: door open). To select if yDooFil=true";
  parameter Modelica.SIunits.Length wOpe=0.935 "Width of opening";
  parameter Modelica.SIunits.Length hOpe=1.98 "Height of opening";
  parameter Modelica.SIunits.Area LClo=4.675e-03
    "Effective leakage area if door model is used";

  parameter Modelica.SIunits.Length hA=0 "Height of reference pressure zone A";
  parameter Modelica.SIunits.Length hB=0 "Height of reference pressure zone B";

  Airflow.Multizone.DoorDiscretizedOperable doo(
    wOpe=wOpe,
    hOpe=hOpe,
    redeclare package Medium = MediumB,
    LClo=LClo,
    hA=hA,
    hB=hB) "Door model used if open door"
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Modelica.Blocks.Sources.Constant constDooOpe(k=kDooOpe) if (yDooFil==true)
    "Constant to choose if the door is open or closed"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Interfaces.RealInput uDooOpe if (yDooFil==false)
    "Connect to file with 0 and 1 values for open or closed door" annotation (
      Placement(transformation(extent={{-140,-18},{-100,22}}),
        iconTransformation(extent={{-140,-18},{-100,22}})));

equation
  connect(port_a1, doo.port_a1) annotation (Line(
      points={{-100,60},{-10,60},{-10,16},{0,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(doo.port_b1, port_b1) annotation (Line(
      points={{20,16},{30,16},{30,60},{100,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(doo.port_b2, port_b2) annotation (Line(
      points={{0,4},{-10,4},{-10,-60},{-100,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(doo.port_a2, port_a2) annotation (Line(
      points={{20,4},{30,4},{30,-60},{100,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(constDooOpe.y, doo.y) annotation (Line(
      points={{-59,30},{-30,30},{-30,10},{-1,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uDooOpe, doo.y) annotation (Line(
      points={{-120,2},{-30,2},{-30,10},{-1,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),                                      defaultComponentName="OpeCloDoo",
              Documentation(
  info="<html>
  Model to define if the door is open or closed between two rooms. For the moment, the model <a href=\"Buildings.Airflow.Multizone.DoorDiscretizedOperable\"> Buildings.Airflow.Multizone.DoorDiscretizedOperable</a> is used. It is possible to define that the door is always open or closed through the constant value <I>kDooOpe</I> (0 if closed, 1 if open) or to define a scenario if the door position changes during the experiment. The scenario should be connected to the real input.
  <br/>
  <h4>Future Work</h4>
  <br/>
  It could be interested to be able to change the model depending on the opening of the door. If the door is closed, the model orifice can be used and if it is open, the door model is still used.
  <br/>
  </html>",
  revisions="<html>
<ul>
<li>
January 29 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end OpenOrClosedDoor;
