resource MicroResEng = open Prelude in {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;


  Agreement = Agr Number ; ---s Person to be added

  -- all forms of normal Eng verbs, although not yet used in MiniGrammar
  VForm = Inf | PresSg3 | Past | PastPart | PresPart ; 

oper
  N : Type = {s : Number => Str} ;

  worstN : Str -> Str -> N = \sg,pl -> {
    s = table {Sg => sg ; Pl => pl}
    } ;

  regN : Str -> N = \sg -> worstN sg (sg + "s") ;

  -- smart paradigm
  smartN : Str -> N = \sg -> case sg of {
    _ + ("ay"|"ey"|"oy"|"uy") => regN sg ;
    x + "y"                   => worstN sg (x + "ies") ;
    _ + ("ch"|"sh"|"s"|"o")   => worstN sg (sg + "es") ;
    _                         => regN sg
    } ;

  A : Type = {s : Str} ;

  V : Type = {s : VForm => Str} ;

  mkVerb : (inf,pres,past,pastpart,prespart : Str) -> V
    = \inf,pres,past,pastpart,prespart -> {
    s = table {
      Inf => inf ;
      PresSg3 => pres ;
      Past => past ;
      PastPart => pastpart ;
      PresPart => prespart
      }
    } ;

  regV : (inf : Str) -> V = \inf ->
    mkVerb inf (inf + "s") (inf + "ed") (inf + "ed") (inf + "ing") ;

  -- regular verbs with predictable variations
  smartV : Str -> V = \inf -> case inf of {
     pl  +  ("a"|"e"|"i"|"o"|"u") + "y" => regV inf ;
     cr  +  "y" =>  mkVerb inf (cr + "ies") (cr + "ied") (cr + "ied") (inf + "ing") ;
     lov + "e"  => mkVerb inf (inf + "s") (lov + "ed") (lov + "ed") (lov + "ing") ;
     kis + ("s"|"sh"|"x"|"o") => mkVerb inf (inf + "es") (inf + "ed") (inf + "ed") (inf + "ing") ;
     _ => regV inf
     } ;

  -- normal irregular verbs e.g. drink,drank,drunk
  irregV : (inf,past,pastpart : Str) -> V =
    \inf,past,pastpart ->
      let verb = smartV inf
      in mkVerb inf (verb.s ! PresSg3) past pastpart (verb.s ! PresPart) ;   

  -- two-place verb with "case" as preposition; for transitive verbs, c=[]
  V2 : Type = V ** {c : Str} ;

  be_V : V = mkVerb "are" "is" "was" "been" "being" ; ---s to be generalized


---s a very simplified verb agreement function for Micro
  agr2vform : Agreement -> VForm = \a -> case a of {
    Agr Sg => PresSg3 ;
    Agr Pl => Inf
    } ;

  Pron : Type = {s : Case => Str ; n : Number} ;

  mkPron : Str -> Str -> Number -> Pron = \nom,acc,n -> {s = table {Nom => nom ; Acc => acc} ; n = n} ;

  selectVerb : V -> Number -> Str = \v,n -> case n of {
    Sg => v.s ! PresSg3 ;
    Pl => v.s ! Inf
    } ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> N   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartN n) ;
    mkN : Str -> Str -> N  -- irregular noun, e.g. man-men
      = \sg,pl -> lin N (worstN sg pl) ;
    } ;

  mkA : Str -> A
    = \s -> {s = s} ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartV s) ;
    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
      = \inf,pres,part -> lin V (irregV inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartV s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartV s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

--  mkAdv : Str -> Adv
  --  = \s -> lin Adv {s = s} ;
  
--  mkPrep : Str -> Prep
  --  = \s -> lin Prep {s = s} ;


}
