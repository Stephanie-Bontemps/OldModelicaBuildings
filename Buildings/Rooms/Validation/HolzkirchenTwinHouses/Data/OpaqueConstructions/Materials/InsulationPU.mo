within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record InsulationPU
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    x=0.12,
    k=0.035,
    c=840,
    d=80);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end InsulationPU;
