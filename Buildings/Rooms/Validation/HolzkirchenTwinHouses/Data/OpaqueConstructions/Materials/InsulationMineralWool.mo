within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record InsulationMineralWool
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=840,
    d=80,
    x=0.08,
    k=0.036);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end InsulationMineralWool;
