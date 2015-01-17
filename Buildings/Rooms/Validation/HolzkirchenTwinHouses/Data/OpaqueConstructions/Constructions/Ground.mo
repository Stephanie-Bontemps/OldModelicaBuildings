within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record Ground
  extends HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Materials.Concrete(                                                                          k=2.1),
        Materials.LevellingFill,Materials.PURDammplatte025Insulation,Materials.CompositePanelPUR,
                    Materials.Screed(                                                                          x=0.065)});
end Ground;
