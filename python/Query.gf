abstract Query = {

flags startcat = Query ;

cat
  Query ;
  Kind ;
  Property ;
  Term ;
  Element ;

fun
  QWhich   : Kind -> Property -> Query ;     -- which numbers are prime
  QWhether : Term -> Property -> Query ;     -- is any number prime
  QWhat    : Element          -> Query ;     -- what is the factorial of 10

  TAll : Kind -> Term ;                      -- all numbers
  TAny : Kind -> Term ;                      -- any number
  TElement : Element -> Term ;               -- 42  

  PAnd : Property -> Property -> Property ;  -- even and prime
  POr  : Property -> Property -> Property ;  -- even or odd
  PNot : Property -> Property ;              -- not prime

  KProperty : Property -> Kind -> Kind ;     -- even number

-- lexicon

  KNumber : Kind ;

  EInteger : Int -> Element ;
  PEven, POdd, PPrime : Property ;
  PDivisible : Term -> Property ;
  PSmaller, PGreater, PEqual : Term -> Property ;  
  PBetween : Term -> Term -> Property ;  

  EFactorial : Element -> Element ;
  ESum, EProduct, EMinus, EDivided : Element -> Element -> Element ;

}