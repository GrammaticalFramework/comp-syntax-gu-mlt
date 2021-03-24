concrete DrawSwe of Draw =

  open SyntaxSwe, ParadigmsSwe, LexiconSwe, IrregSwe, Prelude,
  (G = GrammarSwe)
  in {

lincat
  Command = Utt ;
  Object = CN ;
  ObjectRef = NP ;
  Shape = CN ;
  Colour = AP ** {isAdj : Bool} ;
  Size = AP ** {isAdj : Bool} ;
  Place = Adv ;

lin
  drawCommand object =
      mkUtt (mkImp (mkVP (mkV2 "rita") (mkNP a_Det object))) -- draw a circle
    | mkUtt (mkNP a_Det object)                              -- a circle
    | mkUtt object                                           -- circle
    ;
  removeCommand object =
      mkUtt (mkImp (mkVP (mkV2 (mkV (mkV "ta") "bort")) object)) ;
  moveCommand object place =
      mkUtt (mkImp (mkVP (mkVP (mkV2 "flytta") object) place)) ;
      
  shapeObject size colour shape =
    G.AdjCN size (G.AdjCN colour shape ** {isMod = colour.isAdj})
      ** {isMod = orB size.isAdj colour.isAdj} ;
      
  theObjectRef object = mkNP the_Det object ;
  itObjectRef = mkNP (mkPN "den") ; --- it_NP = det ;

  circle_Shape = mkCN (mkN "cirkel" "cirkeln" "cirklar" "cirklarna") ;
  square_Shape = mkCN (mkN "kvadrat" "kvadrater") ;

  big_Size = mkrAP big_A ;
  small_Size = mkrAP small_A ;
  noSize = emptyAP ;

  green_Colour = mkrAP green_A ;
  red_Colour = mkrAP red_A ;
  blue_Colour = mkrAP blue_A ;
  yellow_Colour = mkrAP yellow_A ;

  noColour = emptyAP ;

  upPlace = pmkAdv "upp" ;
  downPlace = pmkAdv "ner" ;
  leftPlace = pmkAdv "åt vänster" ;
  rightPlace = pmkAdv "åt höger" ;
  midPlace = pmkAdv "till mitten" ;
  
  noPlace = pmkAdv "" ;
oper
  emptyAP : AP ** {isAdj : Bool} = mkAP (invarA "") ** {isAdj = False} ; ---
  mkrAP : A -> AP ** {isAdj : Bool} = \a -> mkAP a ** {isAdj = True} ;
  pmkAdv : Str -> Adv = ParadigmsSwe.mkAdv ;
}

