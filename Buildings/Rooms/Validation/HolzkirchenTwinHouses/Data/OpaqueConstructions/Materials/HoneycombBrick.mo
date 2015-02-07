within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record HoneycombBrick
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    c=1000,
    x=0.3,
    k=0.22,
    d=800);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end HoneycombBrick;
