concrete QuerySwe of Query =

open
  SyntaxSwe, ParadigmsSwe, SymbolicSwe, (L = LexiconSwe)
in {

lincat
  Query = Utt ;
  Kind = CN ;
  Property = AP ;
  Term = NP ;
  Element = NP ;

lin
  QWhich kind property = mkUtt (mkQS (mkQCl (mkIP whichPl_IDet kind) property)) ;
  QWhether term property = mkUtt (mkQS (mkQCl (mkCl term property))) ;
  QWhat element = mkUtt (mkQS (mkQCl what_IP element)) ;
  
  TAll kind = mkNP all_Predet (mkNP aPl_Det kind) ;
  TAny kind = mkNP someSg_Det kind ;
  TElement element = element ;
  
  PAnd p q = mkAP and_Conj p q ;
  POr p q = mkAP or_Conj p q ;
  PNot p = mkAP (lin AdA {s = "inte"}) p ; ---

  KProperty property kind = mkCN property kind ;

-- lexicon

  KNumber = mkCN (mkN "tal" "tal") ;
  EInteger i = symb i ;
  PEven = mkAP (mkA "jämn") ;
  POdd = mkAP (invarA "udda") ;
  PPrime = mkAP (mkA "prim") ; ----
  PDivisible term = mkAP (mkA2 (mkA "delbar") with_Prep) term ;
  PSmaller term = mkAP L.small_A term ;
  PGreater term = mkAP L.big_A term ;
  PBetween x y = mkAP (mkA2 (invarA "mellan") (mkPrep "")) (mkNP and_Conj x y) ; ---

  ESum x y = mkNP the_Det (mkCN (mkN2 (mkN "summa")) (mkNP and_Conj x y)) ;
  EProduct x y = mkNP the_Det (mkCN (mkN2 (mkN "produkt")) (mkNP and_Conj x y)) ;
  EFactorial x = mkNP the_Det (mkCN (mkN2 (mkN "fakultet")) x) ;
  
}