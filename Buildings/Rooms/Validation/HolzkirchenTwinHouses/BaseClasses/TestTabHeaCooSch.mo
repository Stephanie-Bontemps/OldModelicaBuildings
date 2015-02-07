within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model TestTabHeaCooSch
  "Test in order to check if the table to choose between temperature set point and heating or cooling power is working as expected"
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
    __Dymola_experimentSetupOutput);
end TestTabHeaCooSch;
