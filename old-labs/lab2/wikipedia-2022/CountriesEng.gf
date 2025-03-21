concrete CountriesEng of Countries = FactsEng, CountryNamesEng **

open SyntaxEng, ParadigmsEng, SymbolicEng in {

lin
  cName name = name ;

  capital_Attribute = mkAttribute "capital" ;
  area_Attribute = mkAttribute "area" ;
  population_Attribute = mkAttribute "population" ;
  continent_Attribute = mkAttribute "continent" ;
  currency_Attribute = mkAttribute "currency" ;

  populationFact cname int = mkCl cname have_V2 (mkNP <symb int : Card> (mkN "inhabitant")) ;
  continentFact cname name = mkCl cname (SyntaxEng.mkAdv in_Prep name) ;

oper
  mkAttribute : Str -> CN = \s -> mkCN (mkN s) ;

}
