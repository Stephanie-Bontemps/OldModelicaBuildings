within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems;
record ArgonAirGap "Gap between two glasses 90% argon and 10% air"
  extends HeatTransfer.Data.Gases.Generic(
    x=0.016,
    MM=38.85E-3,
    a_k=2.334E-3,
    b_k=5.410E-5,
    a_mu=3.413E-6,
    b_mu=6.300E-8,
    a_c=557.782,
    b_c=9.19E-4);

  annotation (
Documentation(info="<html>
  <p>
  This is a model of the gap between the two glasses used in the window construction used in Holzkirchen twin houses. 
  </p>
  </html>", revisions="<html>
<ul>
<li>
January 16, 2015 by Stephanie Bontemps:<br/>
First implementation.
</li>
</ul>
</html>"));
end ArgonAirGap;
