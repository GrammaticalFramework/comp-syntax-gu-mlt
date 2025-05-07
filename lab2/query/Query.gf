abstract Query = Nobel ** {

flags startcat = Query ;

cat
  Query ;
  Kind ;
  Property ;
  Term ;
  Element ;

fun
  QWhich   : Kind -> Property -> Query ;   -- which laureates are female
  QHowMany : Kind -> Property -> Query ;   -- how many women are there
  QWhether : Term -> Property -> Query ;   -- is Martti Ahtisaari from Finland 
  QWhat    : Element          -> Query ;   -- who is the youngest laureate

  TAll : Kind -> Term ;                    -- all laureate
  TAny : Kind -> Term ;                    -- any laureate

  KProperty : Property -> Kind -> Kind ;   -- female laureate

  ELaureate : Name -> Element ;  -- Martti Ahtisaari

  EYoungest : Kind -> Element ;  -- the youngest laureate
  EOldest : Kind -> Element ;    -- the oldest laureate

  KMan : Kind ;
  KWoman : Kind ;

  KLaureate : Kind ;
  
  KChemistryLaureate : Kind ;
  KLiteratureLaureate : Kind ;
  KMedicineLaureate : Kind ;
  KPeaceLaureate : Kind ;
  KPhysicsLaureate : Kind ;

  PCountry : Country -> Property ;
  PBornIn : Date -> Property ;
  PAwardedIn : Date -> Property ;
  PMale : Property ;
  PFemale : Property ;

  BeforeYearDate : Int -> Date ;
  AfterYearDate : Int -> Date ;
  
}