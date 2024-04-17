-- live-coded MicroResEng for Lab 2

resource MicroResEng = {

param
  Number = Sg | Pl ;

oper
-- phonological patterns
  sibilant : pattern Str
    = #("s" | "x" | "ch" | "sh" | "z") ;
  vowel : pattern Str
    = #("a" | "e" | "i" | "o" | "u") ;

-- the type of nouns
  Noun : Type = {s : Number => Str} ;

-- worst-case paradigm
  mkNoun : (sg, pl : Str) -> Noun
    = \sg, pl -> {s = table {Sg => sg ; Pl => pl}} ;

-- regular paradigm
  regNoun : (sg : Str) -> Noun
    = \sg -> mkNoun sg (sg + "s") ;

-- smart paradigm
  smartNoun : (sg : Str) -> Noun
    = \sg -> case sg of {
        x + #vowel + "y" => regNoun sg ;
        x + "y" => mkNoun sg (x + "ies") ;
        x + #sibilant => mkNoun sg (sg + "es") ;
	_ => regNoun sg
        } ;

-- overloaded paradigm for lexicographers
  mkN = overload {
     mkN : (sg : Str) -> Noun = smartNoun ;
     mkN : (sg, pl : Str) -> Noun = mkNoun ;
     } ;

  


}