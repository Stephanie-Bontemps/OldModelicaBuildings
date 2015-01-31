within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record HoneycombBrick
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=1000,
    x=0.3,
    k=0.22,
    d=800);
end HoneycombBrick;
