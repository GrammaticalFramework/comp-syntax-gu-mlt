abstract Nobel = Labels ** {

flags startcat = Description ;

cat
  Description ;
  Name ;
  Date ;

fun
  LivingDescription : Name -> Name -> Country -> Date -> Date -> Award -> Description ;
  PastDescription : Name -> Name -> Country -> Date -> Date -> Date -> Award -> Description ;
  StringName : String -> Name ;
  YearDate : Int -> Date ;
  he_Name, she_Name, they_Name : Name ;

}
