concrete NobelEng of Nobel = LabelsEng ** open
  SyntaxEng,
  ParadigmsEng,
  SymbolicEng,
  IrregEng
in {

lincat
  Description = Text ;
  Name = NP ;
  Date = Adv ;

lin
  LivingDescription name pron country birthdate awarddate award =
    mkText
      (mkPhr (mkS pastTense (mkCl name (mkVP (mkVP born_VP (inAdv country)) birthdate))))
      (mkText (mkS pastTense (mkCl pron (mkVP (mkVP (mkV2 get_V) award) awarddate)))) ;

--  PastDescription : Name -> Country -> Date -> Date -> Award -> Description ;
  StringName s = symb s ;
  
  YearDate i = inAdv <symb i : NP> ;

  he_Name = he_NP ;
  she_Name = she_NP ;
  they_Name = they_NP ;

oper
  inAdv : NP -> Adv = \np -> SyntaxEng.mkAdv in_Prep np ;
  born_VP = mkVP (mkA "born") ;

}
