within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record IntWall1
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=3,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.24, k=0.331, d=1000),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35)});
end IntWall1;
