within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record IntWall1 "Internal wall with a thickness of 27cm"
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=3,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.HoneycombBrick(x=0.24, k=0.331, d=1000),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InteriorPlaster(k=0.35)},
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.17,
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
end IntWall1;
