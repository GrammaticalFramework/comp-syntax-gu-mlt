concrete NanoIta of Nano = {

lincat
  S, NP, VP, CN,
  Det, Pron, A, N, V2 = Str ;

lin
  PredVPS np vp = np ++ vp ;
  ComplV2 v2 np = np ++ v2 ;
  DetCN det cn = det ++ cn ;
  AdjCN a cn = cn ++ a ;
  UseCN n = n ;
  UsePron pron = pron ;

  the_Det = "il" ;
  black_A = "nero" ;
  cat_N = "gatto" ;
  see_V2 = "vede" ;
  we_Pron = "ci" ;

}