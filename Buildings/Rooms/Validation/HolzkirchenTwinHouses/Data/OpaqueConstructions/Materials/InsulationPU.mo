within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record InsulationPU
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    x=0.12,
    k=0.035,
    c=840,
    d=80);
end InsulationPU;
