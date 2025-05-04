concrete NobelFin of Nobel = LabelsFin ** open
  SyntaxFin,
  ParadigmsFin,
  SymbolicFin
in {

lincat
  Sentence = S ;
  Name = NP ;
  Date = Adv ;

lin
  BornSentence name country date =
    mkS pastTense (mkCl name (mkVP (mkVP born_VP (inAdv country)) date)) ;
    
  AwardSentence name award date =
    mkS pastTense (mkCl name (mkVP (mkVP get_V2 award) date)) ;
      
  DiedSentence name date =
    mkS pastTense (mkCl name (mkVP die_VP date)) ;

  StringName s = symb s ;
  
  YearDate i = SyntaxFin.mkAdv (mkPrep "vuonna" nominative)  <symb i : NP> ;

  he_Name = he_NP ;
  she_Name = she_NP ;
  they_Name = he_NP ;

oper
  inAdv : NP -> Adv = \np -> SyntaxFin.mkAdv in_Prep np ;
  born_VP = mkVP (mkV "syntyä") ;
  die_VP = mkVP (mkV "kuolla") ;
  get_V2 = mkV2 (mkV "saada") ;

}
