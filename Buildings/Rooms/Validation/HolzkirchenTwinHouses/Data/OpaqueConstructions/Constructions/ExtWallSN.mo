within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtWallSN
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Materials.ExteriorPlaster,Materials.InsulationPU,Materials.FormerExtPlaster,
        Materials.HoneycombBrick,Materials.InteriorPlaster});
end ExtWallSN;
