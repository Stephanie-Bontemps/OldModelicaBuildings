within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses;
package BaseClasses
  "Package with base classes for Buildings.Rooms.Validation.HolzkirchenTwinHouses"
extends Modelica.Icons.BasesPackage;
  model ThermalBridge "Thermal bridge description using a conduction model"

    Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=g)
      "Value of global thermal bridges conductance"
             annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
      prescribedTemperature "Outer temperature boundary condition"
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b1
      "Inner temperature boundary condition"                    annotation (
        Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
            extent={{90,-10},{110,10}})));
    Buildings.BoundaryConditions.WeatherData.Bus           weaBus
      "Outer temperature"
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}}),
          iconTransformation(extent={{-100,-10},{-80,10}})));
    parameter Modelica.SIunits.ThermalConductance g
      "Constant thermal conductance of thermal bridge";
  equation
    connect(thermalConductor.port_b,port_b1)  annotation (Line(
        points={{40,0},{100,0}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(prescribedTemperature.port,thermalConductor. port_a) annotation (Line(
        points={{-20,0},{20,0}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(prescribedTemperature.T, weaBus.TDryBul) annotation (Line(
        points={{-42,0},{-90,0}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-94,108},{94,140}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}), defaultComponentName="theBri",
                Documentation(
    info="<html>
  Model for thermal bridges in a room considering a conduction model where the thermal element transportes heat without storing it.
  </html>",
    revisions="<html>
<ul>
<li>
January 26 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
  end ThermalBridge;

  model MultiThermalBridge "Model of all the thermal bridges in a house"

    ThermalBridge theBriKit(g=gKit) "Thermal bridge conductance of the kitchen"
      annotation (Placement(transformation(extent={{-20,80},{0,100}})));
    ThermalBridge theBriLob(g=gLob) "Thermal bridge conductance of the lobby"
      annotation (Placement(transformation(extent={{-20,50},{0,70}})));
    ThermalBridge theBriNorBed(g=gNorBed)
      "Thermal bridge conductance of the North bedroom"
      annotation (Placement(transformation(extent={{-20,20},{0,40}})));
    ThermalBridge theBriCor(g=gCor)
      "Thermal bridge conductance of the corridor"
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    ThermalBridge theBriBat(g=gBat)
      "Thermal bridge conductance of the bathroom"
      annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
    ThermalBridge theBriSouBed(g=gSouBed)
      "Thermal bridge conductance of the South bedroom"
      annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
    ThermalBridge theBriLivRoo(g=gLivRoo)
      "Thermal bridge conductance of the living room"
      annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
    BoundaryConditions.WeatherData.Bus weaBus "Outer temperature"
                                              annotation (Placement(
          transformation(extent={{-110,-20},{-70,20}}), iconTransformation(extent=
             {{-100,-10},{-80,10}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b[7]
      "Inner temperature boundary condition in each room"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}),
          iconTransformation(extent={{90,-10},{110,10}})));
    parameter Modelica.SIunits.ThermalConductance gKit
      "Constant thermal conductance of thermal bridge";
    parameter Modelica.SIunits.ThermalConductance gLob
      "Constant thermal conductance of thermal bridge";
    parameter Modelica.SIunits.ThermalConductance gNorBed
      "Constant thermal conductance of thermal bridge";
    parameter Modelica.SIunits.ThermalConductance gCor
      "Constant thermal conductance of thermal bridge";
    parameter Modelica.SIunits.ThermalConductance gBat
      "Constant thermal conductance of thermal bridge";
    parameter Modelica.SIunits.ThermalConductance gSouBed
      "Constant thermal conductance of thermal bridge";
    parameter Modelica.SIunits.ThermalConductance gLivRoo
      "Constant thermal conductance of thermal bridge";
  equation
    connect(weaBus, theBriKit.weaBus) annotation (Line(
        points={{-90,0},{-56,0},{-56,90},{-19,90}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(weaBus, theBriLob.weaBus) annotation (Line(
        points={{-90,0},{-56,0},{-56,60},{-19,60}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(weaBus, theBriNorBed.weaBus) annotation (Line(
        points={{-90,0},{-56,0},{-56,30},{-19,30}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(weaBus, theBriCor.weaBus) annotation (Line(
        points={{-90,0},{-19,0}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(weaBus, theBriBat.weaBus) annotation (Line(
        points={{-90,0},{-56,0},{-56,-30},{-19,-30}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(weaBus, theBriSouBed.weaBus) annotation (Line(
        points={{-90,0},{-56,0},{-56,-60},{-19,-60}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(weaBus, theBriLivRoo.weaBus) annotation (Line(
        points={{-90,0},{-56,0},{-56,-90},{-19,-90}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(theBriKit.port_b1,port_b [1]) annotation (Line(
        points={{0,90},{42,90},{42,-8.57143},{100,-8.57143}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriLob.port_b1,port_b [2]) annotation (Line(
        points={{0,60},{42,60},{42,-5.71429},{100,-5.71429}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriNorBed.port_b1,port_b [3]) annotation (Line(
        points={{0,30},{42,30},{42,-2.85714},{100,-2.85714}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCor.port_b1,port_b [4]) annotation (Line(
        points={{0,0},{100,0}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriBat.port_b1,port_b [5]) annotation (Line(
        points={{0,-30},{42,-30},{42,2.85714},{100,2.85714}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriSouBed.port_b1,port_b [6]) annotation (Line(
        points={{0,-60},{42,-60},{42,5.71429},{100,5.71429}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriLivRoo.port_b1,port_b [7]) annotation (Line(
        points={{0,-90},{42,-90},{42,8.57143},{100,8.57143}},
        color={191,0,0},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                                 Rectangle(extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-96,106},{92,138}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
              defaultComponentName="mulTherBri",
                Documentation(
    info="<html>
  Model for all the thermal bridges in a house. The thermal bridges in each room are modeled using an instance of <a href=\"Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses.ThermalBridge\">
Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses.ThermalBridge</a>.
  </html>",
    revisions="<html>
<ul>
<li>
January 26 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
  end MultiThermalBridge;

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
    parameter Modelica.SIunits.Area LClo=1e-06
      "Effective leakage area if door model is used";

    parameter Modelica.SIunits.Length hA=0
      "Height of reference pressure zone A";
    parameter Modelica.SIunits.Length hB=0
      "Height of reference pressure zone B";

    Airflow.Multizone.DoorDiscretizedOperable doo(
      wOpe=wOpe,
      hOpe=hOpe,
      redeclare package Medium = MediumB,
      LClo=LClo,
      hA=hA,
      hB=hB,
      dpCloRat(displayUnit="Pa"),
      mClo=0.5,
      CDOpe=0.78,
      mOpe=0.78,
      forceErrorControlOnFlow=true,
      dp_turbulent(displayUnit="Pa")) "Door model used if open door"
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
  Model to define if the door is open or closed between two rooms. For the moment, the model <a href=\"Buildings.Airflow.Multizone.DoorDiscretizedOperable\"> Buildings.Airflow.Multizone.DoorDiscretizedOperable</a> is used. 
  It is possible to define that the door is always open or closed through the constant value <I>kDooOpe</I> (0 if closed, 1 if open) or to define a scenario if the door position changes during the experiment. 
  The scenario should be connected to the real input.
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

  model MultiEffectiveAirLeakageArea
    "Model with all the effective air leakage areas"

    replaceable package MediumB = Modelica.Media.Interfaces.PartialMedium
      annotation (__Dymola_choicesAllMatching=true);
    parameter Modelica.SIunits.Area LKit
      "Effective leakage area of the kitchen";
    parameter Modelica.SIunits.Area LLob "Effective leakage area of the lobby";
    parameter Modelica.SIunits.Area LNorBed
      "Effective leakage area of the North bedroom";
    parameter Modelica.SIunits.Area LBat
      "Effective leakage area of the bathroom";
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

    Fluid.Sources.Outside_CpLowRise outNor(
      nPorts=2,
      s=sNor,
      redeclare package Medium = MediumB,
      azi=Buildings.Types.Azimuth.N)
      "Outside boundary using weather data on the North wall"
      annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
    BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
          transformation(extent={{-110,-20},{-70,20}}), iconTransformation(extent={{-100,
              -10},{-80,10}})));
    Airflow.Multizone.EffectiveAirLeakageArea leaKit(L=LKit, redeclare package
        Medium = MediumB,
      m=0.5) "Effective air leakage area around the window in the kitchen"
      annotation (Placement(transformation(extent={{-10,80},{10,100}})));
    Airflow.Multizone.EffectiveAirLeakageArea leaLob(L=LLob, redeclare package
        Medium = MediumB,
      m=0.5) "Effective air leakage area around the door in the lobby"
      annotation (Placement(transformation(extent={{-10,50},{10,70}})));
    Airflow.Multizone.EffectiveAirLeakageArea leaNorBed(L=LNorBed, redeclare
        package Medium = MediumB,
      m=0.5)
      "Effective air leakage area around the window in the North bedroom"
      annotation (Placement(transformation(extent={{-10,20},{10,40}})));
    Airflow.Multizone.EffectiveAirLeakageArea leaBat(L=LBat, redeclare package
        Medium = MediumB,
      m=0.5) "Effective air leakage area around the window in the bathroom"
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Airflow.Multizone.EffectiveAirLeakageArea leaSouBed(L=LSouBed, redeclare
        package Medium = MediumB,
      m=0.5)
      "Effective air leakage area around the window in the South bedroom"
      annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
    Airflow.Multizone.EffectiveAirLeakageArea leaLivRoo1(L=LLivRoo1, redeclare
        package Medium = MediumB,
      m=0.5)
      "Effective air leakage area around windows 2 and 3 on the South wall of the living room"
      annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
    Airflow.Multizone.EffectiveAirLeakageArea leaLivRoo2(L=LLivRoo2, redeclare
        package Medium = MediumB,
      m=0.5)
      "Effective air leakage area around window 1 on the West wall of the living room"
      annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
    Fluid.Sources.Outside_CpLowRise outEas(
      nPorts=1,
      s=sEas,
      redeclare package Medium = MediumB,
      azi=Buildings.Types.Azimuth.E)
      "Outside boundary using weather data on the East wall"
      annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
    Fluid.Sources.Outside_CpLowRise outSou(
      nPorts=2,
      s=sSou,
      azi=Buildings.Types.Azimuth.S,
      redeclare package Medium = MediumB)
      "Outside boundary using weather data on the South wall"
      annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
    Fluid.Sources.Outside_CpLowRise outWes(
      nPorts=2,
      s=sWes,
      redeclare package Medium = MediumB,
      azi=Buildings.Types.Azimuth.W)
      "Outside boundary using weather data on the West wall"
      annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));

    Modelica.Fluid.Interfaces.FluidPorts_b ports_b[7](redeclare package Medium
        = MediumB)                                    annotation (Placement(
          transformation(extent={{80,-40},{100,40}}), iconTransformation(extent={{
              80,-40},{100,40}})));

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
              lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
                                    defaultComponentName="MulAirLea",
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

  block Separate "Divide the input in two outputs"
    extends Modelica.Blocks.Icons.Block;

    parameter Real k1=0.5 "Gain of upper output";
    parameter Real k2=0.5 "Gain of lower output";
    Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
        rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y1
      "Connector 1 of Real output signals"
      annotation (Placement(transformation(extent={{100,40},{120,60}},
        rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y2
      "Connector 2 of Real output signals"
      annotation (Placement(transformation(extent={{100,-60},{120,-40}},
        rotation=0)));
  equation
    y1 = k1*u;
    y2 = k2*u;

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), defaultComponentName="separate",
                Documentation(
    info="<html>
  Model to separate the input in two outputs according to the coefficients <CODE>k1</CODE> and <CODE>k2</CODE>.
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

  model HeatingCoolingSchedule
    "Heating and cooling experimental schedule using imposed constant temperature or imposed heat or cooling power"

    Modelica.Blocks.Interfaces.RealInput heaCooFlo
      "Heat or cooling power input applied depending on the scenario" annotation (
       Placement(transformation(extent={{-220,70},{-180,110}}),
          iconTransformation(extent={{-220,70},{-180,110}})));
    HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloCon
      "Prescribed heat or cooling flow for the convective part"
      annotation (Placement(transformation(extent={{100,40},{120,60}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bCon
      "Convective split" annotation (Placement(transformation(extent={{170,40},{190,
              60}}), iconTransformation(extent={{170,40},{190,60}})));
    HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRad
      "Prescribed heat or cooling flow for the radiative part"
      annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bRad
      "Radiative split" annotation (Placement(transformation(extent={{170,-60},{190,
              -40}}), iconTransformation(extent={{170,-60},{190,-40}})));
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
      annotation (Placement(transformation(extent={{100,-120},{120,-100}})));
    Modelica.Blocks.Math.Mean TRooHou(f=1/3600, y(start=293.15))
      "Hourly averaged room air temperature"
      annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
    parameter Boolean startValue=false
      "Start value of y. At time = table[1], y changes to 'not startValue'";
    //parameter Modelica.SIunits.Time table[:]={0,1}
    //  "Vector of time points. At every time point, the output y gets its opposite value (e.g., table={0,1}). 0 = Temperature set point and 1 = Heat or cooling flow imposed";
    parameter Real kHea=1E6
      "Gain value multiplied with input signal for heating";
    parameter Real kCoo=-1E6
      "Gain value multiplied with input signal for cooling";

    Modelica.Blocks.Logical.Switch switch1
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bTSet
      "Measured temperature for the set point"
                         annotation (Placement(transformation(extent={{170,-10},{190,
              10}}), iconTransformation(extent={{170,-10},{190,10}})));
    Modelica.Blocks.Interfaces.RealInput schChoice
      "Temperature set point or heating and cooling power" annotation (Placement(
          transformation(extent={{-220,-20},{-180,20}}), iconTransformation(
            extent={{-220,-20},{-180,20}})));
    Modelica.Blocks.Math.RealToBoolean realToBoolean
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  equation
    connect(separate.y2, preHeaCooFloRad.Q_flow) annotation (Line(
        points={{81,-5},{90,-5},{90,-50},{100,-50}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(separate.y1, preHeaCooFloCon.Q_flow) annotation (Line(
        points={{81,5},{90,5},{90,50},{100,50}},
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
        points={{120,-50},{180,-50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(TRooAir.T,TRooHou. u) annotation (Line(
        points={{120,-110},{138,-110}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TRooAir.T, conHea.u_m) annotation (Line(
        points={{120,-110},{120,-70},{-150,-70},{-150,-62}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TRooAir.T, conCoo.u_m) annotation (Line(
        points={{120,-110},{120,-150},{-150,-150},{-150,-142}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(switch1.y, separate.u) annotation (Line(
        points={{41,0},{58,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaCooFlo, switch1.u1) annotation (Line(
        points={{-200,90},{10,90},{10,8},{18,8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sum1.y, switch1.u3) annotation (Line(
        points={{1,-90},{10,-90},{10,-8},{18,-8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(preHeaCooFloCon.port, port_bCon) annotation (Line(
        points={{120,50},{180,50}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(port_bTSet, TRooAir.port) annotation (Line(
        points={{180,0},{180,-20},{140,-20},{140,-60},{80,-60},{80,-110},{100,-110}},
        color={191,0,0},
        smooth=Smooth.None));

    connect(realToBoolean.y, switch1.u2) annotation (Line(
        points={{-79,0},{18,0}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(schChoice, realToBoolean.u) annotation (Line(
        points={{-200,0},{-102,0}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,
              -180},{180,180}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-180,-180},{180,180}}), graphics={
                                 Rectangle(extent={{-180,180},{180,-180}},
              lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-90,194},{98,226}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="%name")}),  defaultComponentName="heaCooSch",
                Documentation(
    info="<html>
  Model to choose the kind of scenario used depending on the period in the experiment. A constant temperature set point can be used if boolean=false or an imposed heat or cooling power if boolean=true.
  <br/>
  The constant temperature set point is applied comparing the set point to the air temperature in the room.Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses.HeatingCoolingSchedule
  <br/>
  Once the heat or cooling heat flow defined, it is separated between a radiative (30%) and a convective (70%) parts.
  <br/>
  This model can be used for one room. 
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

  model TemperatureSetPoint
    "Model to heat or to cool a room considering a temperature set point"
    parameter Real kHea=1E6
      "Gain value multiplied with input signal for heating";
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
            textString="%name")}), defaultComponentName="TSetPoi",
                Documentation(
    info="<html>
  Model to heat or to cool a room with an imposed temperature.
  </html>",
    revisions="<html>
<ul>
<li>
February 2 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
  end TemperatureSetPoint;

  model MultiHeatingCoolingSchedule
    "Heating and cooling experimental schedule using imposed constant temperature or imposed heat or cooling power for all the rooms"

    parameter Real kHea=1E6
      "Gain value multiplied with input signal for heating";
    parameter Real kCoo=-1E6
      "Gain value multiplied with input signal for cooling";

    Modelica.Blocks.Math.RealToBoolean       booTabTorFlo[7](each threshold=0.5)
      "Boolean table to choose the scenario(constant temperature set point or imposed heat flow)"
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
    Modelica.Blocks.Interfaces.RealInput heaCooFlo[7]
      "Heat or cooling power input applied depending on the scenario" annotation (
       Placement(transformation(extent={{-180,50},{-140,90}}), iconTransformation(
            extent={{-180,50},{-140,90}})));
    HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloCon[7]
      "Prescribed heat or cooling flow for the convective part"
      annotation (Placement(transformation(extent={{80,20},{100,40}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bCon[7]
      "Convective split" annotation (Placement(transformation(extent={{130,20},{150,
              40}}), iconTransformation(extent={{130,20},{150,40}})));
    HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRad[7]
      "Prescribed heat or cooling flow for the radiative part"
      annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bRad[7]
      "Radiative split" annotation (Placement(transformation(extent={{130,-40},
              {150,-20}}),
                      iconTransformation(extent={{130,-40},{150,-20}})));
    Separate sep[7](each k1=0.7, each k2=0.3)
      "y1: convective part and y2: radiative part"
      annotation (Placement(transformation(extent={{40,-10},{60,10}})));
    Modelica.Blocks.Interfaces.RealInput TSetHea[7]
      "Heating temperature set point input applied depending on the scenario"
      annotation (Placement(transformation(extent={{-180,-50},{-140,-10}}),
          iconTransformation(extent={{-180,-80},{-140,-40}})));
    Modelica.Blocks.Interfaces.RealInput TSetCoo[7]
      "Cooling temperature set point input applied depending on the scenario"
      annotation (Placement(transformation(extent={{-180,-140},{-140,-100}}),
          iconTransformation(extent={{-180,-140},{-140,-100}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TRooAir[7]
      "Room air temperature"
      annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));

    Modelica.Blocks.Logical.Switch swi[7]
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bTSet[7]
      "Calculated temperature used for the set point" annotation (Placement(
          transformation(extent={{-150,-100},{-130,-80}}),iconTransformation(
            extent={{-150,-100},{-130,-80}})));
    TemperatureSetPoint TSetPoi[7](each kHea=kHea, each kCoo=kCoo)
      "Temperature set point"
      annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
    Modelica.Blocks.Interfaces.RealInput schChoice[7]
      "Temperature set point or heating and cooling power" annotation (Placement(
          transformation(extent={{-180,-20},{-140,20}}), iconTransformation(
            extent={{-180,-20},{-140,20}})));
  equation

    connect(port_bTSet, TRooAir.port) annotation (Line(
        points={{-140,-90},{-130,-90},{-130,-60},{-120,-60}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(TSetHea, TSetPoi.TSetHea) annotation (Line(
        points={{-160,-30},{-80,-30},{-80,-14},{-42,-14}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TRooAir.T, TSetPoi.TRooAir) annotation (Line(
        points={{-100,-60},{-70,-60},{-70,-20},{-42,-20}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TSetCoo, TSetPoi.TSetCoo) annotation (Line(
        points={{-160,-120},{-60,-120},{-60,-26},{-42,-26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TSetPoi.y, swi.u3) annotation (Line(
        points={{-19,-20},{-10,-20},{-10,-8},{-2,-8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaCooFlo, swi.u1) annotation (Line(
        points={{-160,70},{-10,70},{-10,8},{-2,8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(swi.y, sep.u) annotation (Line(
        points={{21,0},{38,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sep.y2, preHeaCooFloRad.Q_flow) annotation (Line(
        points={{61,-5},{69.5,-5},{69.5,-30},{80,-30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sep.y1, preHeaCooFloCon.Q_flow) annotation (Line(
        points={{61,5},{70.5,5},{70.5,30},{80,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(preHeaCooFloRad.port, port_bRad) annotation (Line(
        points={{100,-30},{140,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(preHeaCooFloCon.port, port_bCon) annotation (Line(
        points={{100,30},{140,30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(booTabTorFlo.y, swi.u2) annotation (Line(
        points={{-79,0},{-2,0}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(schChoice, booTabTorFlo.u) annotation (Line(
        points={{-160,0},{-102,0}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
              -140},{140,140}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-140,-140},{140,140}}), graphics={
                                 Rectangle(extent={{-140,140},{140,-140}},
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

  block ReaderWeatherFile2
    "Reader for measured weather data with new model for the calculation of the direct normal radiation"

    parameter Boolean computeWetBulbTemperature = true
      "If true, then this model computes the wet bulb temperature"
      annotation(Evaluate=true);
    //--------------------------------------------------------------
    // Atmospheric pressure
    parameter Modelica.SIunits.Pressure pAtm=101325
      "Atmospheric pressure (used if pAtmSou=Parameter)"
      annotation (Dialog(group="Data source"));
    //--------------------------------------------------------------
    // Ceiling height
    parameter Real ceiHei(
      final quantity="Height",
      final unit="m",
      displayUnit="m") = 20000 "Ceiling height (used if ceiHei=Parameter)"
      annotation (Dialog(group="Data source"));
    //--------------------------------------------------------------
    // Total sky cover
    parameter Real totSkyCov(
      min=0,
      max=1,
      unit="1") = 0.5
      "Total sky cover (used if totSkyCov=Parameter). Use 0 <= totSkyCov <= 1"
      annotation (Dialog(group="Data source"));
    // Opaque sky cover
    parameter Real opaSkyCov(
      min=0,
      max=1,
      unit="1") = 0.5
      "Opaque sky cover (used if opaSkyCov=Parameter). Use 0 <= opaSkyCov <= 1"
      annotation (Dialog(group="Data source"));
    //--------------------------------------------------------------
    // Dew point temperature
    parameter Modelica.SIunits.Temperature TDewPoi(displayUnit="degC") = 283.15
      "Dew point temperature (used if TDewPoi=Parameter)"
      annotation (Dialog(group="Data source"));
    //--------------------------------------------------------------

    parameter String filNam="" "Name of weather data file" annotation (Dialog(
          __Dymola_loadSelector(caption="Select weather file")));
    parameter Modelica.SIunits.Angle lon(displayUnit="deg") "Longitude";
    parameter Modelica.SIunits.Angle lat(displayUnit="deg") "Latitude";
    parameter Modelica.SIunits.Time timZon(displayUnit="h") "Time zone";
    BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus" annotation (
        Placement(transformation(extent={{294,-10},{314,10}}), iconTransformation(
            extent={{190,-10},{210,10}})));

    parameter Buildings.BoundaryConditions.Types.SkyTemperatureCalculation
      calTSky=Buildings.BoundaryConditions.Types.SkyTemperatureCalculation.TemperaturesAndSkyCover
      "Computation of black-body sky temperature" annotation (
      choicesAllMatching=true,
      Evaluate=true,
      Dialog(group="Sky temperature"));

    constant Real epsCos = 1e-6 "Small value to avoid division by 0";

  protected
    Modelica.Blocks.Tables.CombiTable1Ds datRea(
      final tableOnFile=true,
      final tableName="tab1",
      final fileName=Buildings.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(filNam),
      final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
      final columns={2,11,12,13}) "Data reader"
      annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.CheckTemperature
      cheTemDryBul "Check dry bulb temperature "
      annotation (Placement(transformation(extent={{160,-200},{180,-180}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.CheckTemperature
      cheTemDewPoi "Check dew point temperature"
      annotation (Placement(transformation(extent={{160,-240},{180,-220}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.ConvertRelativeHumidity
      conRelHum "Convert the relative humidity from percentage to [0, 1] "
      annotation (Placement(transformation(extent={{120,20},{140,40}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckPressure chePre
      "Check the air pressure"
      annotation (Placement(transformation(extent={{160,60},{180,80}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckSkyCover cheTotSkyCov
      "Check the total sky cover"
      annotation (Placement(transformation(extent={{160,-40},{180,-20}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckSkyCover cheOpaSkyCov
      "Check the opaque sky cover"
      annotation (Placement(transformation(extent={{162,-160},{182,-140}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheGloHorRad
      "Check the global horizontal radiation"
      annotation (Placement(transformation(extent={{160,160},{180,180}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDifHorRad
      "Check the diffuse horizontal radiation"
      annotation (Placement(transformation(extent={{160,120},{180,140}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheDirNorRad
      "Check the direct normal radiation"
      annotation (Placement(transformation(extent={{160,200},{180,220}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckCeilingHeight cheCeiHei
      "Check the ceiling height"
      annotation (Placement(transformation(extent={{160,-120},{180,-100}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckWindSpeed cheWinSpe
      "Check the wind speed"
      annotation (Placement(transformation(extent={{160,-80},{180,-60}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckRadiation cheHorRad
      "Check the horizontal radiation"
      annotation (Placement(transformation(extent={{160,240},{180,260}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckWindDirection cheWinDir
      "Check the wind direction"
      annotation (Placement(transformation(extent={{160,-280},{180,-260}})));
    BoundaryConditions.SkyTemperature.BlackBody TBlaSky(final calTSky=calTSky)
      "Check the sky black-body temperature"
      annotation (Placement(transformation(extent={{240,-220},{260,-200}})));
    Utilities.Time.ModelTime modTim "Simulation time"
      annotation (Placement(transformation(extent={{-180,-10},{-160,10}})));
    Modelica.Blocks.Math.Add add
      "Add 30 minutes to time to shift weather data reader"
      annotation (Placement(transformation(extent={{-140,160},{-120,180}})));
    Modelica.Blocks.Sources.Constant con30mins(final k=1800)
      "Constant used to shift weather data reader"
      annotation (Placement(transformation(extent={{-180,192},{-160,212}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.LocalCivilTime locTim(
        final lon=lon, final timZon=timZon) "Local civil time"
      annotation (Placement(transformation(extent={{-120,-160},{-100,-140}})));
    Modelica.Blocks.Tables.CombiTable1Ds datRea1(
      final tableOnFile=true,
      final tableName="tab1",
      final fileName=Buildings.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(filNam),
      final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
      final columns={3,4,9}) "Data reader"
      annotation (Placement(transformation(extent={{-80,160},{-60,180}})));
    Buildings.BoundaryConditions.WeatherData.BaseClasses.ConvertTime conTim1
      "Convert simulation time to calendar time"
      annotation (Placement(transformation(extent={{-110,160},{-90,180}})));
    BoundaryConditions.WeatherData.BaseClasses.ConvertTime conTim
      "Convert simulation time to calendar time"
      annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
    BoundaryConditions.WeatherData.BaseClasses.EquationOfTime eqnTim
      "Equation of time"
      annotation (Placement(transformation(extent={{-120,-120},{-100,-100}})));
    BoundaryConditions.WeatherData.BaseClasses.SolarTime solTim "Solar time"
      annotation (Placement(transformation(extent={{-80,-140},{-60,-120}})));
    // Conditional connectors
    Modelica.Blocks.Interfaces.RealInput pAtm_in_internal(
      final quantity="Pressure",
      final unit="Pa",
      displayUnit="bar") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput ceiHei_in_internal(
      final quantity="Height",
      final unit="m",
      displayUnit="m") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput totSkyCov_in_internal(
      final quantity="1",
      min=0,
      max=1) "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput opaSkyCov_in_internal(
      final quantity="1",
      min=0,
      max=1) "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput TDryBul_in_internal(
      final quantity="ThermodynamicTemperature",
      final unit="K",
      displayUnit="degC") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput TDewPoi_in_internal(
      final quantity="ThermodynamicTemperature",
      final unit="K",
      displayUnit="degC") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput relHum_in_internal(
      final quantity="1",
      min=0,
      max=1) "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput winSpe_in_internal(
      final quantity="Velocity",
      final unit="m/s") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput winDir_in_internal(
      final quantity="Angle",
      final unit="rad",
      displayUnit="deg") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput HGloHor_in_internal(
      final quantity="RadiantEnergyFluenceRate",
      final unit="W/m2") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput HDifHor_in_internal(
      final quantity="RadiantEnergyFluenceRate",
      final unit="W/m2") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput HDirNor_in_internal(
      final quantity="RadiantEnergyFluenceRate",
      final unit="W/m2") "Needed to connect to conditional connector";
    Modelica.Blocks.Interfaces.RealInput HInfHor_in_internal(
      final quantity="RadiantEnergyFluenceRate",
      final unit="W/m2") "Needed to connect to conditional connector";

    Modelica.Blocks.Math.UnitConversions.From_deg conWinDir
      "Convert the wind direction unit from [deg] to [rad]"
      annotation (Placement(transformation(extent={{120,-280},{140,-260}})));
    Modelica.Blocks.Math.UnitConversions.From_degC conTDryBul
      annotation (Placement(transformation(extent={{120,-200},{140,-180}})));
    BoundaryConditions.WeatherData.BaseClasses.ConvertRadiation conHorRad
      annotation (Placement(transformation(extent={{120,240},{140,260}})));
   BoundaryConditions.WeatherData.BaseClasses.ConvertRadiation conGloHorRad
      annotation (Placement(transformation(extent={{120,160},{140,180}})));
    BoundaryConditions.WeatherData.BaseClasses.ConvertRadiation conDifHorRad
      annotation (Placement(transformation(extent={{120,120},{140,140}})));
    BoundaryConditions.WeatherData.BaseClasses.CheckRelativeHumidity cheRelHum
      annotation (Placement(transformation(extent={{160,20},{180,40}})));
    BoundaryConditions.SolarGeometry.BaseClasses.AltitudeAngle altAng
      "Solar altitude angle"
      annotation (Placement(transformation(extent={{-30,-280},{-10,-260}})));
     BoundaryConditions.SolarGeometry.BaseClasses.ZenithAngle zenAng(final lat=
          lat) "Zenith angle"
      annotation (Placement(transformation(extent={{-80,-226},{-60,-206}})));
     BoundaryConditions.SolarGeometry.BaseClasses.Declination decAng
      "Declination angle"
      annotation (Placement(transformation(extent={{-140,-220},{-120,-200}})));
     BoundaryConditions.SolarGeometry.BaseClasses.SolarHourAngle solHouAng
      annotation (Placement(transformation(extent={{-140,-250},{-120,-230}})));
    Modelica.Blocks.Sources.Constant latitude(final k=lat) "Latitude"
      annotation (Placement(transformation(extent={{-180,-280},{-160,-260}})));
    Modelica.Blocks.Sources.Constant longitude(final k=lon) "Longitude"
      annotation (Placement(transformation(extent={{-140,-280},{-120,-260}})));

    //---------------------------------------------------------------------------
    // Optional instanciation of a block that computes the wet bulb temperature.
    // This block may be needed for evaporative cooling towers.
    // By default, it is enabled. This introduces a nonlinear equation, but
    // we have not observed an increase in computing time because of this equation.
    Buildings.Utilities.Psychrometrics.TWetBul_TDryBulPhi tWetBul_TDryBulXi(
        redeclare package Medium = Buildings.Media.PerfectGases.MoistAir,
        TDryBul(displayUnit="degC")) if computeWetBulbTemperature
      annotation (Placement(transformation(extent={{244,-66},{264,-46}})));

  equation
    //---------------------------------------------------------------------------
    // Atmospheric pressure connector
    pAtm_in_internal = pAtm;
    connect(pAtm_in_internal, chePre.PIn);
    //---------------------------------------------------------------------------
    // Ceiling height connector
    ceiHei_in_internal = ceiHei;
    connect(ceiHei_in_internal, cheCeiHei.ceiHeiIn);
    //---------------------------------------------------------------------------
    // Total sky cover connector
    totSkyCov_in_internal = totSkyCov;
    connect(totSkyCov_in_internal, cheTotSkyCov.nIn);
    //---------------------------------------------------------------------------
    // Opaque sky cover connector
    opaSkyCov_in_internal = opaSkyCov;
    connect(opaSkyCov_in_internal, cheOpaSkyCov.nIn);
    //---------------------------------------------------------------------------
    // Dew point temperature connector
    TDewPoi_in_internal = TDewPoi;
    connect(TDewPoi_in_internal, cheTemDewPoi.TIn);
    //---------------------------------------------------------------------------
    // Dry bulb temperature connector
    connect(conTDryBul.y, TDryBul_in_internal);
    connect(TDryBul_in_internal, cheTemDryBul.TIn);
    //---------------------------------------------------------------------------
    // Relative humidity connector
    connect(conRelHum.relHumOut, relHum_in_internal);
    connect(relHum_in_internal, cheRelHum.relHumIn);
    //---------------------------------------------------------------------------
    // Wind speed connector
    connect(datRea.y[2], winSpe_in_internal);
    connect(winSpe_in_internal, cheWinSpe.winSpeIn);
    //---------------------------------------------------------------------------
    // Wind direction connector
    connect(conWinDir.y, winDir_in_internal);
    connect(winDir_in_internal, cheWinDir.nIn);
    //---------------------------------------------------------------------------
    // Global horizontal radiation connector
    connect(conGloHorRad.HOut, HGloHor_in_internal)
      "Get HGloHor using weather data file";
    connect(HGloHor_in_internal, cheGloHorRad.HIn);
    //---------------------------------------------------------------------------
    // Diffuse horizontal radiation connector
    connect(conDifHorRad.HOut, HDifHor_in_internal)
      "Get HDifHor using weather data file";
    connect(HDifHor_in_internal, cheDifHorRad.HIn);
    //---------------------------------------------------------------------------
    // Direct normal radiation connector
    TestWeatherFileReaderDraft.smoothMaxNew(
        x1=(cheGloHorRad.HIn - cheDifHorRad.HIn)/cos(zenAng.zen),
        x2=epsCos,
        comp=cos(zenAng.zen),
        deltaX=0.1*epsCos) = HDirNor_in_internal
      "Calculate the HDirNor using HGloHor and HDifHor according to (A.4.14) and (A.4.15)";
    connect(HDirNor_in_internal, cheDirNorRad.HIn);
    //---------------------------------------------------------------------------
    // Infrared radiation connector
    connect(conHorRad.HOut, HInfHor_in_internal);
    connect(HInfHor_in_internal, cheHorRad.HIn);

    connect(chePre.POut, weaBus.pAtm) annotation (Line(
        points={{181,70},{220,70},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheTotSkyCov.nOut, weaBus.nTot) annotation (Line(
        points={{181,-30},{220,-30},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheOpaSkyCov.nOut, weaBus.nOpa) annotation (Line(
        points={{183,-150},{220,-150},{220,5.55112e-016},{304,5.55112e-016}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheGloHorRad.HOut, weaBus.HGloHor) annotation (Line(
        points={{181,170},{220,170},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheDifHorRad.HOut, weaBus.HDifHor) annotation (Line(
        points={{181,130},{220,130},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheDirNorRad.HOut, weaBus.HDirNor) annotation (Line(
        points={{181,210},{220,210},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheCeiHei.ceiHeiOut, weaBus.celHei) annotation (Line(
        points={{181,-110},{220,-110},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheWinSpe.winSpeOut, weaBus.winSpe) annotation (Line(
        points={{181,-70},{220,-70},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheHorRad.HOut, weaBus.radHorIR) annotation (Line(
        points={{181,250},{220,250},{220,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheWinDir.nOut, weaBus.winDir) annotation (Line(
        points={{181,-270},{280,-270},{280,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheOpaSkyCov.nOut, TBlaSky.nOpa) annotation (Line(
        points={{183,-150},{220,-150},{220,-213},{238,-213}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(cheHorRad.HOut, TBlaSky.radHorIR) annotation (Line(
        points={{181,250},{220,250},{220,-218},{238,-218}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(TBlaSky.TBlaSky, weaBus.TBlaSky) annotation (Line(
        points={{261,-210},{280,-210},{280,0},{292,0},{292,5.55112e-16},{304,
            5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(modTim.y, weaBus.cloTim) annotation (Line(
        points={{-159,6.10623e-16},{34.75,6.10623e-16},{34.75,0},{124.5,0},{124.5,
            5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(modTim.y, add.u2) annotation (Line(
        points={{-159,6.10623e-16},{-150,6.10623e-16},{-150,164},{-142,164}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(con30mins.y, add.u1) annotation (Line(
        points={{-159,202},{-150,202},{-150,176},{-142,176}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add.y, conTim1.modTim) annotation (Line(
        points={{-119,170},{-112,170}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(conTim1.calTim, datRea1.u) annotation (Line(
        points={{-89,170},{-82,170}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(modTim.y, locTim.cloTim) annotation (Line(
        points={{-159,6.10623e-16},{-150,6.10623e-16},{-150,-150},{-122,-150}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(modTim.y, conTim.modTim) annotation (Line(
        points={{-159,6.10623e-16},{-150,6.10623e-16},{-150,-30},{-122,-30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(conTim.calTim, datRea.u) annotation (Line(
        points={{-99,-30},{-82,-30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(modTim.y, eqnTim.nDay) annotation (Line(
        points={{-159,6.10623e-16},{-150,6.10623e-16},{-150,-110},{-122,-110}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(eqnTim.eqnTim, solTim.equTim) annotation (Line(
        points={{-99,-110},{-88,-110},{-88,-124},{-82,-124}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(locTim.locTim, solTim.locTim) annotation (Line(
        points={{-99,-150},{-88,-150},{-88,-135.4},{-82,-135.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(solTim.solTim, weaBus.solTim) annotation (Line(
        points={{-59,-130},{-20,-130},{-20,0},{284,0},{284,5.55112e-16},{304,
            5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(datRea.y[3], conWinDir.u) annotation (Line(
        points={{-59,-29.75},{20,-29.75},{20,-270},{118,-270}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(datRea1.y[3], conHorRad.HIn) annotation (Line(
        points={{-59,170.667},{20,170.667},{20,250},{118,250}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(cheTemDryBul.TOut, TBlaSky.TDryBul) annotation (Line(
        points={{181,-190},{220,-190},{220,-202},{238,-202}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(datRea.y[1], conTDryBul.u) annotation (Line(
        points={{-59,-30.75},{20,-30.75},{20,-190},{118,-190}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(cheTemDewPoi.TOut, weaBus.TDewPoi) annotation (Line(
        points={{181,-230},{280,-230},{280,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(TBlaSky.TDewPoi, cheTemDewPoi.TOut) annotation (Line(
        points={{238,-207},{220,-207},{220,-230},{181,-230}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(datRea1.y[1], conGloHorRad.HIn) annotation (Line(
        points={{-59,169.333},{30,169.333},{30,170},{118,170}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(datRea1.y[2], conDifHorRad.HIn) annotation (Line(
        points={{-59,170},{20,170},{20,130},{118,130}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(conRelHum.relHumIn, datRea.y[4]) annotation (Line(
        points={{118,30},{20,30},{20,-29.25},{-59,-29.25}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(cheRelHum.relHumOut, weaBus.relHum) annotation (Line(
        points={{181,30},{280,30},{280,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheTemDryBul.TOut, weaBus.TDryBul) annotation (Line(
        points={{181,-190},{280,-190},{280,5.55112e-16},{304,5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(decAng.decAng, zenAng.decAng)
                                    annotation (Line(
        points={{-119,-210},{-82,-210},{-82,-210.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(solHouAng.solHouAng, zenAng.solHouAng)                                              annotation (Line(
        points={{-119,-240},{-100,-240},{-100,-220.8},{-82,-220.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(solHouAng.solTim, solTim.solTim) annotation (Line(
        points={{-142,-240},{-154,-240},{-154,-172},{-20,-172},{-20,-130},{-59,-130}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(decAng.nDay, modTim.y) annotation (Line(
        points={{-142,-210},{-150,-210},{-150,-180},{0,-180},{0,6.10623e-16},{
            -159,6.10623e-16}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zenAng.zen, altAng.zen) annotation (Line(
        points={{-59,-216},{-40,-216},{-40,-270},{-32,-270}},
        color={0,0,127},
        smooth=Smooth.None));

    // Connectors for wet bulb temperature.
    // These are removed if computeWetBulbTemperature = false
    connect(chePre.POut, tWetBul_TDryBulXi.p) annotation (Line(
        points={{181,70},{220,70},{220,-64},{243,-64}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(tWetBul_TDryBulXi.TWetBul, weaBus.TWetBul) annotation (Line(
        points={{265,-56},{280,-56},{280,0},{292,0},{292,5.55112e-16},{304,
            5.55112e-16}},
        color={0,0,127},
        smooth=Smooth.None), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(cheTemDryBul.TOut, tWetBul_TDryBulXi.TDryBul) annotation (Line(
        points={{181,-190},{220,-190},{220,-48},{243,-48}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(cheRelHum.relHumOut, tWetBul_TDryBulXi.phi) annotation (Line(
        points={{181,30},{208,30},{208,-56},{243,-56}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(altAng.alt, weaBus.solAlt) annotation (Line(
        points={{-9,-270},{8,-270},{8,-290},{290,-290},{290,0},{304,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zenAng.zen, weaBus.solZen) annotation (Line(
        points={{-59,-216},{-40,-216},{-40,-290},{290,-290},{290,0},{304,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(decAng.decAng, weaBus.solDec) annotation (Line(
        points={{-119,-210},{-110,-210},{-110,-208},{-100,-208},{-100,-290},{290,
            -290},{290,0},{304,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(solHouAng.solHouAng, weaBus.solHouAng) annotation (Line(
        points={{-119,-240},{-108,-240},{-108,-238},{-100,-238},{-100,-290},{290,
            -290},{290,0},{304,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(longitude.y, weaBus.lon) annotation (Line(
        points={{-119,-270},{-100,-270},{-100,-290},{290,-290},{290,0},{304,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(latitude.y, weaBus.lat) annotation (Line(
        points={{-159,-270},{-150,-270},{-150,-290},{290,-290},{290,0},{304,0}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (
      defaultComponentName="weaDat",
      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-200,-200},{200,200}},
          initialScale=0.05), graphics={
          Rectangle(
            extent={{-200,200},{200,-200}},
            lineColor={124,142,255},
            fillColor={124,142,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-162,270},{138,230}},
            textString="%name",
            lineColor={0,0,255}),
          Ellipse(
            extent={{-146,154},{28,-20}},
            lineColor={255,220,220},
            lineThickness=1,
            fillPattern=FillPattern.Sphere,
            fillColor={255,255,0}),
          Polygon(
            points={{104,76},{87.9727,12.9844},{88,12},{120,22},{148,20},{174,8},
                {192,-58},{148,-132},{20,-140},{-130,-136},{-156,-60},{-140,-6},{
                -92,-4},{-68.2109,-21.8418},{-68,-22},{-82,40},{-48,90},{44,110},
                {104,76}},
            lineColor={220,220,220},
            lineThickness=0.1,
            fillPattern=FillPattern.Sphere,
            smooth=Smooth.Bezier,
            fillColor={230,230,230})}),
      Documentation(info="<html>
<p>
This component reads TMY3 weather data (Wilcox and Marion, 2008) or user specified weather data.
The weather data format is the Typical Meteorological Year (TMY3)
as obtained from the EnergyPlus web site at
<a href=\"http://apps1.eere.energy.gov/buildings/energyplus/cfm/weather_data.cfm\">
http://apps1.eere.energy.gov/buildings/energyplus/cfm/weather_data.cfm</a>. These
data, which are in the EnergyPlus format, need to be converted as described
in the next paragraph.
</p>
<!-- ============================================== -->
<h4>Adding new weather data</h4>
<p>
To add new weather data, proceed as follows:
</p>
<ol>
<li>
Download the weather data file with the <code>epw</code> extension from
<a href=\"http://apps1.eere.energy.gov/buildings/energyplus/cfm/weather_data.cfm\">
http://apps1.eere.energy.gov/buildings/energyplus/cfm/weather_data.cfm</a>.
</li>
<li>
Add the file to <code>Buildings/Resources/weatherdata</code> (or to any directory
for which you have write permission).
</li>
<li>
On a console window, type<pre>
  cd Buildings/Resources/weatherdata
  java -jar ../bin/ConvertWeatherData.jar inputFile.epw
</pre>
This will generate the weather data file <code>inputFile.mos</code>, which can be read
by the model
<a href=\"modelica://Buildings.BoundaryConditions.WeatherData.ReaderTMY3\">
Buildings.BoundaryConditions.WeatherData.ReaderTMY3</a>.
</li>
</ol>
<!-- ============================================== -->
<h4>Location data that are read automatically from the weather data file</h4>
<p>
The following location data are automatically read from the weather file:
</p>
<ul>
<li>
The latitude of the weather station, <code>lat</code>,
</li>
<li>
the longitude of the weather station, <code>lon</code>, and
</li>
<li>
the time zone relative to Greenwich Mean Time, <code>timZone</code>.
</li>
</ul>
<!-- ============================================== -->
<h4>Wet bulb temperature</h4>
<p>
By default, the data bus contains the wet bulb temperature.
This introduces a nonlinear equation.
However, we have not observed an increase in computing time because
of this equation.
To disable the computation of the wet bulb temperature, set
<code>computeWetBulbTemperature=false</code>.
</p>
<!-- ============================================== -->
<h4>Using constant or user-defined input signals for weather data</h4>
<p>
This model has the option of using a constant value, using the data from the weather file,
or using data from an input connector for the following variables:
</p>
<ul>
<li>
The atmospheric pressure,
</li>
<li>
the ceiling height,
</li>
<li>
the total sky cover pressure,
</li>
<li>
the opaque sky cover pressure,
</li>
<li>
the dry bulb temperature,
</li>
<li>
the dew point temperature,
</li>
<li>
the relative humidity,
</li>
<li>
the wind direction,
</li>
<li>
the wind speed,
</li>
<li>
the global horizontal radiation, direct normal and diffuse horizontal radiation,
and
</li>
<li>
the infrared horizontal radiation.
</li>
</ul>
<p>
By default, all data are obtained from the weather data file,
except for the atmospheric pressure, which is set to the
parameter <code>pAtm=101325</code> Pascals.
</p>
<p>
The parameter <code>*Sou</code> configures the source of the data.
For the atmospheric pressure, dry bulb temperature, relative humidity, wind speed and wind direction,
the enumeration
<a href=\"modelica://Buildings.BoundaryConditions.Types.DataSource\">
Buildings.BoundaryConditions.Types.DataSource</a>
is used as follows:
</p>
<table summary=\"summary\" border=\"1\" cellspacing=0 cellpadding=2 style=\"border-collapse:collapse;\">
<!-- ============================================== -->
<tr>
  <th>Parameter <code>*Sou</code>
  </th>
  <th>Data used to compute weather data.
  </th>
</tr>
<!-- ============================================== -->
<tr>
  <td>
    File
  </td>
  <td>
    Use data from file.
  </td>
</tr>
<!-- ============================================== -->
<tr>
  <td>
    Parameter
  </td>
  <td>
    Use value specified by the parameter.
  </td>
</tr>
<!-- ============================================== -->
<tr>
  <td>
    Input
  </td>
  <td>
    Use value from the input connector.
  </td>
</tr>
</table>
<p>
Because global, diffuse and direct radiation are related to each other, the parameter
<code>HSou</code> is treated differently.
It is set to a value of the enumeration
<a href=\"modelica://Buildings.BoundaryConditions.Types.RadiationDataSource\">
Buildings.BoundaryConditions.Types.RadiationDataSource</a>,
and allows the following configurations:
</p>
<table summary=\"summary\" border=\"1\" cellspacing=0 cellpadding=2 style=\"border-collapse:collapse;\">
<!-- ============================================== -->
<tr>
  <th>Parameter <code>HSou</code>
  </th>
  <th>Data used to compute weather data.
  </th>
</tr>
<!-- ============================================== -->
<tr>
  <td>
    File
  </td>
  <td>
    Use data from file.
  </td>
</tr>
<!-- ============================================== -->
<tr>
  <td>
    Input_HGloHor_HDifHor
  </td>
  <td>
    Use global horizontal and diffuse horizontal radiation from input connector.
  </td>
</tr>
<tr>
  <td>
    Input_HDirNor_HDifHor
  </td>
  <td>
    Use direct normal and diffuse horizontal radiation from input connector.
  </td>
</tr>
<tr>
  <td>
    Input_HDirNor_HGloHor
  </td>
  <td>
    Use direct normal and global horizontal radiation from input connector.
  </td>
</tr>
</table>
<p>
<b>Notes</b>
</p>
<ol>
<li>
<p>
In HVAC systems, when the fan is off, changes in atmospheric pressure can cause small air flow rates
in the duct system due to change in pressure and hence in the mass of air that is stored
in air volumes (such as in fluid junctions or in the room model).
This may increase computing time. Therefore, the default value for the atmospheric pressure is set to a constant.
Furthermore, if the initial pressure of air volumes are different
from the atmospheric pressure, then fast pressure transients can happen in the first few seconds of the simulation.
This can cause numerical problems for the solver. To avoid this problem, set the atmospheric pressure to the
same value as the medium default pressure, which is typically set to the parameter <code>Medium.p_default</code>.
For medium models for moist air and dry air, the default is
<code>Medium.p_default=101325</code> Pascals.
</p>
</li>
<li>
<p>
Different units apply depending on whether data are obtained from a file, or
from a parameter or an input connector:
</p>
<ul>
<li>
When using TMY3 data from a file (e.g. <code>USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos</code>), the units must be the same as the original TMY3 file used by EnergyPlus (e.g.
<code>USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.epw</code>).
The TMY3 data used by EnergyPlus are in both SI units and non-SI units.
If <code>Resources/bin/ConvertWeatherData.jar</code> is used to convert the <code>.epw</code> file to an <code>.mos</code> file, the units of the TMY3 data are preserved and the file can be directly
used by this data reader.
The data reader will automatically convert units to the SI units used by Modelica.
For example, the dry bulb temperature <code>TDryBul</code> in TMY3 is in degree Celsius.
The data reader will automatically convert the data to Kelvin.
The wind direction <code>winDir</code> in TMY3 is degrees and will be automatically converted to radians.
</li>
<li>
When using data from a parameter or from an input connector,
the data must be in the SI units used by Modelica.
For instance, the unit must be
<code>Pa</code> for pressure,
<code>K</code> for temperature,
<code>W/m2</code> for solar radiations and
<code>rad</code> for wind direction.
</li>
</ul>
</li>
<li>
The ReaderTMY3 should only be used with TMY3 data. It contains a time shift for solar radiation data
that is explained below. This time shift needs to be removed if the user may want to
use the ReaderTMY3 for other weather data types.
</li>
</ol>
<h4>Implementation</h4>
<h5>Start and end data for annual weather data files</h5>
<p>
The TMY3 weather data, as well as the EnergyPlus weather data, start at 1:00 AM
on January 1, and provide hourly data until midnight on December 31.
Thus, the first entry for temperatures, humidity, wind speed etc. are values
at 1:00 AM and not at midnight. Furthermore, the TMY3 weather data files can have
values at midnight of December 31 that may be significantly different from the values
at 1:00 AM on January 1.
Since annual simulations require weather data that start at 0:00 on January 1,
data need to be provided for this hour. Due to the possibly large change in
weatherdata between 1:00 AM on January 1 and midnight at December 31,
the weather data files in the Buildings library do not use the data entry from
midnight at December 31 as the value for <i>t=0</i>. Rather, the
value from 1:00 AM on January 1 is duplicated and used for 0:00 on January 1.
To maintain a data record with <i>8760</i> hours, the weather data record from
midnight at December 31 is deleted.
These changes in the weather data file are done in the Java program that converts
EnergyPlus weather data file to Modelica weather data files, and which is described
below.
</p>
<h5>Time shift for solar radiation data</h5>
<p>
To read weather data from the TMY3 weather data file, there are
two data readers in this model. One data reader obtains all data
except solar radiation, and the other data reader reads only the
solar radiation data, shifted by <i>30</i> minutes.
The reason for this time shift is as follows:
The TMY3 weather data file contains for solar radiation the
\"...radiation received
on a horizontal surface during
the 60-minute period ending at
the timestamp.\"

Thus, as the figure below shows, a more accurate interpolation is obtained if
time is shifted by <i>30</i> minutes prior to reading the weather data.
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://Buildings/Resources/Images/BoundaryConditions/WeatherData/RadiationTimeShift.png\"
border=\"1\" />
</p>
<h4>References</h4>
<ul>
<li>
Wilcox S. and W. Marion. <i>Users Manual for TMY3 Data Sets</i>.
Technical Report, NREL/TP-581-43156, revised May 2008.
</li>
</ul>
</html>",   revisions="<html>
<ul>
<li>
October 17, 2014, by Michael Wetter<br/>
Corrected error that led the total and opaque sky cover to be ten times
too low if its value was obtained from the parameter or the input connector.
For the standard configuration in which the sky cover is obtained from
the weather data file, the model was correct. This error only affected
the other two possible configurations.
</li>
<li>
September 12, 2014, by Michael Wetter:<br/>
Removed redundant connection <code>connect(conHorRad.HOut, cheHorRad.HIn);</code>.
</li>
<li>
May 30, 2014, by Michael Wetter:<br/>
Removed undesirable annotation <code>Evaluate=true</code>.
</li>
<li>
May 5, 2013, by Thierry S. Nouidui:<br/>
Added the option to use a constant, an input signal or the weather file as the source
for the ceiling height, the total sky cover, the opaque sky cover, the dew point temperature,
and the infrared horizontal radiation <code>HInfHor</code>.
</li>
<li>
October 8, 2013, by Michael Wetter:<br/>
Improved the algorithm that determines the absolute path of the file.
Now weather files are searched in the path specified, and if not found, the urls
<code>file://</code>, <code>modelica://</code> and <code>modelica://Buildings</code>
are added in this order to search for the weather file.
This allows using the data reader without having to specify an absolute path,
as long as the <code>Buildings</code> library
is on the <code>MODELICAPATH</code>.
This change was implemented in
<a href=\"modelica://Buildings.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath\">
Buildings.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath</a>
and improves this weather data reader.
</li>
<li>
May 2, 2013, by Michael Wetter:<br/>
Added function call to <code>getAbsolutePath</code>.
</li>
<li>
October 16, 2012, by Michael Wetter:<br/>
Added computation of the wet bulb temperature.
Computing the wet bulb temperature introduces a nonlinear
equation. As we have not observed an increase in computing time
because of computing the wet bulb temperature, it is computed
by default. By setting the parameter
<code>computeWetBulbTemperature=false</code>, the computation of the
wet bulb temperature can be removed.
Revised documentation.
</li>
<li>
August 11, 2012, by Wangda Zuo:<br/>
Renamed <code>radHor</code> to <code>radHorIR</code> and
improved the optional inputs for radiation data.
</li>
<li>
July 24, 2012, by Wangda Zuo:<br/>
Corrected the notes of SI unit requirements for input files.
</li>
<li>
July 13, 2012, by Michael Wetter:<br/>
Removed assignment of <code>HGloHor_in</code> in its declaration,
because this gives an overdetermined system if the input connector
is used.
Removed non-required assignments of attribute <code>displayUnit</code>.
</li>
<li>
February 25, 2012, by Michael Wetter:<br/>
Added subbus for solar position, which is needed by irradition and
shading model.
</li>
<li>
November 29, 2011, by Michael Wetter:<br/>
Fixed wrong display unit for <code>pAtm_in_internal</code> and
made propagation of parameter final.
</li>
<li>
October 27, 2011, by Wangda Zuo:<br/>
1. Added optional connectors for dry bulb temperature, relative humidity, wind speed, wind direction, global horizontal radiation, diffuse horizontal radiation.<br/>
2. Separate the unit convertion for TMY3 data and data validity check.
</li>
<li>
October 3, 2011, by Michael Wetter:<br/>
Propagated value for sky temperature calculation to make it accessible as a parameter.
</li>
<li>
July 20, 2011, by Michael Wetter:<br/>
Added the option to use a constant, an input signal or the weather file as the source
for the atmospheric pressure.
</li><li>
March 15, 2011, by Wangda Zuo:<br/>
Delete the wet bulb temperature since it may cause numerical problem.
</li>
<li>
March 7, 2011, by Wangda Zuo:<br/>
Added wet bulb temperature. Changed reader to read only needed columns.
Added explanation for 30 minutes shift for radiation data.
</li>
<li>
March 5, 2011, by Michael Wetter:<br/>
Changed implementation to obtain longitude and time zone directly
from weather file.
</li>
<li>
June 25, 2010, by Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=false,
                                                        extent={{-200,-300},{300,
              300}}),
          graphics));
  end ReaderWeatherFile2;

  package Examples
    "Collection of models that illustrate model use and test models"
    extends Modelica.Icons.ExamplesPackage;
    model TestTabHeaCooSch "Test of heating and cooling schedule"
      extends Modelica.Icons.Example;
      Modelica.Blocks.Logical.Switch swiNorBed
        annotation (Placement(transformation(extent={{20,0},{40,20}})));
      TemperatureSetPoint TSetPoiNorBed(kHea=1E6, kCoo=0)
        "Temperature set point for the North bedroom"
        annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
      Modelica.Blocks.Sources.CombiTimeTable bouVenHeaCoo(
        final tableOnFile=true,
        final tableName="BouVenHeaCoo",
        smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
        extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints,
        final fileName="D:/Berkeley Lab/Berkeley IEA58/N2BouVenHeaCooExp1.txt",
        columns={11,18,25,31})
        "Boundary conditions for ceiling (1 for East, 2 for West) and floor (3); ventilation supply flow rate (6) and its temperature (4); ventilation extraction flow rate (7) and its temperature (5); heating or cooling power for the different rooms (8: kitchen, 9: lobby, 10: North bedroom, 11: corridor, 12: bathroom, 13: South bedroom, 14: living room); heating temperature set point for the different rooms (15: kitchen, 16: lobby, 17: North bedroom, 18: corridor, 19: bathroom, 20: South bedroom, 21: living room); cooling temperature set point for the different rooms (22: kitchen, 23: lobby, 24: North bedroom, 25: corridor, 26: bathroom, 27: South bedroom, 28: living room); internal gains in the kitchen (29)"
        annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
      Modelica.Blocks.Sources.Constant Troom(k=25)
        "Supposed air temperature in the living room"
        annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
      Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.5)
        annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    equation
      connect(TSetPoiNorBed.y, swiNorBed.u3) annotation (Line(
          points={{1,-10},{8,-10},{8,2},{18,2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(bouVenHeaCoo.y[1], swiNorBed.u1) annotation (Line(
          points={{-79,-30},{-30,-30},{-30,18},{18,18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(bouVenHeaCoo.y[2], TSetPoiNorBed.TSetHea) annotation (Line(
          points={{-79,-30},{-52,-30},{-52,-4},{-22,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(bouVenHeaCoo.y[3], TSetPoiNorBed.TSetCoo) annotation (Line(
          points={{-79,-30},{-52,-30},{-52,-16},{-22,-16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Troom.y, TSetPoiNorBed.TRooAir) annotation (Line(
          points={{-59,-70},{-42,-70},{-42,-10},{-22,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(greaterThreshold.y, swiNorBed.u2) annotation (Line(
          points={{-39,10},{18,10}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(bouVenHeaCoo.y[4], greaterThreshold.u) annotation (Line(
          points={{-79,-30},{-72,-30},{-72,10},{-62,10}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}), graphics),
        experiment(StopTime=3.5424e+006, Interval=3600),
        __Dymola_experimentSetupOutput,
                  Documentation(
      info="<html>
  Test in order to check if the table to choose between temperature set point and heating or cooling power is working as expected
  </html>",
      revisions="<html>
<ul>
<li>
February 3 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
    end TestTabHeaCooSch;
  end Examples;
end BaseClasses;
