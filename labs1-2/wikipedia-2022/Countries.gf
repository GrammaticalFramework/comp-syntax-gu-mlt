abstract Countries = Facts, CountryNames ** {
fun
-- using CNames
  cName : CName -> Name ;

-- basic properties
  capital_Attribute : Attribute ;
  area_Attribute : Attribute ;
  population_Attribute : Attribute ;
  continent_Attribute : Attribute ;
  currency_Attribute : Attribute ;

-- specialized expressions for properties
  populationFact : CName -> Int -> Fact ;
  continentFact : CName -> CName -> Fact ;
}
