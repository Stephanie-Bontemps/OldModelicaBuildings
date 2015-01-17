within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtWallE
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Materials.ExteriorPlaster,
                    Materials.InsulationPU(                                                                          x=0.08, k=0.022),
        Materials.FormerExtPlaster,Materials.HoneycombBrick,Materials.InteriorPlaster});
end ExtWallE;
