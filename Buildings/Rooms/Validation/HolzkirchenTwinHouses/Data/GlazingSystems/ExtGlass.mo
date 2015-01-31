within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems;
record ExtGlass "Interpane Clear float 4 mm"
  extends HeatTransfer.Data.Glasses.Generic(
    x=0.004,
    k=1,
    tauSol=0.842,
    rhoSol_a=0.076,
    rhoSol_b=0.076,
    tauIR=0,
    absIR_a=0.837,
    absIR_b=0.837);
end ExtGlass;
