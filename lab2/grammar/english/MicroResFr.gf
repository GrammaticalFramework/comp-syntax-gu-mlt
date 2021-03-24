resource MicroResFr = open Prelude in {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;
  Gender = F | M ;
  Person = P1 | P2 | P3 ;

  -- infinitive | present forms of French verbs
  VForm = VInf | VPres Person Number; 

oper
  --------------------- NOUNS --------------------------
  ------------------------------------------------------

  Noun : Type = {s : Number => Str ; gen : Gender} ;

  mkNoun : Str -> Str -> Noun = \sg,pl -> {
    s = table {Sg => sg ; Pl => pl} ;
    gen = mkGen sg
    } ;

  regNoun : Str -> Noun = \sg -> mkNoun sg (sg + "s") ;

  smartNoun : Str -> Noun = \sg -> case sg of {
    _ + ("é"|"o"|"e"|"n"|"t"|"r"|"i"|"il"|"ol"|"el") => regNoun sg ;
    _ + ("au"|"eu"|"eau") => mkNoun sg (sg + "x") ;
    noun + "al" => mkNoun sg (noun + "aux") ;
    noun + ("z"|"s"|"x") => mkNoun sg sg ;  --plural defective nouns
    ("sang"|"lait") => mkNoun sg sg         --attempt in 
    } ;

    mkGen: Str -> Gender = \sg -> case sg of {
	  root + ("au"|"isson"|"eu"|"t"|"o"|"age"|"é"|"ire"|"al"|"i"|"g"|"in"|"at"|"nt"|"en") => M ;     -- some general rules for M nouns
    ("garçon"|"livre"|"arbre") => M ;                                                              -- exceptions for M
	  root + ("té"|"ion"|"elle"|"me"|"ère"|"eur"|"ure"|"che"|"le"|"aire"|"ue"|"er") => F ;           -- some general rules for F nouns
    ("maison" | "eau") => F                                                                        -- exceptions for F
	  } ;



  ----------------------- ADJ inflection tables ----------------------
  --------------------------------------------------------------------

  Adjective : Type = {s : Number => Gender => Str} ;

  mkAdjective : (msg,fsg,mpl,fpl : Str) -> Adjective = \msg,fsg,mpl,fpl -> 
    {s = table { Sg => table { M => msg ; F => fsg } ; Pl => table { M => mpl ; F => fpl }
    } ;
  } ;

  regA : (msg : Str) -> Adjective = \grand ->
    mkAdjective grand (grand + "e") (grand + "s") (grand + "es") ;


  irA_anc : (msg : Str) -> Adjective = \blanc ->
    mkAdjective blanc (blanc+"he") (blanc + "s") (blanc+"hes" ) ;


  irA_eau : (msg : Str) -> Adjective = \nouv ->
    mkAdjective (nouv + "eau") (nouv + "elle") (nouv + "eaux") (nouv + "elles") ;


 -- adj that are gender invariable - have the same form for both genders in Sg | Pl: e.g. "calme" "calme" "calmes" "calmes"
  invar_gen : (msg : Str) -> Adjective = \propre -> 
    mkAdjective propre propre (propre + "s") (propre + "s") ;   
  

 -- adj that are number invariable - have the same form for both genders in Sg: e.g."anglais" "anglaise" "anglais" "anglaises"

  invar_num : (msg : Str) -> Adjective = \mauvais ->
    mkAdjective mauvais (mauvais + "e") mauvais (mauvais + "es") ;

  dupl_n : (msg : Str) -> Adjective = \bon ->
    let bonn = bon + last bon
    in
    mkAdjective bon (bonn + "e") (bon + "s") (bonn + "es") ;


  smartA : (msg : Str) -> Adjective = \adj -> case adj of {
     _ + ("d"|"t"|"eu"|"r") => regA adj ;
     _ + "anc" => irA_anc adj ;
     adj + "eau" => irA_eau adj ;
     _ + "e" => invar_gen adj ;
     _ + ("ien"|"on"|"en") => dupl_n adj ;
     _ + "s" => invar_num adj
  } ;



  ------------------- VERB Paradigms------------------------
  ----------------------------------------------------------
 
  Verb : Type = {s : VForm => Str} ;

  mkVerb : (vinf,p1sg,p1pl,p2sg,p2pl,p3sg,p3pl : Str) -> Verb
    = \vinf,p1sg,p1pl,p2sg,p2pl,p3sg,p3pl -> {
    s = table {
      VInf => vinf ;
      VPres P1 Sg => p1sg ;
      VPres P2 Sg => p2sg ;
      VPres P3 Sg => p3sg ;
      VPres P1 Pl => p1pl ;
      VPres P2 Pl => p2pl ;
      VPres P3 Pl => p3pl
      } ;
    } ;
  
  -- verbs ending in -ger that need an extra "e" for the 1st Person pl

  ger_Verb : Str -> Verb = \manger ->
     let mange = init manger
     in
     mkVerb manger mange (mange + "ons") (mange + "s") (mange + "z") mange (mange + "nt") ;


  er_Verb : Str -> Verb = \aimer ->
     let aim = init aimer
     in
     mkVerb aimer aim (aim + "ons") (aim + "s") (aim + "z") aim (aim + "nt")  ;


  ir_Verb : Str -> Verb = \cour ->
     mkVerb cour (cour + "s") (cour + "ons") (cour + "s") (cour + "ez") (cour + "t") (cour + "ent") ;


  re_Verb : Str -> Verb = \attendre ->
     let attend = init attendre
     in
     mkVerb attendre (attend + "ds") (attend + "dons") (attend + "ds") (attend + "dez") (attend + "d") (attend + "dent") ;


   -- regular verbs with predictable variations
  smartVerb : Str -> Verb = \v -> case v of {
     v + "re"	=> re_Verb v ;
     v + "ir" => ir_Verb v ;
     v + "er" => er_Verb v ;
     _ + "g" + "er" => ger_Verb v
     } ;

  -- some irregular verbs e.g. acheter achète achètes
  irregVerb : (vinf,p1sg,p2sg,p3sg,p1pl,p2pl,p3pl : Str) -> Verb =
    \vinf,p1sg,p2sg,p3sg,p1pl,p2pl,p3pl ->
	  mkVerb vinf p1sg p2sg p3sg p1pl p2pl p3pl ;

  -- two-place verb with "case" as preposition; for transitive verbs, c=[]
  Verb2 : Type = Verb ** {c : Number => Gender => Str} ;

  be_Verb : Verb = mkVerb "être" "suis" "es" "est" "sommes" "êtes" "sont" ; ---s to be generalized

  Determiner : Type = {s : Str ; n : Number ; gen : Gender} ;

  mkDet : Str -> Number -> Gender -> Determiner ;
  mkDet   str   num        gen     =  {s=str ; n = num ; gen = gen} ;


 ---s a very simplified verb agreement function for Micro
  agr2vform : Number -> VForm = \a -> case a of {
    Sg => VPres P3 Sg ;
    Pl => VPres P3 Pl     
    } ;
}