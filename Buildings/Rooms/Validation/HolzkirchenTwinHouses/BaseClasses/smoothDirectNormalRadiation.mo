within Buildings.Rooms.Validation.HolzkirchenTwinHouses.BaseClasses;
function smoothDirectNormalRadiation
  "Function to avoid impossible values for the direct normal radiation"
  input Modelica.SIunits.Angle zen "Zenith angle";
  input Real lim " Limit zenith angle (deg)";
  input Real x1 "First argument zenith < 89°";
  input Real x2 "Second argument zenith > 89°";
  output Real out "Result";
protected
    Real scaledX1;
    Real y;
    constant Real asin1 = Modelica.Math.asin(1);
    Real limRad = lim*2*Modelica.Constants.pi/360;
    Real deltax = (89*2*Modelica.Constants.pi/360-limRad)/2;
algorithm
    scaledX1 := (x1-x2)/deltax;
    if zen >= (89*2*Modelica.Constants.pi/360) then
      out := x2;
     elseif zen <= limRad then
       out := x1;
     else
       y := (Modelica.Math.tanh(Modelica.Math.tan(scaledX1*asin1)) + 1)/2;
       out := x1*y + (1 - y)*x2;
//     else
//       out := x1;
    end if;
end smoothDirectNormalRadiation;
