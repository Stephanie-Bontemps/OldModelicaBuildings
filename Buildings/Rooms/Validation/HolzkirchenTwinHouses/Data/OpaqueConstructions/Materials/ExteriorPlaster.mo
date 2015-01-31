within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record ExteriorPlaster
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    x=0.01,
    k=0.8,
    c=1000,
    d=1200);
end ExteriorPlaster;
