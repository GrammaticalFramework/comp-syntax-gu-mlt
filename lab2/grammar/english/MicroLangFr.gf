--# -path=.:../abstract
concrete MicroLangFr of MicroLang = open MicroResFr, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat
    Utt = {s : Str} ;
    
    S  = {s : Str} ;
    VP = {verb : Verb ; compl : Number => Gender => Str} ;
    Comp = Adjective ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; gen : Gender ; num : Number } ;
    Pron = {s : Case => Str ; gen : Gender ; num: Number } ;
    Det = {s : Str ; num : Number ; gen : Gender } ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    Adv = {s : Str} ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

   -- PredVP : NP -> VP -> Cl
    PredVPS np vp = {
      s = np.s ! Nom ++ vp.verb.s ! agr2vform np.num ++ vp.compl ! np.num ! np.gen
      } ;
      
    --  V -> VP 
    UseV v = {
      verb = v ;
      compl = \\num,gen => [] ;
      } ;
      
    -- V2 -> NP -> VP
    ComplV2 v2 np = {
      verb = v2 ;
      compl = \\num,gen => v2.c ! num ! gen ++ np.s ! Acc  -- NP object in the accusative
      } ;
      
    UseComp comp = {
      verb = be_Verb ;  -- the verb is the copula "être"
      compl = \\num,gen => comp.s ! num ! gen
      } ;
       
    CompAP ap = ap ;
      
    AdvVP vp adv =
      vp ** {compl = \\num,gen => vp.compl ! num ! gen ++ adv.s} ; --update complement by + adv
      
    -- Det -> CN -> NP
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.num ;
      gen = cn.gen ;
      num = det.num ;
      } ;
                  
    a_Det = {s = pre {"a"|"e"|"i"|"o" => "l'" ; _ => "le"} ; num = Sg ; gen = M | F} ;
    aPl_Det = {s = "la" ; num = Sg ; gen = F} ;
    the_Det = {s = "les" ; num = Pl ; gen = M | F} ;
    thePl_Det = {s = "des" ; num = Pl ; gen = M | F} ;
  
    UsePron p = p ;
    
    -- N -> CN
    UseN noun = noun ;
    
    -- AP -> CN -> CN
    AdjCN ap cn = {
      s = \\num => ap.s ! num ! cn.gen ++ cn.s ! num ;  --table from number to gender to string
      gen = cn.gen ;
      } ;                                           

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    in_Prep = {s = "dans"} ;
    on_Prep = {s = "sur"} ;
    with_Prep = {s = "avec"} ;

    he_Pron = {
      s = table {Nom => "il" ; Acc => "le"} ;
      num = Sg ;
      pers = P3 ;
      gen = M ;
      } ;

    she_Pron = {
      s = table {Nom => "elle" ; Acc => "la"} ;
      num = Sg ;
      pers = P3 ;
      gen = F ;
      } ;

    they_Pron = {
      s = table {Nom => "ils" ; Acc => "les"} ;
      num = Pl ;
      pers = P3 ;
      gen = M | F ;

      } ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin already_Adv = mkAdv "déja" ;
