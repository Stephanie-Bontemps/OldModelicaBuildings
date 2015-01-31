within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record WoodInsulation
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=840,
    x=0.16,
    k=0.050,
    d=28);
end WoodInsulation;
