concrete FactsEng of Facts = open SyntaxEng, SymbolicEng in {

lincat
  Fact = Cl ;
  Object = NP ;
  Attribute = CN ;
  Value = NP ;
  Name = NP ;

lin
  AttributeFact attr obj val = mkCl (mkNP the_Det (mkCN attr (mkAdv possess_Prep obj))) val ;
  NameObject name = name ;
  NameValue name = name ;
  IntValue int = symb int ;

}