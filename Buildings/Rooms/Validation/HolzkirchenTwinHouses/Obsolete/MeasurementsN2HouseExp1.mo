within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Obsolete;
model MeasurementsN2HouseExp1
  "Extraction of the measurements on N2 House during Experimentation 1"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.CombiTimeTable combiTable1Ds(
    tableOnFile=true,
    tableName="data",
    columns=2:35,
    fileName=
        "D:/Berkeley/Berkeley - IEA58/Twin_house_exp1_house_N2_60min_modifiedTest.txt",
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

  annotation (experiment(
      StartTime=2.00448e+007,
      StopTime=2.35872e+007,
      Interval=3600,
      __Dymola_Algorithm="Dassl"), __Dymola_experimentSetupOutput);
end MeasurementsN2HouseExp1;
