concrete FactsSwe of Facts = 
  open SyntaxSwe, SymbolicSwe, (E=ExtendSwe) in {

lincat
  Fact = Cl ;
  Object = NP ;
  Attribute = CN ;
  Value = NP ;
  Name = NP ;

lin
  AttributeFact attr obj val = mkCl (mkNP (E.GenNP obj) attr) val ;
  NameObject name = name ;
  NameValue name = name ;
  IntValue int = symb int ;

}