lin animal_N = mkN "animal" ;
lin apple_N = mkN "pomme" ;
lin baby_N = mkN "bébé" ;
lin bad_A = mkA "mauvais" ;
lin beer_N = mkN "bière" ;
lin big_A = mkA "grand" ;
lin bike_N = mkN "vélo" ;
lin bird_N = mkN "oiseau" ;
lin black_A = mkA "noir" ;
lin blood_N = mkN "sang" "sang";
lin blue_A = mkA "bleu" ;
lin boat_N = mkN "bâteau" ;
lin book_N = mkN "livre" ;
lin boy_N = mkN "garçon" ;
lin bread_N = mkN "pain" ;
lin break_V2 = mkV2 (mkV "casser") ;
lin buy_V2 = mkV2 (mkV "acheter" "achète" "achetons" "achètes" "achetez" "achète" "achetent") ;
lin car_N = mkN "voiture" ;
lin cat_N = mkN "chat" ;
lin child_N = mkN "enfant" ;
lin city_N = mkN "ville" ;
lin clean_A = mkA "propre" ;
lin clever_A = mkA "intelligent" ;
lin cloud_N = mkN "nuage" ;
lin cold_A = mkA "froid" ;
lin come_V = mkV "venir" "viens" "venons" "viens" "venez" "vient" "viennent" ;
lin computer_N = mkN "ordinateur" ;
lin cow_N = mkN "vache" ;
lin dirty_A = mkA "sale" ;
lin dog_N = mkN "chien" ;
lin drink_V2 = mkV2 (mkV "boire" "bois" "buvons" "bois" "buvez" "boit" "boivent") ;
lin eat_V2 = mkV2 (mkV "manger") ;
lin find_V2 = mkV2 (mkV "trouver") ;
lin fire_N = mkN "feu" ;
lin fish_N = mkN "poisson" ;
lin flower_N = mkN "fleur" ;
lin friend_N = mkN "ami" ;
lin girl_N = mkN "fille" ;
lin good_A = mkA "bon" ;
lin go_V = mkV "aller" "vais" "allons" "vas" "allez" "va" "vont" ;
lin grammar_N = mkN "grammaire" ;
lin green_A = mkA "vert" ;
lin heavy_A = mkA "lourd" ;
lin horse_N = mkN "cheval" ;
lin hot_A = mkA "chaud" ;
lin house_N = mkN "maison" ;
-- lin john_PN = mkPN "John" ;
lin jump_V = mkV "sauter" ;
lin kill_V2 = mkV2 "tuer" ;
-- lin know_VS = mkVS (mkV "savoir" "sais" "savons" "sais" "savez" "sait" "savent") ;
lin language_N = mkN "langue" ;
lin live_V = mkV "vivre" ;
lin love_V2 = mkV2 (mkV "aimer") ;
lin man_N = mkN "homme" ;
lin milk_N = mkN "lait" "lait" ;
lin music_N = mkN "musique"  ;
lin new_A = mkA "nouveau" ;
lin now_Adv = mkAdv "maintenant" ;
lin old_A = mkA "ancien" ;
-- lin paris_PN = mkPN "Paris" ;
lin play_V = mkV "jouer" ;
lin read_V2 = mkV2 (mkV "lire" "lis" "lisons" "lis" "lisez" "lit" "lisent") ;
lin ready_A = mkA "prêt" ;
lin red_A = mkA "rouge" ;
lin river_N = mkN "rivière" ;
lin run_V = mkV "courir" ;
lin sea_N = mkN "mer" ;
lin see_V2 = mkV2 (mkV "voir") ;
lin ship_N = mkN "navire" ;
lin sleep_V = mkV "acheter" "achète" "achètes" "achete" "achètons" "achetez" "achetent" ;
lin small_A = mkA "petit" ;
lin star_N = mkN "etoile" ;
lin swim_V = mkV "nager" ;
lin teach_V2 = mkV2 (mkV "enseigner") ;
lin train_N = mkN "train" ;
lin travel_V = mkV "voyager" ;
lin tree_N = mkN "arbre" ;
lin understand_V2 = mkV2 (mkV "comprendre") ;
lin wait_V2 = mkV2 "attendre" ;
lin walk_V = mkV "marcher" ;
lin warm_A = mkA "chaud" ;
lin water_N = mkN "eau" ;
lin white_A = mkA "blanc" ;
lin wine_N = mkN "vin" ;
lin woman_N = mkN "femme" ;
lin yellow_A = mkA "jaune" ;
lin young_A = mkA "jeune" ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable nouns according to the pattern matching
      = \n -> lin N (smartNoun n) ;
    mkN : Str -> Str -> Noun  -- irregular nouns
      = \sg,pl -> lin N (mkNoun sg pl) ;
    } ;

  mkA : Str -> A = \s -> lin A (smartA s) ;

  mkV = overload {
    mkV : (inf : Str) -> V  
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,p1sg,p2sg,p3sg,p1pl,p2pl,p3pl : Str) -> V  
      = \inf,p1sg,p2sg,p3sg,p1pl,p2pl,p3pl -> lin V (irregVerb inf p1sg p2sg p3sg p1pl p2pl p3pl) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2 
      = \s   -> lin V2 (smartVerb s ** {c =\\num,gen => []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition
      = \s,p -> lin V2 (smartVerb s ** {c =\\num,gen => p}) ;
    mkV2 : V -> V2            -- any verb with direct object
      = \v   -> lin V2 (v ** {c =\\num,gen => []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c =\\num,gen => p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;

}
