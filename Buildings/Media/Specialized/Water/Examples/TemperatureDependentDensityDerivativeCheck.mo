within Buildings.Media.Specialized.Water.Examples;
model TemperatureDependentDensityDerivativeCheck
  "Model that tests the derivative implementation"
  extends Modelica.Icons.Example;

   package Medium =
      Buildings.Media.Specialized.Water.TemperatureDependentDensity
    "Medium model";

    Modelica.SIunits.Temperature T "Temperature";
    Modelica.SIunits.SpecificEnthalpy hLiqSym "Liquid phase enthalpy";
    Modelica.SIunits.SpecificEnthalpy hLiqCod "Liquid phase enthalpy";
    Modelica.SIunits.SpecificHeatCapacity cpSym "Specific heat capacity";
    Modelica.SIunits.SpecificHeatCapacity cpCod "Specific heat capacity";
    Modelica.SIunits.SpecificHeatCapacity cvSym "Specific heat capacity";
    Modelica.SIunits.SpecificHeatCapacity cvCod "Specific heat capacity";
    constant Real convT(unit="K/s3") = 270
    "Conversion factor to satisfy unit check";
initial equation
     hLiqSym = hLiqCod;
     cpSym   = cpCod;
     cvSym   = cvCod;
equation
    T = 273.15+convT*time^3;

    hLiqCod=Medium.enthalpyOfLiquid(T);
    der(hLiqCod)=der(hLiqSym);
    assert(abs(hLiqCod-hLiqSym) < 1E-2, "Model has an error");

    cpCod=Medium.specificHeatCapacityCp(
      Medium.setState_pTX(
         p=1e5,
         T=T,
         X=Medium.X_default));
    der(cpCod)=der(cpSym);
    assert(abs(cpCod-cpSym) < 1E-2, "Model has an error");

     cvCod=Medium.specificHeatCapacityCv(
      Medium.setState_pTX(
         p=1e5,
         T=T,
         X=Medium.X_default));
    der(cvCod)=der(cvSym);
    assert(abs(cvCod-cvSym) < 1E-2, "Model has an error");

   annotation(experiment(
                 StopTime=1,
                 Tolerance=1e-08),
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Media/Specialized/Water/Examples/TemperatureDependentDensityDerivativeCheck.mos"
        "Simulate and plot"),
      Documentation(info="<html>
<p>
This example checks whether the function derivative
is implemented correctly. If the derivative implementation
is not correct, the model will stop with an assert statement.
</p>
</html>",   revisions="<html>
<ul>
<li>
August 17, 2015, by Michael Wetter:<br/>
Changed regression test to have slope different from one.
This is for
<a href=\"https://github.com/iea-annex60/modelica-annex60/issues/303\">issue 303</a>.
</li>
<li>
December 18, 2013, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end TemperatureDependentDensityDerivativeCheck;
