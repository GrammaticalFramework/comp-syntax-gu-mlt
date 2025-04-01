concrete IntroIta of Intro = {

lincat
  S = Str ;
  NP = Str ;
  VP = Str ;
  CN = Str ;
  AP = Str ;
  Det = Str ;
  Pron = Str ;
  N = Str ;
  A = Str ;
  V2 = Str ;

lin
  PredVP np vp = np ++ vp ;
  ComplV2 v2 np = np ++ v2 ;
  DetCN det cn = det ++ cn ;
  AdjCN ap cn = cn ++ ap ;
  UseN n = n ;
  UseA a = a ;
  UsePron pron = pron ;

  the_Det = "il" ;
  black_A = "nero" ;
  cat_N = "gatto" ;
  see_V2 = "vede" ;
  we_Pron = "ci" ;

}