within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtDoorOpaquePart
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=1,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.WoodDoor()});
end ExtDoorOpaquePart;
