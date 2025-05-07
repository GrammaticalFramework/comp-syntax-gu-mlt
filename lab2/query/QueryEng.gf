--# -path=.:alltenses:../grammars

concrete QueryEng of Query = NobelEng **

open
  SyntaxEng, ParadigmsEng,
  SymbolicEng,
  (G = GrammarEng),
  (M = MakeStructuralEng),
  Prelude
in {

lincat
  Query = Utt ;
  Kind = CN ;
  Property = {ap : AP ; adv : Adv ; isAdv : Bool} ;
  Term = NP ;
  Element = NP ;

lin
  QWhich kind property =
      mkUtt (mkQS tenses (mkQCl (mkIP whichPl_IDet kind) (propertyVP property)))      
    | mkUtt (mkNP aPl_Det (propertyCN property kind))
    ;
    
  QHowMany kind property =
      mkUtt (mkQS tenses (mkQCl (mkIP how8many_IDet kind) (propertyVP property)))
    | mkUtt (mkIP how8many_IDet (propertyCN property kind))
    ;
    
  QWhether term property =
      mkUtt (mkQS tenses (mkQCl (mkCl term (propertyVP property))))
    ;
    
  QWhat element =
      mkUtt (mkQS tenses (mkQCl who_IP element))          -- what is 2 + 2
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
      
  KProperty property kind = propertyCN property kind ;

  ELaureate name = name ;

  EYoungest kind = mkNP (mkDet the_Quant (SyntaxEng.mkOrd (mkA "young" "younger"))) kind ;
  EOldest kind = mkNP (mkDet the_Quant (SyntaxEng.mkOrd (mkA "old"))) kind ;

  KMan = mkCN (mkN "man" "men") ;
  KWoman = mkCN (mkN "woman" "women") ;

  KLaureate = mkCN (mkN "laureate") | mkCN (mkN "Nobel prize laureate") ;
  
  KChemistryLaureate = mkCN (mkN "chemistry laureate") ;
  KLiteratureLaureate = mkCN (mkN "literature laureate") ;
  KMedicineLaureate = mkCN (mkN "medicine laureate") ;
  KPeaceLaureate = mkCN (mkN "peace laureate") ;
  KPhysicsLaureate = mkCN (mkN "physics laureate") ;

  PCountry country = mkProperty (SyntaxEng.mkAdv from_Prep country) ;
  PBornIn date = mkProperty (G.AdvAP (mkAP (mkA "born")) date) ;
  PAwardedIn date = mkProperty date ;
  
  PMale = mkProperty "male" ;
  PFemale = mkProperty "female" ;

  BeforeYearDate y = SyntaxEng.mkAdv before_Prep <symb y : NP> ;
  AfterYearDate y = SyntaxEng.mkAdv after_Prep <symb y : NP> ;
  
oper
  tenses = presentTense | pastTense ;

  mkProperty = overload {
    mkProperty : Str -> Property = \s ->
      lin Property {ap = mkAP (mkA s) ; adv = ParadigmsEng.mkAdv "" ; isAdv = False} ;
    mkProperty : AP -> Property = \ap ->
      lin Property {ap = ap ; adv = ParadigmsEng.mkAdv "" ; isAdv = False} ;
    mkProperty : Adv -> Property = \adv ->
      lin Property {ap = mkAP (mkA "") ; adv = adv ; isAdv = True} ;
    } ;

  propertyCN : {ap : AP ; adv : Adv ; isAdv : Bool} -> CN -> CN = \prop, cn ->
    case prop.isAdv of {
      True => mkCN cn prop.adv ;
      False => mkCN prop.ap cn
      } ;
      
  propertyVP : {ap : AP ; adv : Adv ; isAdv : Bool} -> VP = \prop ->
    case prop.isAdv of {
      True => mkVP prop.adv ;
      False => mkVP prop.ap
      } ;

}