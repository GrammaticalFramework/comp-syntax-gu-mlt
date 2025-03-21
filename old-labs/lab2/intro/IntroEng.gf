concrete IntroEng of Intro = {

lincat
  S = Str ;
  NP = {s : Case => Str ; a : Agr} ;
  VP = Agr => Str ;
  CN = Str ;
  Det = Str ;
  Pron = {s : Case => Str ; a : Agr} ;
  Subj = Str ;
  N = Str ;
  A = Str ;
  V2 = Agr => Str ;
  Adv = Str ;
 
lin
  PredVP np vp = np.s ! Nom ++ vp ! np.a ;
  AdvS s adv = s ++ adv ;
  ComplV2 v2 np = table {a => v2 ! a ++ np.s ! Acc} ;
  DetCN det cn = {s = table {_ => det ++ cn} ; a = SgP3} ;
  UsePron pron = pron ;
  AdjCN a cn = a ++ cn ;
  UseN n = n ;
  SubjS subj s = subj ++ s ;

  the_Det = "the" ;
  we_Pron = {s = table {Nom => "we" ; Acc => "us"} ; a = Other} ;
  because_Subj = "because" ;

  cat_N = "cat" ;
  black_A = "black" ;
  see_V2 = table {SgP3 => "sees" ; Other => "see"} ;
  now_Adv = "now" ;

param
  Case = Nom | Acc ;
  Agr = SgP3 | Other ;

}
