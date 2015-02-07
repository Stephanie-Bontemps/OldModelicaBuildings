within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
model MultiHeatingCoolingSchedule
  "Heating and cooling experimental schedule using imposed constant temperature or imposed heat or cooling power for all the rooms"

  parameter Real kHea=1E6 "Gain value multiplied with input signal for heating";
  parameter Real kCoo=-1E6
    "Gain value multiplied with input signal for cooling";

  Modelica.Blocks.Logical.GreaterThreshold
                                       booTabTorFlo(threshold=0.5)
    "Boolean table to choose the scenario(constant temperature set point or imposed heat flow)"
    annotation (Placement(transformation(extent={{-160,-10},{-140,10}})));
  Modelica.Blocks.Interfaces.RealInput heaCooFlo[7]
    "Heat or cooling power input applied depending on the scenario" annotation (
     Placement(transformation(extent={{-240,40},{-200,80}}), iconTransformation(
          extent={{-240,40},{-200,80}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloConKit
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,180},{100,200}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bCon[7]
    "Convective split" annotation (Placement(transformation(extent={{190,40},{210,
            60}}), iconTransformation(extent={{190,40},{210,60}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRadKit
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,160},{100,180}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bRad[7]
    "Radiative split" annotation (Placement(transformation(extent={{190,-60},{210,
            -40}}), iconTransformation(extent={{190,-60},{210,-40}})));
  Separate sepKit(k1=0.7, k2=0.3) "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,180},{60,200}})));
  Modelica.Blocks.Interfaces.RealInput TSetHea[7]
    "Heating temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-240,-70},{-200,-30}}),
        iconTransformation(extent={{-240,-80},{-200,-40}})));
  Modelica.Blocks.Interfaces.RealInput TSetCoo[7]
    "Cooling temperature set point input applied depending on the scenario"
    annotation (Placement(transformation(extent={{-240,-200},{-200,-160}}),
        iconTransformation(extent={{-240,-200},{-200,-160}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TRooAir[7]
    "Room air temperature"
    annotation (Placement(transformation(extent={{-180,160},{-160,180}})));
  Modelica.Blocks.Math.Mean TRooHou[7](each f=1/3600, each y(start=293.15))
    "Hourly averaged room air temperature"
    annotation (Placement(transformation(extent={{-140,180},{-120,200}})));
  Modelica.Blocks.Math.Mean TRooAnn[7](each f=1/86400/365, each y(start=293.15))
    "Annual averaged room air temperature"
    annotation (Placement(transformation(extent={{-140,140},{-120,160}})));

  Modelica.Blocks.Logical.Switch swiKit
    annotation (Placement(transformation(extent={{0,180},{20,200}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_bTSet[7]
    "Calculated temperature used for the set point" annotation (Placement(
        transformation(extent={{-210,160},{-190,180}}), iconTransformation(
          extent={{-210,160},{-190,180}})));
  TemperatureSetPoint TSetPoiKit(kHea=kHea, kCoo=kCoo)
    "Temperature set point for the kitchen"
    annotation (Placement(transformation(extent={{-40,160},{-20,180}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloConLob
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,120},{100,140}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRadLob
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,100},{100,120}})));
  Separate sepLob(k1=0.7, k2=0.3) "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,120},{60,140}})));
  Modelica.Blocks.Logical.Switch swiLob
    annotation (Placement(transformation(extent={{0,120},{20,140}})));
  TemperatureSetPoint TSetPoiLob(kHea=kHea, kCoo=kCoo)
    "Temperature set point for the lobby"
    annotation (Placement(transformation(extent={{-40,100},{-20,120}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloConNorBed
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,60},{100,80}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRadNorBed
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,40},{100,60}})));
  Separate sepNorBed(
                    k1=0.7, k2=0.3)
    "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Logical.Switch swiNorBed
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  TemperatureSetPoint TSetPoiNorBed(kHea=kHea, kCoo=kCoo)
    "Temperature set point for the North bedroom"
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloConCor
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,0},{100,20}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRadCor
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Separate sepCor(  k1=0.7, k2=0.3)
    "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Blocks.Logical.Switch swiCor
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  TemperatureSetPoint TSetPoiCor(kHea=kHea, kCoo=kCoo)
    "Temperature set point for the corridor"
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloConBat
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRadBat
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  Separate sepBat(  k1=0.7, k2=0.3)
    "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Blocks.Logical.Switch swiBat
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  TemperatureSetPoint TSetPoiBat(kHea=kHea, kCoo=kCoo)
    "Temperature set point for the bathroom"
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloConSouBed
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,-120},{100,-100}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRadSouBed
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,-140},{100,-120}})));
  Separate sepSouBed(
                    k1=0.7, k2=0.3)
    "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  Modelica.Blocks.Logical.Switch swiSouBed
    annotation (Placement(transformation(extent={{0,-120},{20,-100}})));
  TemperatureSetPoint TSetPoiSouBed(kHea=kHea, kCoo=kCoo)
    "Temperature set point for the South bedroom"
    annotation (Placement(transformation(extent={{-40,-140},{-20,-120}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloConLivRoo
    "Prescribed heat or cooling flow for the convective part"
    annotation (Placement(transformation(extent={{80,-180},{100,-160}})));
  HeatTransfer.Sources.PrescribedHeatFlow preHeaCooFloRadLivRoo
    "Prescribed heat or cooling flow for the radiative part"
    annotation (Placement(transformation(extent={{80,-200},{100,-180}})));
  Separate sepLivRoo(
                    k1=0.7, k2=0.3)
    "y1: convective part and y2: radiative part"
    annotation (Placement(transformation(extent={{40,-180},{60,-160}})));
  Modelica.Blocks.Logical.Switch swiLivRoo
    annotation (Placement(transformation(extent={{0,-180},{20,-160}})));
  TemperatureSetPoint TSetPoiLivRoo(kHea=kHea, kCoo=kCoo)
    "Temperature set point for the living room"
    annotation (Placement(transformation(extent={{-40,-200},{-20,-180}})));
  Modelica.Blocks.Interfaces.RealInput schChoice
    "Temperature set point or heating and cooling power" annotation (Placement(
        transformation(extent={{-240,-20},{-200,20}}), iconTransformation(
          extent={{-240,-20},{-200,20}})));
equation
  connect(sepKit.y2, preHeaCooFloRadKit.Q_flow) annotation (Line(
      points={{61,185},{70,185},{70,170},{80,170}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepKit.y1, preHeaCooFloConKit.Q_flow) annotation (Line(
      points={{61,195},{70,195},{70,190},{80,190}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swiKit.y, sepKit.u) annotation (Line(
      points={{21,190},{38,190}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoiKit.y, swiKit.u3) annotation (Line(
      points={{-19,170},{-12,170},{-12,182},{-2,182}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepLob.y2, preHeaCooFloRadLob.Q_flow) annotation (Line(
      points={{61,125},{70,125},{70,110},{80,110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepLob.y1, preHeaCooFloConLob.Q_flow) annotation (Line(
      points={{61,135},{70,135},{70,130},{80,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swiLob.y, sepLob.u) annotation (Line(
      points={{21,130},{38,130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoiLob.y, swiLob.u3) annotation (Line(
      points={{-19,110},{-12,110},{-12,122},{-2,122}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepNorBed.y2, preHeaCooFloRadNorBed.Q_flow) annotation (Line(
      points={{61,65},{70,65},{70,50},{80,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepNorBed.y1, preHeaCooFloConNorBed.Q_flow) annotation (Line(
      points={{61,75},{70,75},{70,70},{80,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swiNorBed.y, sepNorBed.u) annotation (Line(
      points={{21,70},{38,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoiNorBed.y, swiNorBed.u3) annotation (Line(
      points={{-19,50},{-12,50},{-12,62},{-2,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepCor.y2, preHeaCooFloRadCor.Q_flow) annotation (Line(
      points={{61,5},{70,5},{70,-10},{80,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepCor.y1, preHeaCooFloConCor.Q_flow) annotation (Line(
      points={{61,15},{70,15},{70,10},{80,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swiCor.y, sepCor.u) annotation (Line(
      points={{21,10},{38,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoiCor.y, swiCor.u3) annotation (Line(
      points={{-19,-10},{-12,-10},{-12,2},{-2,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepBat.y2, preHeaCooFloRadBat.Q_flow) annotation (Line(
      points={{61,-55},{70,-55},{70,-70},{80,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepBat.y1, preHeaCooFloConBat.Q_flow) annotation (Line(
      points={{61,-45},{70,-45},{70,-50},{80,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swiBat.y, sepBat.u) annotation (Line(
      points={{21,-50},{38,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoiBat.y, swiBat.u3) annotation (Line(
      points={{-19,-70},{-12,-70},{-12,-58},{-2,-58}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepSouBed.y2, preHeaCooFloRadSouBed.Q_flow) annotation (Line(
      points={{61,-115},{70,-115},{70,-130},{80,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepSouBed.y1, preHeaCooFloConSouBed.Q_flow) annotation (Line(
      points={{61,-105},{70,-105},{70,-110},{80,-110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swiSouBed.y, sepSouBed.u) annotation (Line(
      points={{21,-110},{38,-110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoiSouBed.y, swiSouBed.u3) annotation (Line(
      points={{-19,-130},{-12,-130},{-12,-118},{-2,-118}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepLivRoo.y2, preHeaCooFloRadLivRoo.Q_flow) annotation (Line(
      points={{61,-175},{70,-175},{70,-190},{80,-190}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sepLivRoo.y1, preHeaCooFloConLivRoo.Q_flow) annotation (Line(
      points={{61,-165},{70,-165},{70,-170},{80,-170}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(swiLivRoo.y, sepLivRoo.u) annotation (Line(
      points={{21,-170},{38,-170}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetPoiLivRoo.y, swiLivRoo.u3) annotation (Line(
      points={{-19,-190},{-12,-190},{-12,-178},{-2,-178}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swiKit.u2) annotation (Line(
      points={{-139,0},{-110,0},{-110,190},{-2,190}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swiLob.u2) annotation (Line(
      points={{-139,0},{-110,0},{-110,130},{-2,130}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swiNorBed.u2) annotation (Line(
      points={{-139,0},{-110,0},{-110,70},{-2,70}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swiCor.u2) annotation (Line(
      points={{-139,0},{-110,0},{-110,10},{-2,10}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swiBat.u2) annotation (Line(
      points={{-139,0},{-110,0},{-110,-50},{-2,-50}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swiSouBed.u2) annotation (Line(
      points={{-139,0},{-110,0},{-110,-110},{-2,-110}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booTabTorFlo.y, swiLivRoo.u2) annotation (Line(
      points={{-139,0},{-110,0},{-110,-170},{-2,-170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(heaCooFlo[1], swiKit.u1) annotation (Line(
      points={{-220,42.8571},{-100,42.8571},{-100,198},{-2,198}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo[2], swiLob.u1) annotation (Line(
      points={{-220,48.5714},{-100,48.5714},{-100,138},{-2,138}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo[3], swiNorBed.u1) annotation (Line(
      points={{-220,54.2857},{-100,54.2857},{-100,78},{-2,78}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo[4], swiCor.u1) annotation (Line(
      points={{-220,60},{-100,60},{-100,18},{-2,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo[5], swiBat.u1) annotation (Line(
      points={{-220,65.7143},{-100,65.7143},{-100,-42},{-2,-42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo[6], swiSouBed.u1) annotation (Line(
      points={{-220,71.4286},{-100,71.4286},{-100,-102},{-2,-102}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaCooFlo[7], swiLivRoo.u1) annotation (Line(
      points={{-220,77.1429},{-100,77.1429},{-100,-162},{-2,-162}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea[1], TSetPoiKit.TSetHea) annotation (Line(
      points={{-220,-67.1429},{-70,-67.1429},{-70,176},{-42,176}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea[2], TSetPoiLob.TSetHea) annotation (Line(
      points={{-220,-61.4286},{-70,-61.4286},{-70,116},{-42,116}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea[3], TSetPoiNorBed.TSetHea) annotation (Line(
      points={{-220,-55.7143},{-70,-55.7143},{-70,56},{-42,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea[4], TSetPoiCor.TSetHea) annotation (Line(
      points={{-220,-50},{-70,-50},{-70,-4},{-42,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea[5], TSetPoiBat.TSetHea) annotation (Line(
      points={{-220,-44.2857},{-70,-44.2857},{-70,-64},{-42,-64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea[6], TSetPoiSouBed.TSetHea) annotation (Line(
      points={{-220,-38.5714},{-70,-38.5714},{-70,-124},{-42,-124}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHea[7], TSetPoiLivRoo.TSetHea) annotation (Line(
      points={{-220,-32.8571},{-70,-32.8571},{-70,-184},{-42,-184}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo[1], TSetPoiKit.TSetCoo) annotation (Line(
      points={{-220,-197.143},{-60,-197.143},{-60,164},{-42,164}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo[2], TSetPoiLob.TSetCoo) annotation (Line(
      points={{-220,-191.429},{-60,-191.429},{-60,104},{-42,104}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo[3], TSetPoiNorBed.TSetCoo) annotation (Line(
      points={{-220,-185.714},{-60,-185.714},{-60,44},{-42,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo[4], TSetPoiCor.TSetCoo) annotation (Line(
      points={{-220,-180},{-60,-180},{-60,-16},{-42,-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo[5], TSetPoiBat.TSetCoo) annotation (Line(
      points={{-220,-174.286},{-60,-174.286},{-60,-76},{-42,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo[6], TSetPoiSouBed.TSetCoo) annotation (Line(
      points={{-220,-168.571},{-60,-168.571},{-60,-136},{-42,-136}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoo[7], TSetPoiLivRoo.TSetCoo) annotation (Line(
      points={{-220,-162.857},{-60,-162.857},{-60,-196},{-42,-196}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preHeaCooFloConKit.port, port_bCon[1]) annotation (Line(
      points={{100,190},{140,190},{140,41.4286},{200,41.4286}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloConLob.port, port_bCon[2]) annotation (Line(
      points={{100,130},{140,130},{140,44.2857},{200,44.2857}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloConNorBed.port, port_bCon[3]) annotation (Line(
      points={{100,70},{140,70},{140,47.1429},{200,47.1429}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloConCor.port, port_bCon[4]) annotation (Line(
      points={{100,10},{140,10},{140,50},{200,50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloConBat.port, port_bCon[5]) annotation (Line(
      points={{100,-50},{140,-50},{140,52.8571},{200,52.8571}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloConSouBed.port, port_bCon[6]) annotation (Line(
      points={{100,-110},{140,-110},{140,55.7143},{200,55.7143}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloConLivRoo.port, port_bCon[7]) annotation (Line(
      points={{100,-170},{140,-170},{140,58.5714},{200,58.5714}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloRadKit.port, port_bRad[1]) annotation (Line(
      points={{100,170},{180,170},{180,-58.5714},{200,-58.5714}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloRadLob.port, port_bRad[2]) annotation (Line(
      points={{100,110},{180,110},{180,-55.7143},{200,-55.7143}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloRadNorBed.port, port_bRad[3]) annotation (Line(
      points={{100,50},{180,50},{180,-52.8571},{200,-52.8571}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloRadCor.port, port_bRad[4]) annotation (Line(
      points={{100,-10},{180,-10},{180,-50},{200,-50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloRadBat.port, port_bRad[5]) annotation (Line(
      points={{100,-70},{140,-70},{140,-70},{180,-70},{180,-47.1429},{200,
          -47.1429}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(preHeaCooFloRadSouBed.port, port_bRad[6]) annotation (Line(
      points={{100,-130},{180,-130},{180,-44.2857},{200,-44.2857}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(preHeaCooFloRadLivRoo.port, port_bRad[7]) annotation (Line(
      points={{100,-190},{180,-190},{180,-41.4286},{200,-41.4286}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(schChoice, booTabTorFlo.u) annotation (Line(
      points={{-220,0},{-162,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(port_bTSet, TRooAir.port) annotation (Line(
      points={{-200,170},{-180,170}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TRooAir.T, TRooHou.u) annotation (Line(
      points={{-160,170},{-152,170},{-152,190},{-142,190}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir.T, TRooAnn.u) annotation (Line(
      points={{-160,170},{-152,170},{-152,150},{-142,150}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir[1].T, TSetPoiKit.TRooAir) annotation (Line(
      points={{-160,170},{-42,170}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir[2].T, TSetPoiLob.TRooAir) annotation (Line(
      points={{-160,170},{-80,170},{-80,110},{-42,110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir[3].T, TSetPoiNorBed.TRooAir) annotation (Line(
      points={{-160,170},{-80,170},{-80,50},{-42,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir[4].T, TSetPoiCor.TRooAir) annotation (Line(
      points={{-160,170},{-80,170},{-80,-10},{-42,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir[5].T, TSetPoiBat.TRooAir) annotation (Line(
      points={{-160,170},{-80,170},{-80,-70},{-42,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir[6].T, TSetPoiSouBed.TRooAir) annotation (Line(
      points={{-160,170},{-80,170},{-80,-130},{-42,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TRooAir[7].T, TSetPoiLivRoo.TRooAir) annotation (Line(
      points={{-160,170},{-80,170},{-80,-190},{-42,-190}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -200},{200,200}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-200},{200,200}}), graphics={
                               Rectangle(extent={{-180,180},{180,-180}},
            lineColor={0,0,0}),
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
