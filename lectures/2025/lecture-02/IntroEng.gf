concrete IntroEng of Intro = {

lincat
  S = Str ;
  NP = {s : Case => Str ; a : Agr} ;
  VP = Agr => Str ;
  CN = Str ;
  AP = Str ;
  Det = Str ;
  Pron = {s : Case => Str ; a : Agr} ;
  N = Str ;
  A = Str ;
  V2 = Agr => Str ;

lin
  PredVP np vp = np.s ! Nom ++ vp ! np.a ;
  ComplV2 v2 np = table {a => v2 ! a ++ np.s ! Acc} ;
  DetCN det cn = {
    s = table {_ => det ++ cn} ;
    a = SgP3
    } ;
  AdjCN ap cn = ap ++ cn ;
  UseN n = n ;
  UseA a = a ;
  UsePron pron = pron ;

  the_Det = "the" ;
  black_A = "black" ;
  cat_N = "cat" ;
  see_V2 = table {SgP3 => "sees" ; Other => "see"} ;
  we_Pron = {
    s = table {Nom => "we" ; Acc => "us"} ;
    a = Other
    } ;

param
  Case = Nom | Acc ;
  Agr = SgP3 | Other ;

}