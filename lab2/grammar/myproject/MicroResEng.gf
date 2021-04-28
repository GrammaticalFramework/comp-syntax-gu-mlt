resource MicroResEng = {

param Number = Sg | Pl ;

oper
  N = {s : Number => Str} ;

  worstN : Str -> Str -> N
    = \x,y -> {s = table {Sg => x ; Pl => y}} ;

  regN : Str -> N
    = \x -> worstN x (x + "s") ;

  smartN : Str -> N
    = \x -> case x of
    {
      b + ("ay"|"oy"|"uy") => regN x ;
      bab + "y" => worstN x (bab + "ies") ;
      _ => regN x  
      } ;

   mkN = overload {
     mkN : (dog : Str) -> N
       = smartN ;
     mkN : (man,men : Str) -> N
       = worstN
    } ;


}
