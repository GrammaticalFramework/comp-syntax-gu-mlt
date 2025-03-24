abstract Intro = {

cat
  S ;
  NP ;
  VP ;
  CN ;
  Det ;
  Pron ;
  Subj ;
  N ;
  A ;
  V2 ;
  Adv ;
 
fun
  PredVP  : NP -> VP -> S ;
  AdvS    : S -> Adv -> S ;
  ComplV2 : V2 -> NP -> VP ;
  DetCN   : Det -> CN -> NP ;
  UsePron : Pron -> NP ;
  AdjCN   : A -> CN -> CN ;
  UseN    : N -> CN ;
  SubjS   : Subj -> S -> Adv ;

  the_Det : Det ;
  we_Pron : Pron ;
  because_Subj : Subj ;

  cat_N : N ;
  black_A : A ;
  see_V2 : V2 ;
  now_Adv : Adv ;

}
