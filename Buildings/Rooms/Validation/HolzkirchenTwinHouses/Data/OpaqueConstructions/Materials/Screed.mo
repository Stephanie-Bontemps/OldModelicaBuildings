within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record Screed
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=1000,
    x=0.04,
    k=1.4,
    d=2000);
end Screed;
