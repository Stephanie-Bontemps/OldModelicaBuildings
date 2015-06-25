within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete;
model MultiThermalBridgeObsolete
  "Model of all the thermal bridges in a Holzkirchen house - Outside temperature is used"
  parameter Modelica.SIunits.ThermalConductance gKit(start=0, min=0)
    "Constant thermal conductance of thermal bridge of the kitchen";
  parameter Modelica.SIunits.ThermalConductance gLob(start=0, min=0)
    "Constant thermal conductance of thermal bridge of the lobby";
  parameter Modelica.SIunits.ThermalConductance gNorBed(start=0, min=0)
    "Constant thermal conductance of thermal bridge of the north bedroom";
  parameter Modelica.SIunits.ThermalConductance gCor(start=0, min=0)
    "Constant thermal conductance of thermal bridge of the corridor";
  parameter Modelica.SIunits.ThermalConductance gBat(start=0, min=0)
    "Constant thermal conductance of thermal bridge of the bathroom";
  parameter Modelica.SIunits.ThermalConductance gSouBed(start=0, min=0)
    "Constant thermal conductance of thermal bridge of the south bedroom";
  parameter Modelica.SIunits.ThermalConductance gLivRoo(start=0, min=0)
    "Constant thermal conductance of thermal bridge of the living room";

  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Outer temperature"
                                            annotation (Placement(
        transformation(extent={{-110,-20},{-70,20}}), iconTransformation(extent=
           {{-100,-10},{-80,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b[7]
    "Inner temperature boundary condition in each room"
    annotation (Placement(transformation(extent={{90,-10},{110,10}}),
        iconTransformation(extent={{90,-10},{110,10}})));

protected
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ThermalBridge
                                                                                    theBriKit(g=gKit)
    "Thermal bridge conductance of the kitchen"
    annotation (Placement(transformation(extent={{-20,80},{0,100}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ThermalBridge
                                                                                    theBriLob(g=gLob)
    "Thermal bridge conductance of the lobby"
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ThermalBridge
                                                                                    theBriNorBed(g=gNorBed)
    "Thermal bridge conductance of the north bedroom"
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ThermalBridge
                                                                                    theBriCor(g=gCor)
    "Thermal bridge conductance of the corridor"
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ThermalBridge
                                                                                    theBriBat(g=gBat)
    "Thermal bridge conductance of the bathroom"
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ThermalBridge
                                                                                    theBriSouBed(g=gSouBed)
    "Thermal bridge conductance of the south bedroom"
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.BaseClasses.ThermalBridge
                                                                                    theBriLivRoo(g=gLivRoo)
    "Thermal bridge conductance of the living room"
    annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));

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
  connect(theBriKit.port_b,port_b [1]) annotation (Line(
      points={{0,90},{42,90},{42,-8.57143},{100,-8.57143}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(theBriLob.port_b,port_b [2]) annotation (Line(
      points={{0,60},{42,60},{42,-5.71429},{100,-5.71429}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(theBriNorBed.port_b,port_b [3]) annotation (Line(
      points={{0,30},{42,30},{42,-2.85714},{100,-2.85714}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(theBriCor.port_b,port_b [4]) annotation (Line(
      points={{0,0},{100,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(theBriBat.port_b,port_b [5]) annotation (Line(
      points={{0,-30},{42,-30},{42,2.85714},{100,2.85714}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(theBriSouBed.port_b,port_b [6]) annotation (Line(
      points={{0,-60},{42,-60},{42,5.71429},{100,5.71429}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(theBriLivRoo.port_b,port_b [7]) annotation (Line(
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
          textString="%name"),
        Text(
          extent={{-104,20},{-58,8}},
          lineColor={0,0,0},
          fillColor={61,61,61},
          fillPattern=FillPattern.Solid,
          textString="weather"),
        Bitmap(extent={{-60,98},{60,-98}}, fileName="modelica://Buildings/Resources/Images/Rooms/Validation/HolzkirchenTwinHouses/Houses/BaseClasses/MultiThermalBridges.PNG"),
        Text(
          extent={{76,24},{122,12}},
          lineColor={0,0,0},
          fillColor={61,61,61},
          fillPattern=FillPattern.Solid,
          textString="Tint")}),
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
end MultiThermalBridgeObsolete;
