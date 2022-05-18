concrete DrawGer of Draw =

  open SyntaxGer, ParadigmsGer, LexiconGer, IrregGer
  in {

lincat
  Command = Utt ;
  Object = CN ;
  ObjectRef = NP ;
  Shape = CN ;
  Colour = AP ;
  Size = AP ;
  Place = Adv ;

lin
  drawCommand object =
      mkUtt (mkImp (mkVP (mkV2 (mkV "malen")) (mkNP a_Det object))) -- draw a circle
    | mkUtt (mkNP a_Det object)                              -- a circle
    | mkUtt object                                           -- circle
    ;
  removeCommand object =
      mkUtt (mkImp (mkVP (mkV2 "beseitigen") object)) ; 
  moveCommand object place =
      mkUtt (mkImp (mkVP (mkVP (mkV2 "bewegen") object) place)) ;
      
  shapeObject size colour shape = mkCN size (mkCN colour shape) ;

  theObjectRef object = mkNP the_Det object ;
  itObjectRef = it_NP ;
  
  circle_Shape = mkCN (mkN "Kreis") ;
  square_Shape = mkCN (mkN "Quadrat" neuter) ;

  big_Size = mkAP big_A ;
  small_Size = mkAP small_A ;
  noSize = mkAP (invarA "") ; ---

  green_Colour = mkAP green_A ;
  red_Colour = mkAP red_A ;
  blue_Colour = mkAP blue_A ;
  yellow_Colour = mkAP yellow_A ;

  noColour = mkAP (invarA "") ; ---

  upPlace = pmkAdv "hoch" ;
  downPlace = pmkAdv "runter" ;
  leftPlace = pmkAdv "links" ;
  rightPlace = pmkAdv "rechts" ;
  midPlace = pmkAdv "in die Mitte" ;
  
  noPlace = pmkAdv "" ;

oper
  pmkAdv : Str -> Adv = ParadigmsGer.mkAdv ;
}