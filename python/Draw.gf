abstract Draw = {

flags startcat = Command ;

cat
  Command ;
  Object ;
  ObjectRef ;
  Shape ;
  Colour ;
  Size ;
  Place ;

fun
  drawCommand   : Object -> Command ;
  removeCommand : ObjectRef -> Command ;
  moveCommand   : ObjectRef -> Place -> Command ;

  shapeObject  : Size -> Colour -> Shape -> Object ;
  
  theObjectRef : Object -> ObjectRef ;
  itObjectRef  : ObjectRef ;

  circle_Shape : Shape ;
  square_Shape : Shape ;

  big_Size   : Size ;
  small_Size : Size ;
  
  noSize : Size ;

  green_Colour  : Colour ;
  red_Colour    : Colour ;
  blue_Colour   : Colour ;
  yellow_Colour : Colour ;

  noColour : Colour ;

  upPlace    : Place ;
  downPlace  : Place ;
  leftPlace  : Place ;
  rightPlace : Place ;
  midPlace   : Place ;
  
  noPlace    : Place ;
 
}