resource MorphologyEng = {

param
  Number = Sg | Pl ;

oper
  Noun : Type = {s : Number => Str} ;

  mkNoun : Str -> Str -> Noun = \sg, pl -> 
    {s = table {Sg => sg ; Pl => pl}} ;
    
  regNoun : Str -> Noun = \sg -> mkNoun sg (sg + "s") ;

  smartNoun : Str -> Noun = \sg -> case sg of {
    _ + ("s" | "ch" | "sh") => mkNoun sg (sg + "es") ;
    _ + ("ay" | "ey" | "oy" | "uy") => regNoun sg ;
    x + "y" => mkNoun sg (x + "ies") ;
    _ => regNoun sg
    } ;

-- to test
  teacher_N : Noun = {s = table {Sg => "teacher" ; Pl => "teachers"}} ;
  
  cat_N : Noun = mkNoun "cat" "cats" ;

  dog_N : Noun = regNoun "dog" ;

  bus_N : Noun = smartNoun "bus" ;
  baby_N : Noun = smartNoun "baby" ;
  fly_N : Noun = smartNoun "fly" ;
  

}

