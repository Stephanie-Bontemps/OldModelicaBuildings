within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Constructions;
record Ceiling "Ceiling"
  extends Buildings.HeatTransfer.Data.OpaqueConstructions.Generic(
  final nLay=5,
  final material = {Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Screed(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Insulation(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Concrete(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.Plaster(),
                    Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.OpaqueConstructions.Materials.InsulationUnderCeiling()},
    absIR_a=0.9,
    absIR_b=0.9,
    absSol_a=0.6,
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
end Ceiling;
