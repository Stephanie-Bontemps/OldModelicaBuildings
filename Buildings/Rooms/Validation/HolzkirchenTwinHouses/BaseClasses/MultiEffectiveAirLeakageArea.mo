within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model MultiEffectiveAirLeakageArea
  "Model with all the effective air leakage areas"

  Fluid.Sources.Outside_CpLowRise outNor(
    nPorts=2,
    s=sNor,
    redeclare package Medium = Medium,
    azi=3.1415926535898)
    "Outside boundary using weather data on the North wall"
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-110,-20},{-70,20}}), iconTransformation(extent={{-100,
            -10},{-80,10}})));
  Airflow.Multizone.EffectiveAirLeakageArea leaKit(L=LKit, redeclare package
      Medium = Medium)
    "Effective air leakage area around the window in the kitchen"
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  Airflow.Multizone.EffectiveAirLeakageArea leaLob(L=LLob, redeclare package
      Medium = Medium)
    "Effective air leakage area around the door in the lobby"
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Airflow.Multizone.EffectiveAirLeakageArea leaNorBed(L=LNorBed, redeclare
      package Medium = Medium)
    "Effective air leakage area around the window in the North bedroom"
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Airflow.Multizone.EffectiveAirLeakageArea leaBat(L=LBat, redeclare package
      Medium = Medium)
    "Effective air leakage area around the window in the bathroom"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Airflow.Multizone.EffectiveAirLeakageArea leaSouBed(L=LSouBed, redeclare
      package Medium = Medium)
    "Effective air leakage area around the window in the South bedroom"
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Airflow.Multizone.EffectiveAirLeakageArea leaLivRoo1(L=LLivRoo1, redeclare
      package Medium = Medium)
    "Effective air leakage area around windows 2 and 3 on the South wall of the living room"
    annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  Airflow.Multizone.EffectiveAirLeakageArea leaLivRoo2(L=LLivRoo2, redeclare
      package Medium = Medium)
    "Effective air leakage area around window 1 on the West wall of the living room"
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
  Fluid.Sources.Outside_CpLowRise outEas(
    nPorts=1,
    s=sEas,
    redeclare package Medium = Medium,
    azi=-1.5707963267949)
    "Outside boundary using weather data on the East wall"
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Fluid.Sources.Outside_CpLowRise outSou(
    nPorts=2,
    s=sSou,
    azi=0,
    redeclare package Medium = Medium)
    "Outside boundary using weather data on the South wall"
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Fluid.Sources.Outside_CpLowRise outWes(
    nPorts=2,
    s=sWes,
    redeclare package Medium = Medium,
    azi=1.5707963267949) "Outside boundary using weather data on the West wall"
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  parameter Modelica.SIunits.Area LBat "Effective leakage area of the bathroom";
  parameter Modelica.SIunits.Area LKit "Effective leakage area of the kitchen";
  parameter Modelica.SIunits.Area LLob "Effective leakage area of the lobby";
  parameter Modelica.SIunits.Area LNorBed
    "Effective leakage area of the North bedroom";
  parameter Modelica.SIunits.Area LSouBed
    "Effective leakage area of the South bedroom";
  parameter Modelica.SIunits.Area LLivRoo1
    "Effective leakage area of the windows 2 and 3 on the South wall of the living room";
  parameter Modelica.SIunits.Area LLivRoo2
    "Effective leakage area of window 1 on the West wall of the living room";
  parameter Real sNor
    "Side ratio, s=length of this wall/length of adjacent wall (North)";
  parameter Real sEas
    "Side ratio, s=length of this wall/length of adjacent wall (East)";
  parameter Real sSou
    "Side ratio, s=length of this wall/length of adjacent wall (South)";
  parameter Real sWes
    "Side ratio, s=length of this wall/length of adjacent wall (West)";
  Modelica.Fluid.Interfaces.FluidPorts_b ports_b[7] annotation (Placement(
        transformation(extent={{80,-40},{100,40}}), iconTransformation(extent={{
            80,-40},{100,40}})));
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    annotation (__Dymola_choicesAllMatching=true);
equation
  connect(weaBus, outEas.weaBus) annotation (Line(
      points={{-90,0},{-68,0},{-68,30.2},{-60,30.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus, outNor.weaBus) annotation (Line(
      points={{-90,0},{-68,0},{-68,90.2},{-60,90.2}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus, outSou.weaBus) annotation (Line(
      points={{-90,0},{-68,0},{-68,-29.8},{-60,-29.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus, outWes.weaBus) annotation (Line(
      points={{-90,0},{-68,0},{-68,-89.8},{-60,-89.8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(outNor.ports[1], leaLob.port_a) annotation (Line(
      points={{-40,92},{-20,92},{-20,60},{-10,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(outNor.ports[2], leaNorBed.port_a) annotation (Line(
      points={{-40,88},{-20,88},{-20,30},{-10,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(outEas.ports[1], leaBat.port_a) annotation (Line(
      points={{-40,30},{-26,30},{-26,0},{-10,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(outWes.ports[1], leaLivRoo2.port_a) annotation (Line(
      points={{-40,-88},{-16,-88},{-16,-90},{-10,-90}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(outSou.ports[1], leaSouBed.port_a) annotation (Line(
      points={{-40,-28},{-20,-28},{-20,-30},{-10,-30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(outSou.ports[2], leaLivRoo1.port_a) annotation (Line(
      points={{-40,-32},{-20,-32},{-20,-60},{-10,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(outWes.ports[2], leaKit.port_a) annotation (Line(
      points={{-40,-92},{-16,-92},{-16,90},{-10,90}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ports_b, ports_b) annotation (Line(
      points={{90,0},{90,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaKit.port_b, ports_b[1]) annotation (Line(
      points={{10,90},{50,90},{50,-34.2857},{90,-34.2857}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaLob.port_b, ports_b[2]) annotation (Line(
      points={{10,60},{50,60},{50,-22.8571},{90,-22.8571}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaNorBed.port_b, ports_b[3]) annotation (Line(
      points={{10,30},{50,30},{50,-11.4286},{90,-11.4286}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaBat.port_b, ports_b[4]) annotation (Line(
      points={{10,0},{90,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaSouBed.port_b, ports_b[5]) annotation (Line(
      points={{10,-30},{50,-30},{50,11.4286},{90,11.4286}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaLivRoo1.port_b, ports_b[6]) annotation (Line(
      points={{10,-60},{50,-60},{50,22.8571},{90,22.8571}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(leaLivRoo2.port_b, ports_b[7]) annotation (Line(
      points={{10,-90},{50,-90},{50,34.2857},{90,34.2857}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{-94,106},{94,138}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name"), Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,0})}), defaultComponentName="MulAirLea",
              Documentation(
  info="<html>
  Model for all the effective air leakage areas in a house with their associated outside boundary. The effective air leakage area in each room are supposed to be around the windows and they are modeled using an instance of <a href=\"Buildings.Airflow.Multizone.EffectiveAirLeakageArea\">
  Buildings.Airflow.Multizone.EffectiveAirLeakageArea</a>.<br/>
  <br/>
  The effective air leakage area is calculated for each window. The infiltration rate n<sub>50</sub> (measured using the blower door for the whole ground floor) was used to calculate the predicted airflow rate.<br/>
  Then, a global effective air leakage area is calculated for the whole building (ASHRAE, 1997):
  <PRE> A<sub>L</sub> = 1000 * Q<sub>r</sub> * &radic;&rho;/&Delta;p<sub>r</sub> / C<sub>D</sub> </PRE>
  <br/>
  <br/>
  Where <code>A<sub>L</sub></code> is the effective air leakage area in cm<sup>2</sup>, <code>Q<sub>r</sub></code> the predicted airflow rate at the reference pressure difference <code>&Delta;p<sub>r</sub></code>, <code>&rho;</code>, the air density in kg/m<sup>3</sup> and <code>C<sub>D</sub></code>, the discharge coefficient.
  <br/>
  <br/>
  This total effective air leakage area is then distributed in each room, proportionally to the windows perimeter.
  <br/>
  <br/>
  The outside boundary is modeled for each wall orientation using an instance of <a href=\"Buildings.Fluid.Sources.Outside_CpLowRise\">
  Buildings.Fluid.Sources.Outside_CpLowRise</a>. So the effective air leakage area of the window on the West wall in the living room and of the windows on the South wall are individually calculated.
  
  <h4> References</h4>
  <ul>
  <li>
  <I>ASHRAE Handbook Fundamentals</I>, 1997.
  </html>",
  revisions="<html>
  <ul>
  <li>
  January 28 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end MultiEffectiveAirLeakageArea;
