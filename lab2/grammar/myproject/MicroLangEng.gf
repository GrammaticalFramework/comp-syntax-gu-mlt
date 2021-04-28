--# -path=.:../abstract

concrete MicroLangEng of MicroLang = open MicroResEng in {

lincat N = MicroResEng.N ;

lin baby_N = mkN "baby" ;
lin dog_N = mkN "dog" ;
lin man_N = mkN "man" "men" ;
lin car_N = mkN "car" ;
lin city_N = mkN "city" ;
lin boy_N = mkN "boy" ;


}