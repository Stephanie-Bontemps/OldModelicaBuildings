within Buildings.Rooms.Validation.HolzkirchenTwinHouses.Data.GlazingSystems;
record IntGlass "Interpane Iplus E - 4 mm "
  extends HeatTransfer.Data.Glasses.Generic(x=0.004,
    k=1,
    tauSol=0.588,
    rhoSol_a=0.312,
    rhoSol_b=0.246,
    tauIR=0,
    absIR_a=0.037,
    absIR_b=0.837);
end IntGlass;
