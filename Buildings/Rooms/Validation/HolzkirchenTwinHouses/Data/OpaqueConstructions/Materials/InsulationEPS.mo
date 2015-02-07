within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record InsulationEPS
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=840,
    d=80,
    x=0.08,
    k=0.04);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end InsulationEPS;
