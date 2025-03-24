--# -path=.:../abstract

concrete MicroLangEng of MicroLang = open MicroResEng in {

lincat
  Utt = {s : Str} ;
  S = {s : Str} ;

  VP = {verb : MicroResEng.V ; compl : Str} ;


  CN = MicroResEng.N ; 
  AP = MicroResEng.A ;

  NP = MicroResEng.Pron ;
  Pron = MicroResEng.Pron ;

  N = MicroResEng.N ;
  A = MicroResEng.A ;
  V = MicroResEng.V ;
  V2 = MicroResEng.V2 ;

lin

  PredVPS np vp = {s = np.s ! Nom ++ selectVerb vp.verb np.n ++ vp.compl} ;

  UseV v = {verb = v ; compl = []} ;
  ComplV2 v np = {verb = v ; compl = np.s ! Acc} ;

  AdjCN ap cn = {s = \\n => ap.s ++ cn.s ! n} ;


  UsePron p = p ;
  
  UseN n = n ;
  PositA a = a ;


  he_Pron = mkPron "he" "him" Sg ;
  she_Pron = mkPron "she" "her" Sg ;
  they_Pron = mkPron "they" "them" Pl ;


  book_N = {s = table {Sg => "book" ; Pl => "books"}} ;
  grammar_N = mkN "grammar" ;
  woman_N = mkN "woman" "women" ;
  child_N = mkN "child" "children" ;
  boy_N = mkN "boy" ;

  big_A = mkA "big" ;
  good_A = mkA "good" ;
  live_V = mkV "live" ;
  love_V2 = mkV2 "love" ;
  


}