within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record Roof
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=4,
  final material = {Materials.RoofTile,Materials.WoodInsulation,
                    Buildings.HeatTransfer.Data.Gases.Air,Materials.Plasterboard});
end Roof;
