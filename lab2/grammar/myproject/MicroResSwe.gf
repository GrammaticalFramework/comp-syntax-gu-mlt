resource MicroResSwe = {

param
  Number = Sg | Pl ;
  Species = Indef | Def ;
  Gender = Utr | Neutr ;

oper
  N = {s : Number => Species => Str ; g : Gender} ;

  worstN : Str -> Str -> Str -> Str -> Gender -> N
    = \man,mannen,män,männen,gen -> {
      s = table {
            Sg => table {Indef => man ; Def => mannen} ;
            Pl => table {Indef => män ; Def => männen}
	    } ;
      g = gen
      } ;

  decl2 : Str -> N
    = \bil -> worstN bil (bil + "en") (bil + "ar") (bil + "arna") Utr ;

}
