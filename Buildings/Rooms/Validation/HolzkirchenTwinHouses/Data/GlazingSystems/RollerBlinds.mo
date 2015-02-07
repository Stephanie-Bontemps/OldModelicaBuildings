within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems;
record RollerBlinds "Shade produced by the roller blinds"
  extends HeatTransfer.Data.Shades.Generic(absIR_a=0.32, absIR_b=0.32);

  annotation (
Documentation(info="<html>
  <p>
  This is a model of the external blinds used in Holzkirchen twin houses. 
  Their absorptivity has been measured by Fraunhofer IBP as 0.32.
  </p>
  </html>", revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end RollerBlinds;
