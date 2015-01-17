within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record CellarWallsFloor
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=1,
  final material = {Materials.Concrete(                                                                          x=0.3, k=2.1)});
end CellarWallsFloor;
