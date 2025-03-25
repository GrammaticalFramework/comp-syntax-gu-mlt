--# -path=.:../abstract

concrete MicroLangEng of MicroLang =
  open MicroResEng
  in {

lincat
  N = Noun ;

lin
  animal_N = mkN "animal" ;
  apple_N = mkN "apple" ;
  baby_N = mkN "baby" ;
  woman_N = mkN "woman" "women" ;
}