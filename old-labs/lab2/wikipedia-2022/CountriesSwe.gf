concrete CountriesSwe of Countries = FactsSwe, CountryNamesSwe **

open SyntaxSwe, ParadigmsSwe, SymbolicSwe, (I=IrregSwe), Prelude in {

lin
  cName name = name.np ;

  capital_Attribute = mkAttribute "huvudstad" ;
  area_Attribute = mkAttribute "yta" ;
  population_Attribute = mkAttribute "befolkning" ;
  continent_Attribute = mkAttribute "kontinent" ;
  currency_Attribute = mkAttribute "valuta" ;

  populationFact cname int = mkCl cname.np have_V2 (mkNP <symb int : Card> (mkN "invånare" "invånare")) ;
  continentFact cname name = mkCl cname.np (mkVP (mkVP I.ligga_V) (SyntaxSwe.mkAdv (locPrep name) name.np)) ;

oper
  mkAttribute : Str -> CN = \s -> mkCN (mkN s) ; ----

  locPrep : LocName -> Prep = \name -> case name.isIn of {
    True => in_Prep ;
    False => on_Prep 
    } ;

}
