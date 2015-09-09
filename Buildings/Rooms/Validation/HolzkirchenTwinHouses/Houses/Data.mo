within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses;
package Data
  "Package with data that are used in houses models implemented to avoid duplicate definition of data"
  extends Modelica.Icons.MaterialPropertiesPackage;

  package GlazingSystems
    "Glazing system constructions commonly found in Holzkirchen twin houses"
    extends Modelica.Icons.MaterialPropertiesPackage;

    record ExtGlass "Interpane Clear float 4 mm"
      extends Buildings.HeatTransfer.Data.Glasses.Generic(
        x=0.004,
        k=1,
        tauSol=0.842,
        rhoSol_a=0.076,
        rhoSol_b=0.076,
        tauIR=0,
        absIR_a=0.837,
        absIR_b=0.837);

      annotation (
    Documentation(info="<html>
  <p>
  This is a model of the external glass used in the window construction of the Holzkirchen twin houses. 
  </p>
  </html>",     revisions="<html>
  <ul>
  <li>
  January 16 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
    end ExtGlass;

    record IntGlass "Interpane Iplus E - 4 mm "
      extends Buildings.HeatTransfer.Data.Glasses.Generic(x=0.004,
        k=1,
        tauSol=0.588,
        rhoSol_a=0.312,
        rhoSol_b=0.246,
        tauIR=0,
        absIR_a=0.037,
        absIR_b=0.837);

      annotation (
    Documentation(info="<html>
  <p>
  This is a model of the internal glass used in the window construction of the Holzkirchen twin houses. 
  </p>
  </html>",     revisions="<html>
  <ul>
  <li>
  January 16 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
    end IntGlass;

    record ArgonAirGap "Gap between two glasses 90% argon and 10% air"
      extends Buildings.HeatTransfer.Data.Gases.Generic(
        x=0.016,
        MM=38.85E-3,
        a_k=2.334E-3,
        a_mu=3.413E-6,
        b_mu=6.300E-8,
        P0(displayUnit="Pa"),
        b_k=5.410E-5,
        a_c=557.782,
        b_c=9.19e-4);

      annotation (
    Documentation(info="<html>
  <p>
  This is a model of the gap between the two glasses used in the window construction of the Holzkirchen twin houses. 
  </p>
  </html>",     revisions="<html>
  <ul>
  <li>
  January 16 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
    end ArgonAirGap;

    record Window "Glazing system used in Holzkirchen twin touses"
      extends Buildings.HeatTransfer.Data.GlazingSystems.Generic(
      gas = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.ArgonAirGap()},
      glass = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.ExtGlass(), Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.GlazingSystems.IntGlass()},
      UFra=1.0,
      haveExteriorShade=false,
        absSolFra=0.4);

      annotation (Documentation(info="<html>
  <p>
  This is a model of the window construction used in Holzkirchen twin houses. It is a double glazing with low emissivity coating and argon fill. 
  This window construction is used for all the windows on the façade and on the external door.
  </p>
  </html>",     revisions="<html>
  <ul>
  <li>
  January 16 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
    end Window;

    record RollerBlinds "Shade produced by the roller blinds"
      extends Buildings.HeatTransfer.Data.Shades.Generic(absIR_a=0.32, absIR_b=0.32);

      annotation (
    Documentation(info="<html>
  <p>
  This is a model of the external blinds used in Holzkirchen twin houses. 
  Their absorptivity has been measured by Fraunhofer IBP as 0.32.
  </p>
  </html>",     revisions="<html>
  <ul>
  <li>
  January 16 2015, by Stephanie Bontemps:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
    end RollerBlinds;
  annotation(Documentation(info="<html>
    <p>
    This package contains data describing window constructions commonly found in Holzkirchen twin houses.
    </p>
    </html>"));
  end GlazingSystems;

  package OpaqueConstructions
    "Opaque constructions commonly found in Holzkirchen twin houses"
    extends Modelica.Icons.MaterialPropertiesPackage;

    package Materials "Materials commonly found in Holzkirchen twin houses"
      extends Modelica.Icons.MaterialPropertiesPackage;

      record ExteriorPlaster
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.01,
          k=0.8,
          c=1000,
          d=1200);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",
      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end ExteriorPlaster;

      record InsulationPU
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.12,
          k=0.035,
          c=840,
          d=80);
        annotation (Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end InsulationPU;

      record FormerExtPlaster
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.03,
          k=1.0,
          c=1000,
          d=1200);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end FormerExtPlaster;

      record HoneycombBrick
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          c=1000,
          x=0.3,
          k=0.22,
          d=800);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end HoneycombBrick;

      record InteriorPlaster
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.01,
          c=1000,
          d=1200,
          k=1.0);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end InteriorPlaster;

      record InsulationEPS
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          c=840,
          d=80,
          x=0.08,
          k=0.04);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end InsulationEPS;

      record InsulationMineralWool
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          c=840,
          d=80,
          x=0.08,
          k=0.036);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end InsulationMineralWool;

      record Screed
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          c=1000,
          x=0.04,
          k=1.4,
          d=2000);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end Screed;

      record Insulation
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.04,
          k=0.04,
          c=840,
          d=80);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end Insulation;

      record Concrete
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          c=1000,
          x=0.22,
          k=2.0,
          d=2400);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end Concrete;

      record Plaster
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.01,
          c=1000,
          d=1200,
          k=1.0);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end Plaster;

      record InsulationUnderCeiling
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.10,
          k=0.035,
          c=840,
          d=80);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end InsulationUnderCeiling;

      record LevellingFill
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.029,
          k=0.060,
          c=840,
          d=80);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end LevellingFill;

      record PURDammplatte025Insulation
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.030,
          k=0.025,
          c=840,
          d=80);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end PURDammplatte025Insulation;

      record CompositePanelPUR
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.033,
          k=0.023,
          c=840,
          d=80);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end CompositePanelPUR;

      record WoodDoor
        extends Buildings.HeatTransfer.Data.Solids.Generic(
          x=0.04,
          k=0.131,
          c=1000,
          d=600);
        annotation (
      Documentation(info="<html>
<p> See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the specification of materials and their thermophysical properties.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end WoodDoor;
      annotation(Documentation(info="<html>
  <p>
  This package contains materials used in the opaque constructions.
  </p>
  </html>"));
    end Materials;

    package Constructions
      "Constructions (walls, roof...) commonly found in Holzkirchen twin houses"
      extends Modelica.Icons.MaterialPropertiesPackage;

      record ExtWallSN "External wall on the south or on the north"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=5,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.ExteriorPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InsulationPU(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.FormerExtPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.HoneycombBrick(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.23,
          absSol_b=0.17,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.Smooth);
        annotation (Documentation(info="<html>
<p>
This is a construction of an external wall used for the north wall and a part of the south one.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end ExtWallSN;

      record ExtWallSNUnderWindow3
        "External wall under the window in the living room on the south"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=5,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.ExteriorPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InsulationPU(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.FormerExtPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.2),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.23,
          absSol_b=0.17,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.Smooth);
        annotation (
      Documentation(info="<html>
<p>
This is a construction of an external wall used for south wall under the multiple window.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end ExtWallSNUnderWindow3;

      record ExtWallE "External wall on the east"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=5,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.ExteriorPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InsulationPU(x=0.08, k=0.022),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.FormerExtPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.HoneycombBrick(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.23,
          absSol_b=0.17,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.Smooth);
        annotation (
      Documentation(info="<html>
<p>
This is a construction of an external wall used for the east wall.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end ExtWallE;

      record ExtWallWS "South part of the external wall on the west"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=5,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.ExteriorPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InsulationEPS(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.FormerExtPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.HoneycombBrick(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.23,
          absSol_b=0.17,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.Smooth);
        annotation (
      Documentation(info="<html>
<p>
This is a construction of an external wall used for the south part of the external wall on the west.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end ExtWallWS;

      record ExtWallWN "North part of the external wall on the west"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=5,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.ExteriorPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InsulationMineralWool(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.FormerExtPlaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.HoneycombBrick(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.23,
          absSol_b=0.17,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.Smooth);
        annotation (
      Documentation(info="<html>
<p>
This is a construction of an external wall used for the north part of the external wall on the west.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end ExtWallWN;

      record IntWall1 "Internal wall with a thickness of 27cm"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=3,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.24, k=0.331, d=1000),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35)},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.17,
          absSol_b=0.17,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.Smooth);
        annotation (
      Documentation(info="<html>
<p>
This is a construction of an internal wall (the one with a thickness of 27cm).
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end IntWall1;

      record IntWall2 "Internal wall with a thickness of 14cm"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=3,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.115, k=0.331, d=1000),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35)},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.17,
          absSol_b=0.17,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.Smooth);
        annotation (
      Documentation(info="<html>
<p>
This is a construction of an internal wall (the one with a thickness of 14cm).
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end IntWall2;

      record Ceiling "Ceiling"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=5,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.Screed(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.Insulation(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.Concrete(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.Plaster(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.InsulationUnderCeiling()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.6,
          absSol_b=0.17);
        annotation (
      Documentation(info="<html>
<p>
This is the construction of the ceiling.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end Ceiling;

      record Ground "Floor"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=5,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.Concrete(k=2.1),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.LevellingFill(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.PURDammplatte025Insulation(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.CompositePanelPUR(),
                          Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.Screed(x=0.065)},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.6,
          absSol_b=0.6);
        annotation (
      Documentation(info="<html>
<p>
This is the construction of the floor.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end Ground;

      record ExtDoorOpaquePart "External door in the lobby"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=1,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.WoodDoor()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.6,
          absSol_b=0.6,
          roughness_a=Buildings.HeatTransfer.Types.SurfaceRoughness.MediumSmooth);
        annotation (
      Documentation(info="<html>
<p>
This is the opaque composition of the external door in the lobby.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end ExtDoorOpaquePart;

      record IntDoorOpaquePart "Internal door"
        extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
        final nLay=1,
        material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Houses.Data.OpaqueConstructions.Materials.WoodDoor()},
          absIR_a=0.9,
          absIR_b=0.9,
          absSol_a=0.6,
          absSol_b=0.6);
        annotation (
      Documentation(info="<html>
<p>
This is the opaque composition of the internal door.
See report <i>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1 IEA ECB
Annex 58 Validation of Building Energy Simulation Tools Subtask 4 Version 6</i> for the wall composition.
</p>
</html>",      revisions="<html>
<ul>
<li>
January 16 2015, by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
      end IntDoorOpaquePart;
      annotation(Documentation(info="<html>
  <p>
  This package contains description of the opaque constructions found in the Holzkirchen twin houses.
  </p>
  </html>"));
    end Constructions;
    annotation(Documentation(info="<html>
  <p>
  This package contains construction models for walls, roofs and doors of
  the Holzkirchen twin houses.
  </p>
  </html>"));
  end OpaqueConstructions;
  annotation(Documentation(info="<html>
    <p>
    This package contains data for wall and window constructions commonly found in Holzkirchen twin houses.
    The data come from the report <I>Empirical Whole Model Validation Modelling Specification Test Case Twin_House_1, Version 6</I>, P. Strachan and I. Heusler, May 2014.
    </p>
    </html>"));
end Data;
