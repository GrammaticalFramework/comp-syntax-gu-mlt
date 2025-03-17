concrete IntroFre of Intro = {

lincat
  S = Str ;
  NP = {s : Case => Str ; a : Agr ; t : NPType} ;
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
  ComplV2 v2 np = case np.t of {
      NPPron => table {a => np.s ! Acc ++ v2 ! a} ;
      NPOther => table {a => v2 ! a ++ np.s ! Acc}
      } ;
  DetCN det cn = {s = table {_ => det ++ cn} ; a = SgP3 ; t = NPOther} ;
  UsePron pron = pron ** {t = NPPron} ;
  AdjCN a cn = cn ++ a ;
  UseN n = n ;
  SubjS subj s = subj ++ s ;

  the_Det = "le" ;
  we_Pron = {s = table {Nom => "nous" ; Acc => "nous"} ; a = Other} ;
  because_Subj = "parce que" ;

  cat_N = "chat" ;
  black_A = "noir" ;
  see_V2 = table {SgP3 => "voit" ; Other => "voyons"} ;
  now_Adv = "maintenant" ;

param
  Case = Nom | Acc ;
  Agr = SgP3 | Other ;
  NPType = NPPron | NPOther ;

}
