within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials;
record WoodDoor
  extends Buildings.HeatTransfer.Data.Solids.Generic(
    x=0.04,
    k=0.131,
    c=1000,
    d=600);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end WoodDoor;
