within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtWallWS
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Materials.ExteriorPlaster,Materials.InsulationEPS,Materials.FormerExtPlaster,
        Materials.HoneycombBrick,Materials.InteriorPlaster});
end ExtWallWS;
