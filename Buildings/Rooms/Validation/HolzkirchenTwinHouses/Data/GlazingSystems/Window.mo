within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems;
model Window
  "Window used for all the windows in the façade and for the external door"
  extends HeatTransfer.Data.GlazingSystems.Generic(
  nLay=2,
  gas = {ArgonAirGap()},
  glass = {ExtGlass(),                                                                      IntGlass()},
    UFra=1.0,
    haveExteriorShade=false);
end Window;
