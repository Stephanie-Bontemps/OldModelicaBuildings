within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record Plasterboard
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=1000,
    x=0.013,
    k=0.25,
    d=900);
end Plasterboard;
