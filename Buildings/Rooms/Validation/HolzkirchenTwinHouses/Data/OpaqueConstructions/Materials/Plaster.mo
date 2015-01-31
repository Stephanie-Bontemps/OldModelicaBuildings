within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record Plaster
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    x=0.01,
    c=1000,
    d=1200,
    k=1.0);
end Plaster;
