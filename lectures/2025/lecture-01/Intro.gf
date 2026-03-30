abstract Intro = {

cat
  S ;
  NP ;
  VP ;
  CN ;
  AP ;
  Det ;
  Pron ;
  N ;
  A ;
  V2 ;

fun
  PredVP : NP -> VP -> S ;
  ComplV2 : V2 -> NP -> VP ;
  DetCN : Det -> CN -> NP ;
  AdjCN : AP -> CN -> CN ;
  UseN : N -> CN ;
  UseA : A -> AP ;
  UsePron : Pron -> NP ;

  the_Det : Det ;
  black_A : A ;
  cat_N : N ;
  see_V2 : V2 ;
  we_Pron : Pron ;

}