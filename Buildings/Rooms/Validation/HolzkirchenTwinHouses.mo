within Buildings.Rooms.Validation;
package HolzkirchenTwinHouses
  "Validation of Holzkirchen twin houses IEA ECB Annex 58"
  extends Modelica.Icons.ExamplesPackage;
  package Houses
    "Individual models of twin houses built in Holzkirchen, Germany in the context of the IEA ECB Annex 58"
    extends Modelica.Icons.Package;
  end Houses;

  package Examples
    "Validation exercices on the models of the Holzkirchen twin houses"
    extends Modelica.Icons.ExamplesPackage;
    package Experiment1
      "First validation exercice on the models of the Holzkirchen twin houses"
      extends Modelica.Icons.ExamplesPackage;
    end Experiment1;

    package Experiment2
      "Second validation exercice on the models of the Holzkirchen twin houses"
      extends Modelica.Icons.ExamplesPackage;
    end Experiment2;
  end Examples;

  package Data
    "Package with data that are used in houses models implemented to avoid duplicate definition of data."
    extends Modelica.Icons.MaterialPropertiesPackage;
    package GlazingSystems
      "Glazing system constructions commonly found in Holzkirchen twin houses"
      extends Modelica.Icons.MaterialPropertiesPackage;
    end GlazingSystems;

    package OpaqueConstructions
      "Opaque constructions commonly found in Holzkirchen twin houses"
      extends Modelica.Icons.MaterialPropertiesPackage;
      package Materials "Materials commonly found in Holzkirchen twin houses"
        extends Modelica.Icons.MaterialPropertiesPackage;
        model ExteriorPlaster
          extends HeatTransfer.Data.Solids.Generic(
            x=0.01,
            k=0.8,
            c=1000,
            d=1200);
        end ExteriorPlaster;

        model InsulationPU
          extends HeatTransfer.Data.Solids.Generic(
            x=0.12,
            k=0.035,
            c=840,
            d=80);
        end InsulationPU;

        model FormerExtPlaster
          extends HeatTransfer.Data.Solids.Generic(
            x=0.03,
            k=1.0,
            c=1000,
            d=1200);
        end FormerExtPlaster;

        model HoneycombBrick
          extends HeatTransfer.Data.Solids.Generic(
            c=1000,
            x=0.3,
            k=0.22,
            d=800);
        end HoneycombBrick;

        model InteriorPlaster
          extends HeatTransfer.Data.Solids.Generic(
            x=0.01,
            c=1000,
            d=1200,
            k=1.0);
        end InteriorPlaster;

        model InsulationEPS
          extends HeatTransfer.Data.Solids.Generic(
            c=840,
            d=80,
            x=0.08,
            k=0.04);
        end InsulationEPS;

        model InsulationMineralWool
          extends HeatTransfer.Data.Solids.Generic(
            c=840,
            d=80,
            x=0.08,
            k=0.036);
        end InsulationMineralWool;

        model Screed
          extends HeatTransfer.Data.Solids.Generic(
            c=1000,
            x=0.04,
            k=1.4,
            d=2000);
        end Screed;

        model Insulation
          extends HeatTransfer.Data.Solids.Generic(
            x=0.04,
            k=0.04,
            c=840,
            d=80);
        end Insulation;

        model Concrete
          extends HeatTransfer.Data.Solids.Generic(
            c=1000,
            x=0.22,
            k=2.0,
            d=2400);
        end Concrete;

        model Plaster
          extends HeatTransfer.Data.Solids.Generic(
            x=0.01,
            c=1000,
            d=1200,
            k=1.0);
        end Plaster;

        model InsulationUnderCeiling
          extends HeatTransfer.Data.Solids.Generic(
            x=0.10,
            k=0.035,
            c=840,
            d=80);
        end InsulationUnderCeiling;

        model LevellingFill
          extends HeatTransfer.Data.Solids.Generic(
            x=0.029,
            k=0.060,
            c=840,
            d=80);
        end LevellingFill;

        model PURDammplatte025Insulation
          extends HeatTransfer.Data.Solids.Generic(
            x=0.030,
            k=0.025,
            c=840,
            d=80);
        end PURDammplatte025Insulation;

        model CompositePanelPUR
          extends HeatTransfer.Data.Solids.Generic(
            x=0.033,
            k=0.023,
            c=840,
            d=80);
        end CompositePanelPUR;

        model RoofTile
          extends HeatTransfer.Data.Solids.Generic(
            c=1000,
            x=0.02,
            k=0.961,
            d=2000);
        end RoofTile;

        model WoodInsulation
          extends HeatTransfer.Data.Solids.Generic(
            c=840,
            x=0.16,
            k=0.050,
            d=28);
        end WoodInsulation;

        model Plasterboard
          extends HeatTransfer.Data.Solids.Generic(
            c=1000,
            x=0.013,
            k=0.25,
            d=900);
        end Plasterboard;
      end Materials;

      package Constructions
        "Constructions (walls, roof...) commonly found in Holzkirchen twin houses"
        extends Modelica.Icons.MaterialPropertiesPackage;

        record ExtWallSN
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=5,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.ExteriorPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationPU,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.FormerExtPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster});
        end ExtWallSN;

        record ExtWallSNUnderWindow3
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=5,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.ExteriorPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationPU,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.FormerExtPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.2),
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster});
        end ExtWallSNUnderWindow3;

        record ExtWallE
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=5,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.ExteriorPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationPU(x=0.08, k=0.022),
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.FormerExtPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster});
        end ExtWallE;

        record ExtWallWS
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=5,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.ExteriorPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationEPS,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.FormerExtPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster});
        end ExtWallWS;

        record ExtWallWN
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=5,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.ExteriorPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationMineralWool,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.FormerExtPlaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster});
        end ExtWallWN;

        record IntWall1
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=3,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35),
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.24, k=0.331, d=1000),
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35)});
        end IntWall1;

        record IntWall2
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=3,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35),
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.115, k=0.331, d=1000),
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35)});
        end IntWall2;

        record Ceiling
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=5,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Screed,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Insulation,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Concrete,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Plaster,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationUnderCeiling});
        end Ceiling;

        record Ground
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=5,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Concrete(k=2.1),
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.LevellingFill,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.PURDammplatte025Insulation,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.CompositePanelPUR,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Screed(x=0.065)});
        end Ground;

        record Roof
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=4,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.RoofTile,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.WoodInsulation,
                            Buildings.HeatTransfer.Data.Gases.Air,
                            Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Plasterboard});
        end Roof;

        record CellarWallsFloor
          extends HeatTransfer.Data.OpaqueConstructions.Generic(
          final nLay=1,
          final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Concrete(x=0.3, k=2.1)});
        end CellarWallsFloor;
      end Constructions;
    end OpaqueConstructions;
  end Data;
end HolzkirchenTwinHouses;
