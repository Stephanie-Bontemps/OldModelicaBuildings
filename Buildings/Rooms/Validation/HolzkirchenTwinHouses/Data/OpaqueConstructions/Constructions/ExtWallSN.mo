within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtWallSN
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.ExteriorPlaster(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationPU(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.FormerExtPlaster(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster()});
end ExtWallSN;
