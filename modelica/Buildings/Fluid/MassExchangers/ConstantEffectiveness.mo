within Buildings.Fluid.MassExchangers;
model ConstantEffectiveness
  "Heat and moisture exchanger with constant effectiveness"
  extends Fluid.Interfaces.PartialStaticFourPortHeatMassTransfer;
  extends Buildings.BaseClasses.BaseIcon;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,61},{-70,58}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-122,106},{-78,78}},
          lineColor={0,0,255},
          textString="u"),
        Rectangle(
          extent={{-70,80},{70,-80}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-62,50},{48,-10}},
          lineColor={255,255,255},
          textString="epsS=%epsS"),
        Text(
          extent={{-60,4},{50,-56}},
          lineColor={255,255,255},
          textString="epsL=%epsL")}),
Documentation(info="<html>
<p>
Model for a heat and moisture exchanger with constant effectiveness.
</p>
<p>
This model transfers heat and moisture in the amount of 
<pre>
  Q = epsS * Q_max,
  m = epsL * mWat_max,
</pre>
where <tt>epsS</tt> and <tt>epsL</tt> are constant effectiveness 
for the sensible and latent heat transfer,  
<tt>Q_max</tt> is the maximum heat that can be transferred and
<tt>mWat_max</tt> is the maximum moisture that can be transferred.
</p>
<p>
For a sensible heat exchanger, use
<a href=\"Modelica:Buildings.Fluid.HeatExchangers.ConstantEffectiveness\">
Buildings.Fluid.HeatExchangers.ConstantEffectiveness</a>
instead of this model.
</p>
<p>
This model can only be used with medium models that define the integer constant
<tt>Water</tt> which needs to be equal to the index of the water mass fraction 
in the species vector.
</p>
</html>",
revisions="<html>
<ul>
<li>
October 21, 2008, by Michael Wetter:<br>
First implementation, based on 
<a href=\"Modelica:Buildings.Fluid.HeatExchangers.ConstantEffectiveness\">
Buildings.Fluid.HeatExchangers.ConstantEffectiveness</a>.
</li>
</ul>
</html>"));
  parameter Real epsS(min=0, max=1) = 0.8
    "Sensible heat exchanger effectiveness";
  parameter Real epsL(min=0, max=1) = 0.8 "Latent heat exchanger effectiveness";

  Modelica.SIunits.Temperature T_in1 "Inlet temperature of medium 1";
  Modelica.SIunits.Temperature T_in2 "Inlet temperature of medium 2";
  Medium1.MassFraction XWat_in1 "Inlet water mass fraction of medium 1";
  Medium2.MassFraction XWat_in2 "Inlet water mass fraction of medium 2";

  Modelica.SIunits.ThermalConductance C1_flow
    "Heat capacity flow rate medium 1";
  Modelica.SIunits.ThermalConductance C2_flow
    "Heat capacity flow rate medium 2";
  Modelica.SIunits.ThermalConductance CMin_flow(min=0)
    "Minimum heat capacity flow rate";
  Modelica.SIunits.HeatFlowRate QMax_flow "Maximum heat flow rate";

  Modelica.SIunits.MassFlowRate mWat_flow
    "Water flow rate from medium 2 to medium 1";
  Modelica.SIunits.MassFlowRate mMax_flow
    "Maximum water flow rate from medium 2 to medium 1";
equation

  // Definitions for effectiveness model
  if m1_flow >= 0 then
     T_in1  = Medium1.temperature(sta_a1);
     XWat_in1 = sta_a1.X[Medium1.Water];
  else
     T_in1 = Medium1.temperature(sta_b1);
     XWat_in1 = sta_b1.X[Medium1.Water];
  end if;

  if m2_flow >= 0 then
     T_in2  = Medium2.temperature(sta_a2);
     XWat_in2 = sta_a2.X[Medium2.Water];
  else
     T_in2 = Medium2.temperature(sta_b2);
     XWat_in2 = sta_b2.X[Medium2.Water];
  end if;

  // The specific heat capacity is computed using the state of the
  // medium at port_a. For forward flow, this is correct, for reverse flow,
  // this is an approximation.
  C1_flow = abs(m1_flow)* Medium1.specificHeatCapacityCp(sta_a1);
  C2_flow = abs(m2_flow)* Medium2.specificHeatCapacityCp(sta_a2);

  CMin_flow = min( C1_flow, C2_flow);
  QMax_flow = CMin_flow * (T_in2 - T_in1);

  // transferred heat
  Q1_flow = epsS * QMax_flow;
  0 = Q1_flow + Q2_flow;

  // mass exchange
  mMax_flow = min(abs(m1_flow), abs(m2_flow)) * (XWat_in2 - XWat_in1);
  mWat_flow = epsL * mMax_flow;

  for i in 1:Medium1.nXi loop
     mXi1_flow[i] = if ( i == Medium1.Water) then mWat_flow else 0;
  end for;

  for i in 1:Medium2.nXi loop
     mXi2_flow[i] = if ( i == Medium2.Water) then -mWat_flow else 0;
  end for;
end ConstantEffectiveness;