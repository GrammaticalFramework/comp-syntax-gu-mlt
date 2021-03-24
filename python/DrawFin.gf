concrete DrawFin of Draw =

  open SyntaxFin, ParadigmsFin, LexiconFin
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
      mkUtt (mkImp (mkVP (mkV2 "piirtää") (mkNP a_Det object))) -- draw a circle
    | mkUtt (mkNP a_Det object)                                 -- a circle
    | mkUtt object                                              -- circle
    ;
  removeCommand object =
      mkUtt (mkImp (mkVP (mkV2 "poistaa") object)) ; 
  moveCommand object place =
      mkUtt (mkImp (mkVP (mkVP (mkV2 (mkV "siirtää") partitive) object) place)) ;
      
  shapeObject size colour shape = mkCN size (mkCN colour shape) ;

  theObjectRef object = mkNP the_Det object ;
  itObjectRef = it_NP ;

  circle_Shape = mkCN (mkN "ympyrä" "ympyröitä") ;
  square_Shape = mkCN (mkN "neliö" "neliöitä") ;

  big_Size = mkAP big_A ;
  small_Size = mkAP small_A ;
  noSize = mkAP (invarA "") ; ---

  green_Colour = mkAP green_A ;
  red_Colour = mkAP red_A ;
  blue_Colour = mkAP blue_A ;
  yellow_Colour = mkAP yellow_A ;

  noColour = mkAP (invarA "") ; ---

  upPlace = pmkAdv "ylöspäin" ;
  downPlace = pmkAdv "alaspäin" ;
  leftPlace = pmkAdv "vasemmalle" ;
  rightPlace = pmkAdv "oikealle" ;
  midPlace = pmkAdv "keskelle" ;
  
  noPlace = pmkAdv "" ;

oper
  pmkAdv : Str -> Adv = ParadigmsFin.mkAdv ;

}