within Buildings.Rooms.BaseClasses;
model TestBoundariesFile

  Modelica.Blocks.Sources.CombiTimeTable bouVenHea(
    final tableOnFile=true,
    final tableName="data",
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
    "Boundary conditions for ceiling (1 for East, 2 for West) and floor (3); ventilation supply flow rate (6) and its temperature (4); ventilation extraction flow rate (7) and its temperature (5); heating or cooling power for the different rooms (8: kitchen, 9: lobby, 10: North bedroom, 11: corridor, 12: bathroom, 13: South bedroom, 14: living room); heating temperature set point for the different rooms (15: kitchen, 16: lobby, 17: North bedroom, 18: corridor, 19: bathroom, 20: South bedroom, 21: living room); cooling temperature set point for the different rooms (22: kitchen, 23: lobby, 24: North bedroom, 25: corridor, 26: bathroom, 27: South bedroom, 28: living room); internal gains in the kitchen (29)"
    annotation (Placement(transformation(extent={{-78,20},{-58,40}})));
  annotation ();
end TestBoundariesFile;
