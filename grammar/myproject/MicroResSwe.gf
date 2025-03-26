resource MicroResSwe = open Prelude in {

param
  Number = Sg | Pl ;
  Species = Indef | Def ;
  Gender = Utr | Neutr ;
  
oper
  N : Type = {s : Number => Species => Str ; g : Gender} ;

  worstN : Str -> Str -> Str -> Str -> Gender -> N
    = \man,mannen,män,männen,g -> {
      s = table {
        Sg => table {Indef => man ; Def => mannen} ;
	Pl => table {Indef => män ; Def => männen}
	} ;
      g = g
      } ;
-- https://en.wikipedia.org/wiki/Swedish_grammar

  decl1 : Str -> N
    = \apa ->
      let ap = init apa in
      worstN apa (apa + "n") (ap + "or") (ap + "orna") Utr ;

  decl2 : Str -> N
    = \bil -> case bil of {
      pojk + "e" => worstN bil (bil + "en") (pojk + "ar") (pojk + "arna") Utr ;
      _ => worstN bil (bil + "en") (bil + "ar") (bil + "arna") Utr
      } ;





}