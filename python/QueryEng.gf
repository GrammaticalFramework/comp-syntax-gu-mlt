concrete QueryEng of Query =

open
  SyntaxEng, ParadigmsEng,
  SymbolicEng,
  MarkupEng, 
  (M = MakeStructuralEng)
in {

lincat
  Query = Utt ;
  Kind = CN ;
  Property = AP ;
  Term = NP ;
  Element = NP ;

lin
  QWhich kind property =
      mkUtt (mkQS (mkQCl (mkIP whichPl_IDet kind) property))                                    -- which numbers are prime
    | mkUtt (mkImp (mkVP (mkV2 "list") (mkNP all_Predet (mkNP aPl_Det (mkCN property kind)))))  -- list all prime numbers
    | mkUtt (mkNP aPl_Det (mkCN property kind))                                                 -- prime numbers
    ;
    
  QWhether term property =
      mkUtt (mkQS (mkQCl (mkCl term property))) -- is 51 prime
    | mkUtt (mkQS (mkCl term property))         -- 51 is prime
    ;
    
  QWhat element =
      mkUtt (mkQS (mkQCl what_IP element))          -- what is 2 + 2
    | mkUtt (mkImp (mkVP (mkV2 "compute") element)) -- compute 2 + 2
    | mkUtt element                                 -- 2 + 2
    ;

  TAll kind =
      mkNP all_Predet (mkNP aPl_Det kind) -- all numbers
    | mkNP every_Det kind                 -- every number
    ;
    
  TAny kind =
      mkNP someSg_Det kind                -- some number
    | mkNP somePl_Det kind                -- some numbers
    | mkNP (M.mkDet "any" singular) kind  -- any number
    | mkNP (M.mkDet "any" plural) kind    -- any numbers
    ;
    
  TElement element = element ;
  
  PAnd p q = mkAP and_Conj p q ;
  POr p q = mkAP or_Conj p q ;
  PNot p = mkAP (lin AdA {s = "not"}) p ;

  KProperty property kind = mkCN property kind ;

-- lexicon

  KNumber = mkCN (mkN "number") ;
  EInteger i = symb i ;
  PEven = mkAP (mkA "even") ;
  POdd = mkAP (mkA "odd") ;
  PPrime = mkAP (mkA "prime") ;
  PDivisible term = mkAP (mkA2 (mkA "divisible") by8means_Prep) term ;
  PSmaller term = mkAP (mkA "small") term ;
  PGreater term = mkAP (mkA "great") term ;
  PEqual term = mkAP (mkA2 (mkA "equal") to_Prep) term ;
  PBetween x y = mkAP (mkA2 (mkA "between") (mkPrep "")) (mkNP and_Conj x y) ; ---

  ESum x y =
      mkNP the_Det (mkCN (mkN2 (mkN "sum")) (mkNP and_Conj x y))    -- the sum of x and y
    | mkNP (mkConj "+" singular) x y                                -- x + y
    | parenthNP (mkNP (mkConj "+" singular) x y)                    -- ( x + y )
    ;
  EMinus x y =
      mkNP the_Det (mkCN (mkN2 (mkN "difference")) (mkNP and_Conj x y))  -- the difference of x and y
    | mkNP (mkConj "-" singular) x y                                     -- x - y
    | parenthNP (mkNP (mkConj "-" singular) x y)                         -- x - y
    ;
  EProduct x y =
      mkNP the_Det (mkCN (mkN2 (mkN "product")) (mkNP and_Conj x y))  -- the product of x and y
    | mkNP (mkConj "*" singular) x y                                  -- x * y
    ;
  EDivided x y =
      mkNP (mkConj "divided by" singular) x y   -- the product of x and y
    | mkNP (mkConj "/" singular) x y            -- x * y
    ;
  EFactorial x =
      mkNP the_Det (mkCN (mkN2 (mkN "factorial")) x)  -- the factorial of x
    | mkNP x (ParadigmsEng.mkAdv "!")                 -- x !
    ;

oper
  parenthNP : NP -> NP = \np -> MarkupNP (lin Mark {begin = "(" ; end = ")"}) np ;

}