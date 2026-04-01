concrete NanoEng of Nano = {

lincat
  S = Str ;
  NP, Pron = {s : Case => Str ; n : Number} ;
  VP, V2 = Number => Str ;
  CN, Det = Str ;
  A, N = Str ;

lin
  PredVPS np vp = np.s ! Nom  ++ vp ! np.n ;
  ComplV2 v2 np = table {n => v2 ! n ++ np.s ! Acc} ;
  DetCN det cn =
    {s = table {c => det ++ cn} ; n = Sg} ;
  AdjCN a cn = a ++ cn ;
  UseCN n = n ;
  UsePron pron = pron ;

  the_Det = "the" ;
  black_A = "black" ;
  cat_N = "cat" ;
  see_V2 =
    table {Sg => "sees" ; Pl => "see"} ;
  we_Pron = {
    s = table {Nom => "we" ; Acc => "us"} ;
    n = Pl
    } ;

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;

}