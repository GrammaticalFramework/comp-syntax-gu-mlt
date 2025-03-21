resource MicroResIta = {

param
-- define types of morphological parameters
  Number = Sg | Pl ;
  Gender = Masc | Fem ;

oper
-- define types for parts of speech
-- they are recourd types with tables and inherent features
  Noun : Type = {s : Number => Str ; g : Gender} ;
  Adjective : Type = {s : Gender => Number => Str} ;

-- here is an example that is type-correct as a Noun
  donna_N : Noun = {
    s = table {Sg => "donna" ; Pl => "donne"} ;
    g = Fem
    } ;

-- define constructor function for Noun
   mkNoun : Str -> Str -> Gender -> Noun = \sg, pl, g -> {
     s = table {Sg => sg ; Pl => pl} ;
     g = g
     } ;

-- define a noun using this constructor
   uomo_N : Noun = mkNoun "uomo" "uomini" Masc ;

-- define a smart paradigm
   smartNoun : Str -> Noun = \s -> case s of {
     x + "o" => mkNoun s (x + "i") Masc ;
     x + "a" => mkNoun s (x + "e") Fem ;
     x + "e" => mkNoun s (x + "i") Masc ;
     _ => mkNoun s s Masc
     } ;

-- the overloaded paradigm is what the lexicon will use
   mkN = overload {
     mkN : Str -> Noun = smartNoun ;
     mkN : Str -> Str -> Gender -> Noun = mkNoun ;
     mkN : Gender -> Noun -> Noun = \g, n -> n ** {g = g} ;
     } ;

-- adjectives:
   mkAdjective : (msg,fsg,mpl,fpl : Str) -> Adjective = \msg,fsg,mpl,fpl -> {
     s = table {
       Masc => table {Sg => msg ; Pl => mpl} ;
       Fem => table {Sg => fsg ; Pl => fpl}
       }
     } ;
   smartAdjective : Str -> Adjective = \s -> case s of {
     x + "o" => mkAdjective s (x + "a") (x + "i") (x + "e") ; 
     x + "e" => mkAdjective s s (x + "i") (x + "i") ; 
     _ => mkAdjective s s s s
     } ;

   mkA = overload {
     mkA : Str -> Adjective = smartAdjective ;
     mkA : (msg,fsg,mpl,fpl : Str) -> Adjective = mkAdjective ;
     } ;

}