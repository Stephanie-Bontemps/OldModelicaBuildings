within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtDoorOpaquePart
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=1,
  final material = {Materials.WoodDoor});
end ExtDoorOpaquePart;
