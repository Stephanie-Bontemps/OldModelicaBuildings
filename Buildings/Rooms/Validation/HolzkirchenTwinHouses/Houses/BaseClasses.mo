within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses;
package BaseClasses
  "Package with base classes for Buildings.Rooms.Validation.HolzkirchenTwinHouses"
extends Modelica.Icons.BasesPackage;
  model ThermalBridge
    "Thermal bridge description using a conduction model - Outside temperature is used"
    parameter Modelica.SIunits.ThermalConductance g(start=0, min=0)
      "Constant thermal conductance of thermal bridge";

    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b
      "Inner temperature boundary condition"                    annotation (
        Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
            extent={{90,-10},{110,10}})));
    Buildings.BoundaryConditions.WeatherData.Bus           weaBus
      "Outer temperature"
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}}),
          iconTransformation(extent={{-100,-10},{-80,10}})));

  protected
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=g)
      "Value of global thermal bridges conductance"
             annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
      prescribedTemperature "Outer temperature boundary condition"
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

  equation
    connect(thermalConductor.port_b,port_b)  annotation (Line(
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
            textString="%name"),
          Bitmap(extent={{-80,98},{80,-98}}, fileName=
                "modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/BaseClasses/ThermalBridge.PNG"),
          Text(
            extent={{-104,20},{-58,8}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="weather"),
          Text(
            extent={{-34,46},{60,34}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="g=%g"),
          Text(
            extent={{76,24},{122,12}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="Tint")}),  defaultComponentName="theBri",
    Documentation(
    info="<html>
  Model for thermal bridges in a room considering a conduction model where the thermal element transportes heat without storing it.
  They are modeled using an instance of <a href=\"Modelica.Thermal.HeatTransfer.Components.ThermalConductor\">
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor</a>.
  <br>
  In this model only the outside temperature is considered.
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

  model MultiThermalBridge
    "Model of all the thermal bridges in a Holzkirchen house"
    parameter Modelica.SIunits.ThermalConductance gExt[6](each start=0, each min=0)
      "Constant thermal conductance of thermal bridge on outside";
    parameter Modelica.SIunits.ThermalConductance gWesCei[3](each start=0, each min=0)
      "Constant thermal conductance of thermal bridge on the west ceiling";
    parameter Modelica.SIunits.ThermalConductance gEasCei[6](each start=0, each min=0)
      "Constant thermal conductance of thermal bridge on the east ceiling";
    parameter Modelica.SIunits.ThermalConductance gCel[7](each start=0, each min=0)
      "Constant thermal conductance of thermal bridge on the cellar";

    Buildings.BoundaryConditions.WeatherData.Bus weaBus "Outer temperature"
                                              annotation (Placement(
          transformation(extent={{-110,50},{-70,90}}),  iconTransformation(extent={{-100,60},
              {-80,80}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b[22]
      "Inner temperature boundary condition in each room" annotation (Placement(
          transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{
              90,-10},{110,10}})));

    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a TWesCei
      "Temperature in the West Ceiling"
      annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a TEasCei
      "Temperature in the East ceiling"
      annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a TCel
      "Temperature in the cellar"
      annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));

  protected
    Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
      prescribedTemperature "Outer temperature boundary condition"
      annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor theBriExt[6](G=gExt)
      "Values of thermal bridges conductance on the outside"
      annotation (Placement(transformation(extent={{20,60},{40,80}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor theBriWesCei[3](G=
          gWesCei) "Values of thermal bridges conductance on the west ceiling"
      annotation (Placement(transformation(extent={{20,20},{40,40}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor theBriEasCei[6](G=
          gEasCei) "Values of thermal bridges conductance on the east ceiling"
      annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
    Modelica.Thermal.HeatTransfer.Components.ThermalConductor theBriCel[7](G=gCel)
      "Values of thermal bridges conductance on the cellar"
      annotation (Placement(transformation(extent={{20,-80},{40,-60}})));

  equation
    connect(theBriCel[1].port_a, TCel) annotation (Line(
        points={{20,-70},{-90,-70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[2].port_a, TCel) annotation (Line(
        points={{20,-70},{-90,-70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[3].port_a, TCel) annotation (Line(
        points={{20,-70},{-90,-70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[4].port_a, TCel) annotation (Line(
        points={{20,-70},{-90,-70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[5].port_a, TCel) annotation (Line(
        points={{20,-70},{-90,-70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[6].port_a, TCel) annotation (Line(
        points={{20,-70},{-90,-70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[7].port_a, TCel) annotation (Line(
        points={{20,-70},{-90,-70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(weaBus.TDryBul, prescribedTemperature.T) annotation (Line(
        points={{-90,70},{-42,70}},
        color={255,204,51},
        thickness=0.5,
        smooth=Smooth.None), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(prescribedTemperature.port, theBriExt[1].port_a) annotation (Line(
        points={{-20,70},{20,70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(prescribedTemperature.port, theBriExt[2].port_a) annotation (Line(
        points={{-20,70},{20,70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(prescribedTemperature.port, theBriExt[3].port_a) annotation (Line(
        points={{-20,70},{20,70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(prescribedTemperature.port, theBriExt[4].port_a) annotation (Line(
        points={{-20,70},{20,70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(prescribedTemperature.port, theBriExt[5].port_a) annotation (Line(
        points={{-20,70},{20,70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(prescribedTemperature.port, theBriExt[6].port_a) annotation (Line(
        points={{-20,70},{20,70}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriWesCei[1].port_a, TWesCei) annotation (Line(
        points={{20,30},{-90,30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriWesCei[2].port_a, TWesCei) annotation (Line(
        points={{20,30},{-90,30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriWesCei[3].port_a, TWesCei) annotation (Line(
        points={{20,30},{-90,30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[1].port_a,TEasCei)  annotation (Line(
        points={{20,-30},{-90,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[2].port_a,TEasCei)  annotation (Line(
        points={{20,-30},{-90,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[3].port_a,TEasCei)  annotation (Line(
        points={{20,-30},{-90,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[4].port_a,TEasCei)  annotation (Line(
        points={{20,-30},{-90,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[5].port_a,TEasCei)  annotation (Line(
        points={{20,-30},{-90,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[6].port_a,TEasCei)  annotation (Line(
        points={{20,-30},{-90,-30}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriExt[1].port_b, port_b[1]) annotation (Line(
        points={{40,70},{68,70},{68,-9.54545},{100,-9.54545}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriExt[2].port_b, port_b[2]) annotation (Line(
        points={{40,70},{68,70},{68,-8.63636},{100,-8.63636}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriExt[3].port_b, port_b[3]) annotation (Line(
        points={{40,70},{68,70},{68,-8},{84,-8},{84,-7.72727},{100,-7.72727}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriExt[4].port_b, port_b[4]) annotation (Line(
        points={{40,70},{68,70},{68,-6.81818},{100,-6.81818}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriExt[5].port_b, port_b[5]) annotation (Line(
        points={{40,70},{68,70},{68,-5.90909},{100,-5.90909}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriExt[6].port_b, port_b[6]) annotation (Line(
        points={{40,70},{68,70},{68,-5},{100,-5}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriWesCei[1].port_b, port_b[7]) annotation (Line(
        points={{40,30},{68,30},{68,-4.09091},{100,-4.09091}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriWesCei[2].port_b, port_b[8]) annotation (Line(
        points={{40,30},{68,30},{68,-3.18182},{100,-3.18182}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriWesCei[3].port_b, port_b[9]) annotation (Line(
        points={{40,30},{68,30},{68,-2.27273},{100,-2.27273}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[1].port_b, port_b[10]) annotation (Line(
        points={{40,-30},{68,-30},{68,-1.36364},{100,-1.36364}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[2].port_b, port_b[11]) annotation (Line(
        points={{40,-30},{68,-30},{68,-0.454545},{100,-0.454545}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[3].port_b, port_b[12]) annotation (Line(
        points={{40,-30},{68,-30},{68,0.454545},{100,0.454545}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[4].port_b, port_b[13]) annotation (Line(
        points={{40,-30},{68,-30},{68,1.36364},{100,1.36364}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[5].port_b, port_b[14]) annotation (Line(
        points={{40,-30},{68,-30},{68,2.27273},{100,2.27273}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriEasCei[6].port_b, port_b[15]) annotation (Line(
        points={{40,-30},{68,-30},{68,3.18182},{100,3.18182}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[1].port_b, port_b[16]) annotation (Line(
        points={{40,-70},{68,-70},{68,4.09091},{100,4.09091}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[2].port_b, port_b[17]) annotation (Line(
        points={{40,-70},{68,-70},{68,5},{100,5}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[3].port_b, port_b[18]) annotation (Line(
        points={{40,-70},{68,-70},{68,5.90909},{100,5.90909}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[4].port_b, port_b[19]) annotation (Line(
        points={{40,-70},{68,-70},{68,6.81818},{100,6.81818}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[5].port_b, port_b[20]) annotation (Line(
        points={{40,-70},{68,-70},{68,7.72727},{100,7.72727}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[6].port_b, port_b[21]) annotation (Line(
        points={{40,-70},{68,-70},{68,8.63636},{100,8.63636}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(theBriCel[7].port_b, port_b[22]) annotation (Line(
        points={{40,-70},{68,-70},{68,9.54545},{100,9.54545}},
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
            textString="%name"),
          Text(
            extent={{-104,90},{-58,78}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="weather"),
          Bitmap(extent={{-50,108},{70,-88}}, fileName=
                "modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/BaseClasses/MultiThermalBridges.PNG"),
          Text(
            extent={{-102,54},{-56,42}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TWesCei"),
          Text(
            extent={{-104,-6},{-58,-18}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TEasCei"),
          Text(
            extent={{-112,-46},{-66,-58}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TCel"),
          Text(
            extent={{76,22},{122,10}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="Tint")}),
              defaultComponentName="mulTherBri",
    Documentation(
    info="<html>
  Model for all the thermal bridges in a house with different temperatures depending on the type of bridge. 
  The thermal bridges in each room are modeled using an instance of <a href=\"Modelica.Thermal.HeatTransfer.Components.ThermalConductor\">
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor</a>.
  <br>
  The connected prescribed temperature is choosen between the ceiling temperature, the cellar temperature or the outside temperature depending on the type of thermal bridge.
  </html>",
    revisions="<html>
  <ul>
  <li>
  May 18 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
  end MultiThermalBridge;

  model OpenOrClosedDoor
    "Model to choose if the door is open or closed between 2 rooms"
    replaceable package MediumB = Modelica.Media.Interfaces.PartialMedium
      annotation (__Dymola_choicesAllMatching=true);
    parameter Modelica.Blocks.Interfaces.BooleanOutput yDooFil=true
      "Kind of scenario for the door (yDooFil = true: constant value, yDooFil = false: time varying scenario)";
    parameter Real kDooOpe(start=0, min=0, max=1, unit="1")
      "Constant value to choose if the door is always open or closed (kDooOpe = 0: door closed or kDooOpe = 1: door open). To select if yDooFil=true";
    parameter Modelica.SIunits.Length wOpe(start=0.935, min=0)
      "Width of opening";
    parameter Modelica.SIunits.Length hOpe(start=1.98, min=0)
      "Height of opening";
    parameter Modelica.SIunits.Area lClo(start=1e-06, min=0)
      "Effective leakage area if door model is used";
    parameter Modelica.SIunits.Length hA(start=0, min=0)
      "Height of reference pressure zone A";
    parameter Modelica.SIunits.Length hB(start=0, min=0)
      "Height of reference pressure zone B";

    extends Buildings.Fluid.Interfaces.PartialFourPortInterface(
      redeclare package Medium1 = MediumB,
      redeclare package Medium2 = MediumB,
      final allowFlowReversal1=false,
      final allowFlowReversal2=false,
      final m1_flow_nominal=10/3600*1.2,
      final m2_flow_nominal=m1_flow_nominal);

    Buildings.Airflow.Multizone.DoorDiscretizedOperable doo(
      wOpe=wOpe,
      hOpe=hOpe,
      redeclare package Medium = MediumB,
      LClo=lClo,
      hA=hA,
      hB=hB,
      dpCloRat(displayUnit="Pa"),
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
        Placement(transformation(extent={{-140,-20},{-100,20}}),
          iconTransformation(extent={{-140,-20},{-100,20}})));

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
        points={{-120,0},{-30,0},{-30,10},{-1,10}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-144,36},{-98,24}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="uDooOpe"),
          Rectangle(
            extent={{-60,82},{60,-82}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={85,75,55},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-52,74},{58,-82}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{58,74},{-34,68},{-34,-88},{58,-82},{58,74}},
            lineColor={0,0,0},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-26,-8},{-12,-6},{-12,-12},{-26,-14},{-26,-8}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,2},{-44,-2}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-44,2},{-38,-14}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-38,-10},{-26,-14}},
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),                                      defaultComponentName="OpeCloDoo",
    Documentation(
    info="<html>
  Model to define if the door is open or closed between two rooms. 
  The model <a href=\"Buildings.Airflow.Multizone.DoorDiscretizedOperable\"> Buildings.Airflow.Multizone.DoorDiscretizedOperable</a> is used. 
  It is possible to define that the door is always open or closed through the constant value <I>kDooOpe</I> (0 if closed, 1 if open) or to define a scenario 
  if the door position changes during the experiment. 
  The scenario should be connected to the real input.
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
    parameter Modelica.SIunits.Area lKit(start=0, min=0)
      "Effective leakage area of the kitchen";
    parameter Modelica.SIunits.Area lLob(start=0, min=0)
      "Effective leakage area of the lobby";
    parameter Modelica.SIunits.Area lNorBed(start=0, min=0)
      "Effective leakage area of the north bedroom";
    parameter Modelica.SIunits.Area lBat(start=0, min=0)
      "Effective leakage area of the bathroom";
    parameter Modelica.SIunits.Area lSouBed(start=0, min=0)
      "Effective leakage area of the south bedroom";
    parameter Modelica.SIunits.Area lLivRoo1(start=0, min=0)
      "Effective leakage area of the windows 2 and 3 on the south wall of the living room";
    parameter Modelica.SIunits.Area lLivRoo2(start=0, min=0)
      "Effective leakage area of window 1 on the west wall of the living room";
    parameter Real sNor(start=1)
      "Side ratio, s=length of this wall/length of adjacent wall (north)";
    parameter Real sEas(start=1)
      "Side ratio, s=length of this wall/length of adjacent wall (east)";
    parameter Real sSou(start=1)
      "Side ratio, s=length of this wall/length of adjacent wall (south)";
    parameter Real sWes(start=1)
      "Side ratio, s=length of this wall/length of adjacent wall (west)";

    Buildings.Fluid.Sources.Outside_CpLowRise outNor(
      nPorts=2,
      s=sNor,
      redeclare package Medium = MediumB,
      azi=Buildings.Types.Azimuth.N)
      "Outside boundary using weather data on the north wall"
      annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
    Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
          transformation(extent={{-110,-20},{-70,20}}), iconTransformation(extent={{-100,
              -10},{-80,10}})));
    Buildings.Airflow.Multizone.EffectiveAirLeakageArea leaKit(L=lKit, redeclare
        package Medium =
                 MediumB)
      "Effective air leakage area around the window in the kitchen"
      annotation (Placement(transformation(extent={{-10,80},{10,100}})));
    Buildings.Airflow.Multizone.EffectiveAirLeakageArea leaLob(L=lLob, redeclare
        package Medium =
                 MediumB)
      "Effective air leakage area around the door in the lobby"
      annotation (Placement(transformation(extent={{-10,50},{10,70}})));
    Buildings.Airflow.Multizone.EffectiveAirLeakageArea leaNorBed(L=lNorBed, redeclare
        package Medium = MediumB)
      "Effective air leakage area around the window in the north bedroom"
      annotation (Placement(transformation(extent={{-10,20},{10,40}})));
    Buildings.Airflow.Multizone.EffectiveAirLeakageArea leaBat(L=lBat, redeclare
        package Medium =
                 MediumB)
      "Effective air leakage area around the window in the bathroom"
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Buildings.Airflow.Multizone.EffectiveAirLeakageArea leaSouBed(L=lSouBed, redeclare
        package Medium = MediumB)
      "Effective air leakage area around the window in the south bedroom"
      annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
    Buildings.Airflow.Multizone.EffectiveAirLeakageArea leaLivRoo1(L=lLivRoo1, redeclare
        package Medium = MediumB)
      "Effective air leakage area around windows 2 and 3 on the south wall of the living room"
      annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
    Buildings.Airflow.Multizone.EffectiveAirLeakageArea leaLivRoo2(L=lLivRoo2, redeclare
        package Medium = MediumB)
      "Effective air leakage area around window 1 on the west wall of the living room"
      annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
    Buildings.Fluid.Sources.Outside_CpLowRise outEas(
      nPorts=1,
      s=sEas,
      redeclare package Medium = MediumB,
      azi=Buildings.Types.Azimuth.E)
      "Outside boundary using weather data on the east wall"
      annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
    Buildings.Fluid.Sources.Outside_CpLowRise outSou(
      nPorts=2,
      s=sSou,
      azi=Buildings.Types.Azimuth.S,
      redeclare package Medium = MediumB)
      "Outside boundary using weather data on the south wall"
      annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
    Buildings.Fluid.Sources.Outside_CpLowRise outWes(
      nPorts=2,
      s=sWes,
      redeclare package Medium = MediumB,
      azi=Buildings.Types.Azimuth.W)
      "Outside boundary using weather data on the west wall"
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
            fillPattern=FillPattern.Solid),
          Bitmap(extent={{-80,100},{80,-98}}, fileName=
                "modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/BaseClasses/MultiEffectiveAirLeakageArea.png"),
          Text(
            extent={{-104,20},{-58,8}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="weather")}),defaultComponentName="MulAirLea",
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

    parameter Real k(start=0.5, min=0, max=1, unit="1") "Gain of upper output";

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
    y1 = k*u;
    y2 = (1-k)*u;
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), defaultComponentName="separate",
    Documentation(
    info="<html>
  Model to separate the input in two outputs according to the coefficients <CODE>k</CODE> and <CODE>1-k</CODE>.
  </html>",
    revisions="<html>
  <ul>
  <li>
  January 30 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Text(
            extent={{-130,40},{-110,20}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="u"),
          Text(
            extent={{100,80},{120,60}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="y1"),
          Text(
            extent={{100,-20},{120,-40}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="y2"),
          Text(
            extent={{6,72},{100,60}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="k1=%k"),
          Text(
            extent={{6,-28},{100,-40}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="k2=1-%k"),
          Line(
            points={{-100,0},{2,0},{2,50},{100,50}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None),
          Line(
            points={{2,0},{2,-50},{100,-50}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None)}));
  end Separate;

  model TemperatureSetPoint
    "Model to heat or to cool a room considering a temperature set point"
    parameter Real kHea=1E6
      "Gain value multiplied with input signal for heating";
    parameter Real kCoo=-1E6
      "Gain value multiplied with input signal for cooling";

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
    Modelica.Blocks.Interfaces.RealOutput heaCooP "Heating or cooling power"
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealInput TRooAir
      "Calculated air temperature in the room"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

  protected
    Buildings.Controls.Continuous.LimPID           conHea(
      Td=60,
      initType=Modelica.Blocks.Types.InitPID.InitialState,
      Ti=300,
      controllerType=Modelica.Blocks.Types.SimpleController.PI,
      k=0.1) "Controller for heating"
      annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
    Buildings.Controls.Continuous.LimPID           conCoo(
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
    connect(sum1.y, heaCooP) annotation (Line(
        points={{61,0},{110,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heaCooP, heaCooP) annotation (Line(
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
            textString="%name"),
          Text(
            extent={{-142,92},{-96,80}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TsetHea"),
          Text(
            extent={{-142,32},{-96,20}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TRooAir"),
          Text(
            extent={{-142,-28},{-96,-40}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TsetCoo"),
          Text(
            extent={{96,22},{142,10}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="heaCooP"),
          Bitmap(extent={{-40,96},{98,-98}}, fileName=
                "modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/BaseClasses/TemperatureSetPoint.png"),
          Text(
            extent={{2,72},{48,60}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="kHea=%kHea"),
          Text(
            extent={{4,-46},{50,-58}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="kCoo=%kCoo"),
          Line(
            points={{-100,60},{62,60},{62,0},{100,0}},
            color={0,0,0},
            smooth=Smooth.None,
            thickness=0.5),
          Line(
            points={{-100,-60},{62,-60},{62,0}},
            color={0,0,0},
            smooth=Smooth.None,
            thickness=0.5)}),      defaultComponentName="TSetPoi",
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
    parameter Integer nRoo = 7 "Number of rooms";

    Modelica.Blocks.Interfaces.RealInput heaCooFlo[nRoo]
      "Heat or cooling power input applied depending on the scenario" annotation (
       Placement(transformation(extent={{-180,50},{-140,90}}), iconTransformation(
            extent={{-180,50},{-140,90}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bCon[nRoo]
      "Convective split" annotation (Placement(transformation(extent={{130,20},{150,
              40}}), iconTransformation(extent={{130,20},{150,40}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bRad[nRoo]
      "Radiative split" annotation (Placement(transformation(extent={{130,-40},
              {150,-20}}),
                      iconTransformation(extent={{130,-40},{150,-20}})));
    Modelica.Blocks.Interfaces.RealInput TSetHea[nRoo]
      "Heating temperature set point input applied depending on the scenario"
      annotation (Placement(transformation(extent={{-180,-50},{-140,-10}}),
          iconTransformation(extent={{-180,-80},{-140,-40}})));
    Modelica.Blocks.Interfaces.RealInput TSetCoo[nRoo]
      "Cooling temperature set point input applied depending on the scenario"
      annotation (Placement(transformation(extent={{-180,-140},{-140,-100}}),
          iconTransformation(extent={{-180,-140},{-140,-100}})));
    Modelica.Blocks.Logical.Switch swi[nRoo]
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_aTSet[nRoo]
      "Calculated temperature used for the set point" annotation (Placement(
          transformation(extent={{-150,-100},{-130,-80}}),iconTransformation(
            extent={{-150,-100},{-130,-80}})));
    Modelica.Blocks.Interfaces.RealInput schChoice[nRoo]
      "Temperature set point or heating and cooling power" annotation (Placement(
          transformation(extent={{-180,-20},{-140,20}}), iconTransformation(
            extent={{-180,-20},{-140,20}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.Separate
                                                                                 sep[nRoo](each k=0.7)
      "y1: convective part and y2: radiative part"
      annotation (Placement(transformation(extent={{40,-10},{60,10}})));

  protected
    Modelica.Blocks.Math.RealToBoolean       booTabTorFlo[nRoo](each threshold=0.5)
      "Boolean table to choose the scenario(constant temperature set point or imposed heat flow)"
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
    Buildings.HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloCon[nRoo]
      "Prescribed heat or cooling flow for the convective part"
      annotation (Placement(transformation(extent={{80,20},{100,40}})));
    Buildings.HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRad[nRoo]
      "Prescribed heat or cooling flow for the radiative part"
      annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
    Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TRooAir[nRoo]
      "Room air temperature"
      annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));
    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.TemperatureSetPoint
                                                                                            TSetPoi[nRoo](each kHea=kHea, each kCoo=kCoo)
      "Temperature set point"
      annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));

  public
    Modelica.Blocks.Interfaces.RealOutput P[nRoo] "Total power in each room"
      annotation (Placement(transformation(extent={{140,80},{160,100}})));
  equation
    connect(port_aTSet, TRooAir.port) annotation (Line(
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
    connect(TSetPoi.heaCooP, swi.u3) annotation (Line(
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
    connect(swi.y, P) annotation (Line(points={{21,0},{30,0},{30,90},{150,90}},
          color={0,0,127}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
              -140},{140,140}})),           Icon(coordinateSystem(
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
            textString="%name"),
          Text(
            extent={{-188,102},{-142,90}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="heaCooFlo"),
          Text(
            extent={{-186,32},{-140,20}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="schChoice"),
          Text(
            extent={{-190,-28},{-144,-40}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TsetHea"),
          Text(
            extent={{-192,-88},{-146,-100}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TsetCoo"),
          Text(
            extent={{-116,-84},{-68,-96}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="TRooAir"),
          Bitmap(extent={{-8,138},{138,-136}}, fileName="modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/BaseClasses/TemperatureSetPoint.png"),
          Text(
            extent={{76,38},{124,26}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="Convection"),
          Text(
            extent={{76,-24},{124,-36}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="Radiation")}),
                                   defaultComponentName="mulHeaCooSch",
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
    parameter Real kRadGai(start=0, unit="W/m2")
      "Constant output value for radiative gains";
    parameter Real kConGai(start=0, unit="W/m2")
      "Constant output value for convective heat gains";
    parameter Real kLatGai(start=0, unit="W/m2")
      "Constant output value for latent heat gains";

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
    Modelica.Blocks.Interfaces.RealOutput intGai[3] "Internal Gains"
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
    connect(multiplex3_1.y, intGai) annotation (Line(
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
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}),
          graphics={
          Text(
            extent={{-94,106},{94,138}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="%name"), Rectangle(extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-140,70},{-100,60}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="tabRadGai"),
          Text(
            extent={{-140,20},{-100,10}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="tabConGai"),
          Text(
            extent={{-140,-30},{-100,-40}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="tabLatGai"),
          Text(
            extent={{82,20},{122,10}},
            lineColor={0,0,127},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="intGai"),
          Text(
            extent={{-98,90},{-52,78}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="kRadGai=%kRadGai"),
          Text(
            extent={{-98,32},{-52,20}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="kConGai=%kConGai"),
          Text(
            extent={{-98,-20},{-52,-32}},
            lineColor={0,0,0},
            fillColor={61,61,61},
            fillPattern=FillPattern.Solid,
            textString="kLatGai=%kLatGai"),
          Line(
            points={{-100,50},{46,50},{46,6},{100,6}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None),
          Line(
            points={{-50,84},{46,84},{46,50}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None,
            pattern=LinePattern.Dash),
          Line(
            points={{-100,0},{100,0}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None),
          Line(
            points={{-50,26},{22,26},{22,0}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None,
            pattern=LinePattern.Dash),
          Line(
            points={{-100,-50},{0,-50},{0,-6},{100,-6}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None),
          Line(
            points={{-52,-26},{0,-26}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None,
            pattern=LinePattern.Dash)}));
  end InternalGains;

  package Examples
    "Collection of models that illustrate model use and test models"
    extends Modelica.Icons.ExamplesPackage;
    model TestTabHeaCooSch "Test of heating and cooling schedule"
      extends Modelica.Icons.Example;
      Modelica.Blocks.Logical.Switch swiNorBed
        annotation (Placement(transformation(extent={{20,0},{40,20}})));
      Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.TemperatureSetPoint
                                                                                              TSetPoiNorBed(kHea=1E6, kCoo=0)
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
      connect(TSetPoiNorBed.heaCooP, swiNorBed.u3) annotation (Line(points={{1,
              -10},{8,-10},{8,2},{18,2}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})),
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
