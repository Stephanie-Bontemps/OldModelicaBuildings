#include <moutil.c>
PreNonAliasDef(51)
PreNonAliasDef(52)
PreNonAliasDef(53)
PreNonAliasDef(54)
PreNonAliasDef(55)
StartNonAlias(50)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.bouConExt.HDirTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExt.HDirTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.nOpa", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.nTot", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.bouConExt.HDirTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.bouConExt.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExt.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.relHum", "Relative humidity [1]", \
"N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.lobby.bouConExt.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDifTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.HDirTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].ove.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.bouConExtWin.sha[1].weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExtWin.sha[1].weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.nOpa", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.nTot", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.sha[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.bouConExtWin.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.bouConExtWin.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.relHum", "Relative humidity [1]",\
 "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.lobby.bouConExtWin.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.lobby.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.lobby.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.lobby.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.lobby.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.lobby.weaBus.TDewPoi", "Output temperature [K|degC]", \
"weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.lobby.weaBus.TDryBul", "Output temperature [K|degC]", \
"N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316, 4)
DeclareAlias2("N2House.lobby.weaBus.TWetBul", "Wet bulb temperature [K]", \
"N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.lobby.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.lobby.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.lobby.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.lobby.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.lobby.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.lobby.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.lobby.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.lobby.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.lobby.weaBus.relHum", "Relative humidity [1]", \
"N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.lobby.weaBus.solAlt", "Altitude angle [rad|deg]", \
"N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.lobby.weaBus.solDec", "Declination angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.lobby.weaBus.solHouAng", "Solar hour angle [rad|deg]", \
"N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.lobby.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.lobby.weaBus.solZen", "Zenith angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.lobby.weaBus.winDir", "Wind direction [rad|deg]", \
"N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.lobby.weaBus.winSpe", "Wind speed [m/s]", \
"N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.mulAirLea.outEas.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.mulAirLea.outEas.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.mulAirLea.outEas.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.mulAirLea.outNor.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.mulAirLea.outNor.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.mulAirLea.outNor.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.mulAirLea.outSou.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.mulAirLea.outSou.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.mulAirLea.outSou.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.mulAirLea.outWes.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.mulAirLea.outWes.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.mulAirLea.outWes.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.TDryBul", "Output temperature [K|degC]",\
 "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.TWetBul", "Wet bulb temperature [K]", \
"N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.mulAirLea.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.mulAirLea.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.mulAirLea.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.relHum", "Relative humidity [1]", \
"N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.solAlt", "Altitude angle [rad|deg]", \
"N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.solDec", "Declination angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.solZen", "Zenith angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.winDir", "Wind direction [rad|deg]", \
"N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.mulAirLea.weaBus.winSpe", "Wind speed [m/s]", \
"N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.TWetBul", "Wet bulb temperature [K]", \
"N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.mulTherBri.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.mulTherBri.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.mulTherBri.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.relHum", "Relative humidity [1]", \
"N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.solAlt", "Altitude angle [rad|deg]", \
"N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.solZen", "Zenith angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.winDir", "Wind direction [rad|deg]", \
"N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.mulTherBri.weaBus.winSpe", "Wind speed [m/s]", \
"N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDifTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.HDirTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.HDifHor", "Radiation [W/m2]",\
 "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.HDirNor", "Radiation [W/m2]",\
 "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.HGloHor", "Radiation [W/m2]",\
 "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.celHei", "Ceiling height [m]",\
 "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExt.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExt.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.nOpa", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.nTot", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.radHorIR", "Radiation [W/m2]",\
 "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.relHum", "Relative humidity [1]",\
 "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.solTim", "Solar time [s|s]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.bouConExt.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.celHei",\
 "Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.lat",\
 "Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.lon",\
 "Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.nOpa",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.nTot",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.pAtm",\
 "Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.relHum",\
 "Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solAlt",\
 "Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solDec",\
 "Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solZen",\
 "Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.winDir",\
 "Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.winSpe",\
 "Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDifTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.celHei",\
 "Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.lat",\
 "Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.lon",\
 "Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.nOpa",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.nTot",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.pAtm",\
 "Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.relHum",\
 "Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solAlt",\
 "Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solDec",\
 "Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solZen",\
 "Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.winDir",\
 "Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.winSpe",\
 "Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.HDirTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].ove.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExtWin.sha[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExtWin.sha[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.sha[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.bouConExtWin.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.bouConExtWin.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.nOpa", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.nTot", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.bouConExtWin.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.northBedroom.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.northBedroom.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.northBedroom.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.northBedroom.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.northBedroom.weaBus.TDryBul", "Output temperature [K|degC]",\
 "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316, 4)
DeclareAlias2("N2House.northBedroom.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.northBedroom.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.northBedroom.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.northBedroom.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.northBedroom.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.northBedroom.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.northBedroom.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.northBedroom.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.northBedroom.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.northBedroom.weaBus.relHum", "Relative humidity [1]", \
"N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.northBedroom.weaBus.solAlt", "Altitude angle [rad|deg]", \
"N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.northBedroom.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.northBedroom.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.northBedroom.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.northBedroom.weaBus.solZen", "Zenith angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.northBedroom.weaBus.winDir", "Wind direction [rad|deg]", \
"N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.northBedroom.weaBus.winSpe", "Wind speed [m/s]", \
"N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDifTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].incAng.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.HDirTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.HDifHor", "Radiation [W/m2]",\
 "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.HDirNor", "Radiation [W/m2]",\
 "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.HGloHor", "Radiation [W/m2]",\
 "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.celHei", "Ceiling height [m]",\
 "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExt.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExt.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.nOpa", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.nTot", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.radHorIR", "Radiation [W/m2]",\
 "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.relHum", "Relative humidity [1]",\
 "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.solAlt", "Altitude angle [rad|deg]",\
 "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.solTim", "Solar time [s|s]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.bouConExt.weaBus.solZen", "Zenith angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.celHei",\
 "Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.lat",\
 "Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.lon",\
 "Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.nOpa",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.nTot",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.pAtm",\
 "Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.relHum",\
 "Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solAlt",\
 "Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solDec",\
 "Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.solZen",\
 "Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.winDir",\
 "Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].incAng.weaBus.winSpe",\
 "Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDifTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.HDifHor",\
 "Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.HDirNor",\
 "Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.HGloHor",\
 "Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TBlaSky",\
 "Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TDewPoi",\
 "Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TDryBul",\
 "Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.TWetBul",\
 "Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.celHei",\
 "Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.lat",\
 "Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.lon",\
 "Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.nOpa",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.nTot",\
 "Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.pAtm",\
 "Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.radHorIR",\
 "Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.relHum",\
 "Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solAlt",\
 "Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solDec",\
 "Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solHouAng",\
 "Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.solZen",\
 "Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.winDir",\
 "Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].incAng.weaBus.winSpe",\
 "Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.HDirTil[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].ove.weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.TBlaSky", \
"Needed to connect to conditional connector [K|degC]", "N2House.weaBus.TBlaSky", 1,\
 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.TDryBul", \
"Output temperature [K|degC]", "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316,\
 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExtWin.sha[1].weaBus.lat", \
"Connector of Real output signal [rad]", 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExtWin.sha[1].weaBus.lon", \
"Connector of Real output signal [rad]", 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.nOpa", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.nTot", \
"Sky cover [0, 1] [1]", "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.pAtm", \
"Atmospheric pressure [Pa]", "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.winDir", \
"Wind direction [rad|deg]", "N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.sha[1].weaBus.winSpe", \
"Wind speed [m/s]", "N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.HDifHor", \
"Radiation [W/m2]", "N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.HDirNor", \
"Radiation [W/m2]", "N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.HGloHor", \
"Radiation [W/m2]", "N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.TDewPoi", \
"Output temperature [K|degC]", "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.TWetBul", \
"Wet bulb temperature [K]", "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.celHei", \
"Ceiling height [m]", "N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.cloTim", \
"Connector of Real output signal [s]", "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.bouConExtWin.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.bouConExtWin.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.nOpa", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.nTot", "Sky cover [0, 1] [1]",\
 "N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.pAtm", "Atmospheric pressure [Pa]",\
 "weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.radHorIR", \
"Radiation [W/m2]", "N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.relHum", \
"Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.solAlt", \
"Altitude angle [rad|deg]", "N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.solDec", \
"Declination angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1,\
 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.solHouAng", \
"Solar hour angle [rad|deg]", "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.solTim", \
"Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.bouConExtWin.weaBus.solZen", \
"Zenith angle [rad|deg]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1,\
 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.weaBus.HDifHor", "Radiation [W/m2]", \
"N2House.weaBus.HDifHor", 1, 5, 75273, 4)
DeclareAlias2("N2House.southBedroom.weaBus.HDirNor", "Radiation [W/m2]", \
"N2House.weaBus.HDirNor", 1, 5, 75274, 4)
DeclareAlias2("N2House.southBedroom.weaBus.HGloHor", "Radiation [W/m2]", \
"N2House.weaBus.HGloHor", 1, 5, 75275, 4)
DeclareAlias2("N2House.southBedroom.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 "N2House.weaBus.TBlaSky", 1, 5, 75276, 4)
DeclareAlias2("N2House.southBedroom.weaBus.TDewPoi", "Output temperature [K|degC]",\
 "weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.southBedroom.weaBus.TDryBul", "Output temperature [K|degC]",\
 "N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316, 4)
DeclareAlias2("N2House.southBedroom.weaBus.TWetBul", "Wet bulb temperature [K]",\
 "N2House.weaBus.TWetBul", 1, 5, 75277, 4)
DeclareAlias2("N2House.southBedroom.weaBus.celHei", "Ceiling height [m]", \
"N2House.weaBus.celHei", 1, 5, 75278, 4)
DeclareAlias2("N2House.southBedroom.weaBus.cloTim", "Connector of Real output signal [s]",\
 "N2House.weaBus.cloTim", 1, 5, 75279, 4)
DeclareVariable("N2House.southBedroom.weaBus.lat", "Connector of Real output signal [rad]",\
 0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.southBedroom.weaBus.lon", "Connector of Real output signal [rad]",\
 0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareAlias2("N2House.southBedroom.weaBus.nOpa", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nOpa", 1, 5, 75282, 4)
DeclareAlias2("N2House.southBedroom.weaBus.nTot", "Sky cover [0, 1] [1]", \
"N2House.weaBus.nTot", 1, 5, 75283, 4)
DeclareAlias2("N2House.southBedroom.weaBus.pAtm", "Atmospheric pressure [Pa]", \
"weaDat.pAtm", 1, 7, 3595, 4)
DeclareAlias2("N2House.southBedroom.weaBus.radHorIR", "Radiation [W/m2]", \
"N2House.weaBus.radHorIR", 1, 5, 75284, 4)
DeclareAlias2("N2House.southBedroom.weaBus.relHum", "Relative humidity [1]", \
"N2House.mulAirLea.outNor.x_pTphi.phi", 1, 5, 30317, 4)
DeclareAlias2("N2House.southBedroom.weaBus.solAlt", "Altitude angle [rad|deg]", \
"N2House.weaBus.solAlt", 1, 5, 75285, 4)
DeclareAlias2("N2House.southBedroom.weaBus.solDec", "Declination angle [rad|deg]",\
 "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareAlias2("N2House.southBedroom.weaBus.solHouAng", "Solar hour angle [rad|deg]",\
 "N2House.weaBus.solHouAng", 1, 5, 75286, 4)
DeclareAlias2("N2House.southBedroom.weaBus.solTim", "Solar time [s|s]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1, 5, 39444, 4)
DeclareAlias2("N2House.southBedroom.weaBus.solZen", "Zenith angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareAlias2("N2House.southBedroom.weaBus.winDir", "Wind direction [rad|deg]", \
"N2House.weaBus.winDir", 1, 5, 75287, 4)
DeclareAlias2("N2House.southBedroom.weaBus.winSpe", "Wind speed [m/s]", \
"N2House.weaBus.winSpe", 1, 5, 75288, 4)
DeclareVariable("N2House.weaBus.HDifHor", "Radiation [W/m2]", 0.0, 0.0,0.0,0.0,0,520)
DeclareVariable("N2House.weaBus.HDirNor", "Radiation [W/m2]", 0.0, 0.0,0.0,0.0,0,520)
DeclareVariable("N2House.weaBus.HGloHor", "Radiation [W/m2]", 0.0, 0.0,0.0,0.0,0,520)
DeclareVariable("N2House.weaBus.TBlaSky", "Needed to connect to conditional connector [K|degC]",\
 0.0, 0.0,1E+100,0.0,0,520)
DeclareAlias2("N2House.weaBus.TDewPoi", "Output temperature [K|degC]", \
"weaDat.TDewPoi", 1, 7, 3600, 4)
DeclareAlias2("N2House.weaBus.TDryBul", "Output temperature [K|degC]", \
"N2House.mulAirLea.outNor.x_pTphi.T", 1, 5, 30316, 4)
DeclareVariable("N2House.weaBus.TWetBul", "Wet bulb temperature [K]", 291.15, \
0.0,1E+100,0.0,0,584)
DeclareVariable("N2House.weaBus.celHei", "Ceiling height [m]", 0.0, 0.0,0.0,0.0,\
0,521)
DeclareVariable("N2House.weaBus.cloTim", "Connector of Real output signal [s]", \
0.0, 0.0,0.0,0.0,0,520)
DeclareVariable("N2House.weaBus.lat", "Connector of Real output signal [rad]", \
0.8355589260997653, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.weaBus.lon", "Connector of Real output signal [rad]", \
0.20469221467389495, 0.0,0.0,0.0,0,521)
DeclareVariable("N2House.weaBus.nOpa", "Sky cover [0, 1] [1]", 0.0, 0.0,1.0,0.0,\
0,521)
DeclareVariable("N2House.weaBus.nTot", "Sky cover [0, 1] [1]", 0.0, 0.0,1.0,0.0,\
0,521)
DeclareAlias2("N2House.weaBus.pAtm", "Atmospheric pressure [Pa]", "weaDat.pAtm", 1,\
 7, 3595, 4)
DeclareVariable("N2House.weaBus.radHorIR", "Radiation [W/m2]", 0.0, 0.0,1E+100,\
100.0,0,520)
DeclareAlias2("N2House.weaBus.relHum", "Relative humidity [1]", "N2House.mulAirLea.outNor.x_pTphi.phi", 1,\
 5, 30317, 4)
DeclareVariable("N2House.weaBus.solAlt", "Altitude angle [rad|deg]", 0.0, \
0.0,0.0,0.0,0,520)
DeclareAlias2("N2House.weaBus.solDec", "Declination angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.decAng", 1, 5, 39446, 4)
DeclareVariable("N2House.weaBus.solHouAng", "Solar hour angle [rad|deg]", 0.0, \
0.0,0.0,0.0,0,520)
DeclareAlias2("N2House.weaBus.solTim", "Solar time [s|s]", "N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.solTim", 1,\
 5, 39444, 4)
DeclareAlias2("N2House.weaBus.solZen", "Zenith angle [rad|deg]", \
"N2House.livingRoom.bouConExtWin.sha[1].ove.solAzi.zen", 1, 5, 39443, 4)
DeclareVariable("N2House.weaBus.winDir", "Wind direction [rad|deg]", 0.0, 0.0,\
6.283185307179586,0.0,0,520)
DeclareVariable("N2House.weaBus.winSpe", "Wind speed [m/s]", 0.0, 0.0,0.0,0.0,0,520)
DeclareOutput("CPUtime", "", 7, 0.0, 0.0,0.0,0.0,0,512)
DeclareOutput("EventCounter", "", 8, 0.0, 0.0,0.0,0.0,0,512)
EndNonAlias(50)
PreNonAliasNew(51)
