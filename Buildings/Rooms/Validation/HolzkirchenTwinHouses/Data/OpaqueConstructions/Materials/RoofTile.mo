within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record RoofTile
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=1000,
    x=0.02,
    k=0.961,
    d=2000);
end RoofTile;
