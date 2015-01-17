within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
model InsulationUnderCeiling
  extends HeatTransfer.Data.Solids.Generic(
    x=0.10,
    k=0.035,
    c=840,
    d=80);
end InsulationUnderCeiling;
