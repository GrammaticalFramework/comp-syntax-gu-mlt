concrete IntroEng of Intro = {

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
  ComplV2 v2 np = v2 ++ np ;
  DetCN det cn = det ++ cn ;
  AdjCN ap cn = ap ++ cn ;
  UseN n = n ;
  UseA a = a ;
  UsePron pron = pron ;

  the_Det = "the" ;
  black_A = "black" ;
  cat_N = "cat" ;
  see_V2 = "sees" ;
  we_Pron = "us" ;

}