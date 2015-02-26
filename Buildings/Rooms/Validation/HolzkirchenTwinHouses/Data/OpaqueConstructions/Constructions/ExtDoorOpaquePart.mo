within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record ExtDoorOpaquePart "External door in the lobby"
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=1,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.WoodDoor()},
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.6,
    absSol_b=0.6);
  annotation (
Documentation(revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end ExtDoorOpaquePart;
