within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtWallWN
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Materials.ExteriorPlaster,Materials.InsulationMineralWool,
        Materials.FormerExtPlaster,Materials.HoneycombBrick,Materials.InteriorPlaster});
end ExtWallWN;
