abstract Nano = {

cat
  S ; NP ; VP ; CN ;
  Det ; Pron ; A ; N ; V2 ;

fun
  PredVPS : NP -> VP -> S ;
  ComplV2 : V2 -> NP -> VP ;
  DetCN : Det -> CN -> NP ;
  AdjCN : A -> CN -> CN ;
  UseCN : N -> CN ;
  UsePron : Pron -> NP ;

  the_Det : Det ;
  black_A : A ;
  cat_N : N ;
  see_V2 : V2 ;
  we_Pron : Pron ;

}