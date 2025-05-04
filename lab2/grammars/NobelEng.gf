concrete NobelEng of Nobel = LabelsEng ** open
  SyntaxEng,
  ParadigmsEng,
  SymbolicEng,
  IrregEng
in {

lincat
  Sentence = S ;
  Name = NP ;
  Date = Adv ;

lin
  BornSentence name country date =
    mkS pastTense (mkCl name (mkVP (mkVP born_VP (inAdv country)) date)) ;
    
  AwardSentence name award date =
    mkS pastTense (mkCl name (mkVP (mkVP (mkV2 get_V) award) date)) ;
      
  DiedSentence name date =
    mkS pastTense (mkCl name (mkVP die_VP date)) ;

  StringName s = symb s ;
  
  YearDate i = inAdv <symb i : NP> ;

  he_Name = he_NP ;
  she_Name = she_NP ;
  they_Name = they_NP ;

oper
  inAdv : NP -> Adv = \np -> SyntaxEng.mkAdv in_Prep np ;
  born_VP = mkVP (mkA "born") ;
  die_VP = mkVP (mkV "die") ;

}
