within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record Plaster
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    x=0.01,
    c=1000,
    d=1200,
    k=1.0);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end Plaster;
