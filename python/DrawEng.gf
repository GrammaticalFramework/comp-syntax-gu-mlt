concrete DrawEng of Draw =

  open SyntaxEng, ParadigmsEng, LexiconEng, IrregEng
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
      mkUtt (mkImp (mkVP (mkV2 draw_V) (mkNP a_Det object))) -- draw a circle
    | mkUtt (mkNP a_Det object)                              -- a circle
    | mkUtt object                                           -- circle
    ;
  removeCommand object =
      mkUtt (mkImp (mkVP (mkV2 "remove") object)) ; 
  moveCommand object place =
      mkUtt (mkImp (mkVP (mkVP (mkV2 "move") object) place)) ;
      
  shapeObject size colour shape = mkCN size (mkCN colour shape) ;

  theObjectRef object = mkNP the_Det object ;
  itObjectRef = it_NP ;
  
  circle_Shape = mkCN (mkN "circle") ;
  square_Shape = mkCN (mkN "square") ;

  big_Size = mkAP big_A ;
  small_Size = mkAP small_A ;
  noSize = mkAP (mkA "") ; ---

  green_Colour = mkAP green_A ;
  red_Colour = mkAP red_A ;
  blue_Colour = mkAP blue_A ;
  yellow_Colour = mkAP yellow_A ;

  noColour = mkAP (mkA "") ; ---

  upPlace = pmkAdv "up" ;
  downPlace = pmkAdv "down" ;
  leftPlace = pmkAdv "left" ;
  rightPlace = pmkAdv "right" ;
  midPlace = pmkAdv "to the middle" ;
  
  noPlace = pmkAdv "" ;

oper
  pmkAdv : Str -> Adv = ParadigmsEng.mkAdv ;
}