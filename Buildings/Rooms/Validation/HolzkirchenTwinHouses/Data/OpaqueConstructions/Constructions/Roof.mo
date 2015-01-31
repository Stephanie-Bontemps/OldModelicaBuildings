within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record Roof
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=4,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.RoofTile(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.WoodInsulation(),
                    Buildings.HeatTransfer.Data.Gases.Air(x=0.10),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Plasterboard()});
end Roof;
