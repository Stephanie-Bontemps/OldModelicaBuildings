within Buildings.HeatTransfer.WindowsBeta.Functions.BaseClasses;
partial function partialWindowShadingRadiation
  "partial function for window radiation property with shading device"
  input Real traRef[3, N, N, HEM](each min=0, each max=0)
    "Transmittance and reflectance with exterior irradiation and no shading";
  input Real traRefShaDev[2, 2](each min=0, each max=0)
    "Transmittance and reflectance of shading device";
  extends
    Buildings.HeatTransfer.WindowsBeta.Functions.BaseClasses.partialGlassRadiation;
protected
  Real traExtShaDev=traRefShaDev[1, 1]
    "Transmittance of the exterior shading device";
  Real refExtShaDev=traRefShaDev[2, 1]
    "Reflectance of the exterior shading device";
  Real traIntShaDev=traRefShaDev[1, 2]
    "Transmittance of the interior shading device";
  Real refIntShaDev=traRefShaDev[2, 2]
    "Reflectance of the interior shading device";
  annotation (preferedView="info",
  Documentation(info="<html>
This is a partial function that is used to implement the radiation funcitons for windows. It defines basic input variables and constants. 
</html>", revisions="<html>
<ul>
<li>
September 16 2010, by Wangda Zuo:<br>
First implementation.
</li>
</ul>
</html>"));
end partialWindowShadingRadiation;