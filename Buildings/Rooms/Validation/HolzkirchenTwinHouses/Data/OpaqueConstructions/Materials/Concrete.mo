within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record Concrete
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=1000,
    x=0.22,
    k=2.0,
    d=2400);
end Concrete;
