within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
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
