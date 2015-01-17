within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record IntDoorOpaquePart
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=1,
  final material = {Materials.WoodDoor});
end IntDoorOpaquePart;
