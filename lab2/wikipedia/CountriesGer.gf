concrete CountriesGer of Countries = FactsGer, CountryNamesGer **

open SyntaxGer, ParadigmsGer, SymbolicGer in {

lin
  cName name = name ;

  capital_Attribute = mkAttribute (mkN "Hauptstadt" "Hauptstädte" feminine) ;
  area_Attribute = mkAttribute (mkN "Fläche") ;
  population_Attribute = mkAttribute (mkN "Einwohnerzahl" feminine) ;
  continent_Attribute = mkAttribute (mkN "Kontinent" "Kontinente" masculine) ;
  currency_Attribute = mkAttribute (mkN "Währung") ;

  populationFact cname int = mkCl cname have_V2 (mkNP <symb int : Card> (mkN "Einwohner")) ;
  continentFact cname name = mkCl cname (mkVP (mkVP (mkV "liegen")) (SyntaxGer.mkAdv in_Prep name)) ;

oper
  mkAttribute : N -> CN = \n -> mkCN n ;

}
