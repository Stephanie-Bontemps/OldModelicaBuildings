within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model ExtraRadRatio "Calculation of the extraterrestrial radiation ratio"
  //How can I have time step, time file, i and i-1 for the solar hour angle
  Modelica.Blocks.Interfaces.RealInput lat
    annotation (Placement(transformation(extent={{-140,110},{-100,150}})));
  Modelica.Blocks.Interfaces.RealInput solDec
    annotation (Placement(transformation(extent={{-140,50},{-100,90}})));
  BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-160,80},{-120,120}}),iconTransformation(extent=
           {{-196,40},{-176,60}})));
  BoundaryConditions.WeatherData.BaseClasses.EquationOfTime eqnTim
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  BoundaryConditions.WeatherData.BaseClasses.LocalCivilTime locTim(timZon=
        timZon, lon=lon)
    annotation (Placement(transformation(extent={{-100,-140},{-80,-120}})));
  BoundaryConditions.WeatherData.BaseClasses.SolarTime solTim
    annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
  Utilities.SimulationTime filTim "TO BE CHANGED"
    annotation (Placement(transformation(extent={{-140,-120},{-120,-100}})));
  BoundaryConditions.SolarGeometry.BaseClasses.SolarHourAngle wFil
    annotation (Placement(transformation(extent={{-20,-120},{0,-100}})));
  parameter Modelica.SIunits.Time timZon "Time zone";
  parameter Modelica.SIunits.Angle lon "Longitude";
  Modelica.Blocks.Interfaces.RealInput w
    annotation (Placement(transformation(extent={{-140,10},{-100,50}})));
  Modelica.Blocks.Math.Cos cos[2]
    annotation (Placement(transformation(extent={{-80,120},{-60,140}})));
  Modelica.Blocks.Math.Sin sin[2]
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Math.Product c1
    annotation (Placement(transformation(extent={{-40,120},{-20,140}})));
  Modelica.Blocks.Math.Product c2
    annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
  Modelica.Blocks.Math.Sin sin1[2]
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Math.Sin sin2[2]
    annotation (Placement(transformation(extent={{20,-120},{40,-100}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.Add add1(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Blocks.Math.Add add2(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{60,-120},{80,-100}})));
  Modelica.Blocks.Math.Add add3(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Modelica.Blocks.Math.Product product[2]
    annotation (Placement(transformation(extent={{100,120},{120,140}})));
  Modelica.Blocks.Math.Product product1[2]
    annotation (Placement(transformation(extent={{100,80},{120,100}})));
  Modelica.Blocks.Math.Add hext1
    annotation (Placement(transformation(extent={{140,100},{160,120}})));
  Modelica.Blocks.Math.Add hext2
    annotation (Placement(transformation(extent={{140,60},{160,80}})));
equation
  connect(weaBus.lat, lat) annotation (Line(
      points={{-140,100},{-140,130},{-120,130}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus.solDec, solDec) annotation (Line(
      points={{-140,100},{-140,70},{-120,70}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(eqnTim.eqnTim, solTim.equTim) annotation (Line(
      points={{-79,-90},{-72,-90},{-72,-104},{-62,-104}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(locTim.locTim, solTim.locTim) annotation (Line(
      points={{-79,-130},{-72,-130},{-72,-115.4},{-62,-115.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(filTim.y, eqnTim.nDay) annotation (Line(
      points={{-119,-110},{-112,-110},{-112,-90},{-102,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(filTim.y, locTim.cloTim) annotation (Line(
      points={{-119,-110},{-112,-110},{-112,-130},{-102,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solTim.solTim, wFil.solTim) annotation (Line(
      points={{-39,-110},{-22,-110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weaBus.solHouAng, w) annotation (Line(
      points={{-140,100},{-140,30},{-120,30}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(lat, cos[1].u) annotation (Line(
      points={{-120,130},{-82,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solDec, cos[2].u) annotation (Line(
      points={{-120,70},{-90,70},{-90,130},{-82,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lat, sin[1].u) annotation (Line(
      points={{-120,130},{-100,130},{-100,90},{-82,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solDec, sin[2].u) annotation (Line(
      points={{-120,70},{-100,70},{-100,90},{-82,90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cos[1].y, c1.u1) annotation (Line(
      points={{-59,130},{-50,130},{-50,136},{-42,136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cos[2].y, c1.u2) annotation (Line(
      points={{-59,130},{-50,130},{-50,124},{-42,124}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sin[1].y, c2.u1) annotation (Line(
      points={{-59,90},{-50,90},{-50,96},{-42,96}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sin[2].y, c2.u2) annotation (Line(
      points={{-59,90},{-52,90},{-52,84},{-42,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(w, sin1[1].u) annotation (Line(
      points={{-120,30},{-82,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(wFil.solHouAng, sin2[1].u) annotation (Line(
      points={{1,-110},{18,-110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sin1[2].y, add.u1) annotation (Line(
      points={{-59,30},{-52,30},{-52,36},{-42,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sin1[1].y, add.u2) annotation (Line(
      points={{-59,30},{-52,30},{-52,24},{-42,24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sin2[2].y, add2.u1) annotation (Line(
      points={{41,-110},{48,-110},{48,-104},{58,-104}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sin2[1].y, add2.u2) annotation (Line(
      points={{41,-110},{48,-110},{48,-116},{58,-116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(c1.y, product[1].u1) annotation (Line(
      points={{-19,130},{0,130},{0,136},{98,136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, product[1].u2) annotation (Line(
      points={{-19,30},{0,30},{0,124},{98,124}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(c2.y, product1[1].u1) annotation (Line(
      points={{-19,90},{40,90},{40,96},{98,96}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, product1[1].u2) annotation (Line(
      points={{-59,-10},{40,-10},{40,84},{98,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product[1].y, hext1.u1) annotation (Line(
      points={{121,130},{130,130},{130,116},{138,116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1[1].y, hext1.u2) annotation (Line(
      points={{121,90},{130,90},{130,104},{138,104}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(c1.y, product[2].u1) annotation (Line(
      points={{-19,130},{0,130},{0,136},{98,136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, product[2].u2) annotation (Line(
      points={{81,-110},{90,-110},{90,124},{98,124}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product[2].y, hext2.u1) annotation (Line(
      points={{121,130},{126,130},{126,76},{138,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(c2.y, product1[2].u1) annotation (Line(
      points={{-19,90},{40,90},{40,96},{98,96}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, product1[2].u2) annotation (Line(
      points={{41,-70},{80,-70},{80,84},{98,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1[2].y, hext2.u2) annotation (Line(
      points={{121,90},{126,90},{126,64},{138,64}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -140},{220,140}}), graphics), Icon(coordinateSystem(extent={{-140,-140},
            {220,140}})));
end ExtraRadRatio;
