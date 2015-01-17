within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtWallSNUnderWindow3
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Materials.ExteriorPlaster,Materials.InsulationPU,Materials.FormerExtPlaster,
                    Materials.HoneycombBrick(                                                                          x=0.2),
        Materials.InteriorPlaster});
end ExtWallSNUnderWindow3;
