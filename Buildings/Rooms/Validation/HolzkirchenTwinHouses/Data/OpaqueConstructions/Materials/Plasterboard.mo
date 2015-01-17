within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
model Plasterboard
  extends HeatTransfer.Data.Solids.Generic(
    c=1000,
    x=0.013,
    k=0.25,
    d=900);
end Plasterboard;
