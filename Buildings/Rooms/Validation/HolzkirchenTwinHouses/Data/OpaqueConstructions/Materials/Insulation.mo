within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
model Insulation
  extends HeatTransfer.Data.Solids.Generic(
    x=0.04,
    k=0.04,
    c=840,
    d=80);
end Insulation;
