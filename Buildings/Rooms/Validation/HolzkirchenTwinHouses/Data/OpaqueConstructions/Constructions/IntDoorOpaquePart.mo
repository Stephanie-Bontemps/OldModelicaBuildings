within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record IntDoorOpaquePart "Internal door"
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=1,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.WoodDoor()});
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end IntDoorOpaquePart;
