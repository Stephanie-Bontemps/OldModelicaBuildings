within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record CellarWallsFloor
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=1,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Concrete(x=0.3, k=2.1)});
end CellarWallsFloor;
