within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record Ceiling
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Materials.Screed,Materials.Insulation,Materials.Concrete,
        Materials.Plaster,Materials.InsulationUnderCeiling});
end Ceiling;
