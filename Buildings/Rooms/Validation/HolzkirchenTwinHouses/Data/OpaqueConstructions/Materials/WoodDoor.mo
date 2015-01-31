within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record WoodDoor
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    x=0.04,
    k=0.131,
    c=1000,
    d=600);
end WoodDoor;
