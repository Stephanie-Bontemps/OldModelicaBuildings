within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record IntWall2
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=3,
  final material = {Materials.InteriorPlaster(                                                                          k=0.35),
                    Materials.HoneycombBrick(                                                                          x=0.115, k=0.331, d=1000),
                    Materials.InteriorPlaster(                                                                          k=0.35)});
end IntWall2;
