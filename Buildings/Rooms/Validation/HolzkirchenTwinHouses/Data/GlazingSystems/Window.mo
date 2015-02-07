within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems;
record Window "Glazing system used in Holzkirchen twin touses"
  extends HeatTransfer.Data.GlazingSystems.Generic(
  nLay=2,
  gas = {ArgonAirGap()},
  glass = {ExtGlass(), IntGlass()},
  UFra=1.0,
  haveExteriorShade=false);

  annotation (
defaultComponentName="datGlaSys",
Documentation(info="<html>
  <p>
  This is a model of a window construction used in Holzkirchen twin houses. It is a double glazing with low emissivity coating and argon fill. 
  This window construction is used for all the windows on the façade and on the external door.
  </p>
  </html>", revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end Window;
