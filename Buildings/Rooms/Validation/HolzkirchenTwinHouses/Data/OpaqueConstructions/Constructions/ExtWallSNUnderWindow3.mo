within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtWallSNUnderWindow3
  "External wall under the window in the living room on the South"
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.ExteriorPlaster(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationPU(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.FormerExtPlaster(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.2),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster()},
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.23,
    absSol_b=0.17);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end ExtWallSNUnderWindow3;
