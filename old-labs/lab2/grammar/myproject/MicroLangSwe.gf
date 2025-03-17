--# -path=.:../abstract

concrete MicroLangSwe of MicroLang = open MicroResSwe in {

lincat N = MicroResSwe.N ;

lin baby_N = decl2 "bebis" ;
lin dog_N = decl2 "hund" ;
lin man_N = worstN "man" "mannen" "män" "männen" Utr ;
lin car_N = decl2 "bil" ;
--lin city_N = mkN "stad" ;
lin boy_N = decl2 "pojke" ;


}