--# -path=.:../abstract
concrete MicroLangEng of MicroLang = open MicroResEng, Prelude in {

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  lincat
    Utt = {s : Str} ;
    
    S  = {s : Str} ;
    VP = {verb : Verb ; compl : Str} ; ---s special case of Mini
    Comp = {s : Str} ;
    AP = Adjective ;
    CN = Noun ;
    NP = {s : Case => Str ; a : Agreement} ;
    Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; n : Number} ;
    Prep = {s : Str} ;
    V = Verb ;
    V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    Adv = {s : Str} ;

  lin
    UttS s = s ;
    UttNP np = {s = np.s ! Acc} ;

    PredVPS np vp = {
      s = np.s ! Nom ++ vp.verb.s ! agr2vform np.a ++ vp.compl
      } ;
      
    UseV v = {
      verb = v ;
      compl = [] ;
      } ;
      
    ComplV2 v2 np = {
      verb = v2 ;
      compl = v2.c ++ np.s ! Acc  -- NP object in the accusative, preposition first
      } ;
      
    UseComp comp = {
      verb = be_Verb ;     -- the verb is the copula "be"
      compl = comp.s
      } ;
      
    CompAP ap = ap ;
      
    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;
      
    DetCN det cn = {
      s = \\c => det.s ++ cn.s ! det.n ;
      a = Agr det.n ;
      } ;
      
    UsePron p = p ;
            
    a_Det = {s = pre {"a"|"e"|"i"|"o" => "an" ; _ => "a"} ; n = Sg} ; --- a/an can get wrong
    aPl_Det = {s = "" ; n = Pl} ;
    the_Det = {s = "the" ; n = Sg} ;
    thePl_Det = {s = "the" ; n = Pl} ;
    
    UseN n = n ;
    
    AdjCN ap cn = {
      s = table {n => ap.s ++ cn.s ! n}
      } ;

    PositA a = a ;

    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    in_Prep = {s = "in"} ;
    on_Prep = {s = "on"} ;
    with_Prep = {s = "with"} ;

    he_Pron = {
      s = table {Nom => "he" ; Acc => "him"} ;
      a = Agr Sg ;
      } ;
    she_Pron = {
      s = table {Nom => "she" ; Acc => "her"} ;
      a = Agr Sg ;
      } ;
    they_Pron = {
      s = table {Nom => "they" ; Acc => "them"} ;
      a = Agr Pl ;
      } ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin already_Adv = mkAdv "already" ;
lin animal_N = mkN "animal" ;
lin apple_N = mkN "apple" ;
lin baby_N = mkN "baby" ;
lin bad_A = mkA "bad" ;
lin beer_N = mkN "beer" ;
lin big_A = mkA "big" ;
lin bike_N = mkN "bike" ;
lin bird_N = mkN "bird" ;
lin black_A = mkA "black" ;
lin blood_N = mkN "blood" ;
lin blue_A = mkA "blue" ;
lin boat_N = mkN "boat" ;
lin book_N = mkN "book" ;
lin boy_N = mkN "boy" ;
lin bread_N = mkN "bread" ;
lin break_V2 = mkV2 (mkV "break" "broke" "broken") ;
lin buy_V2 = mkV2 (mkV "buy" "bought" "bought") ;
lin car_N = mkN "car" ;
lin cat_N = mkN "cat" ;
lin child_N = mkN "child" "children" ;
lin city_N = mkN "city" ;
lin clean_A = mkA "clean" ;
lin clever_A = mkA "clever" ;
lin cloud_N = mkN "cloud" ;
lin cold_A = mkA "cold" ;
lin come_V = mkV "come" "came" "come" ;
lin computer_N = mkN "computer" ;
lin cow_N = mkN "cow" ;
lin dirty_A = mkA "dirty" ;
lin dog_N = mkN "dog" ;
lin drink_V2 = mkV2 (mkV "drink" "drank" "drunk") ;
lin eat_V2 = mkV2 (mkV "eat" "ate" "eaten") ;
lin find_V2 = mkV2 (mkV "find" "found" "found") ;
lin fire_N = mkN "fire" ;
lin fish_N = mkN "fish" "fish" ;
lin flower_N = mkN "flower" ;
lin friend_N = mkN "friend" ;
lin girl_N = mkN "girl" ;
lin good_A = mkA "good" ;
lin go_V = mkV "go" "went" "gone" ;
lin grammar_N = mkN "grammar" ;
lin green_A = mkA "green" ;
lin heavy_A = mkA "heavy" ;
lin horse_N = mkN "horse" ;
lin hot_A = mkA "hot" ;
lin house_N = mkN "house" ;
-- lin john_PN = mkPN "John" ;
lin jump_V = mkV "jump" ;
lin kill_V2 = mkV2 "kill" ;
-- lin know_VS = mkVS (mkV "know" "knew" "known") ;
lin language_N = mkN "language" ;
lin live_V = mkV "live" ;
lin love_V2 = mkV2 (mkV "love") ;
lin man_N = mkN "man" "men" ;
lin milk_N = mkN "milk" ;
lin music_N = mkN "music" ;
lin new_A = mkA "new" ;
lin now_Adv = mkAdv "now" ;
lin old_A = mkA "old" ;
-- lin paris_PN = mkPN "Paris" ;
lin play_V = mkV "play" ;
lin read_V2 = mkV2 (mkV "read" "read" "read") ;
lin ready_A = mkA "ready" ;
lin red_A = mkA "red" ;
lin river_N = mkN "river" ;
lin run_V = mkV "run" "ran" "run" ;
lin sea_N = mkN "sea" ;
lin see_V2 = mkV2 (mkV "see" "saw" "seen") ;
lin ship_N = mkN "ship" ;
lin sleep_V = mkV "sleep" "slept" "slept" ;
lin small_A = mkA "small" ;
lin star_N = mkN "star" ;
lin swim_V = mkV "swim" "swam" "swum" ;
lin teach_V2 = mkV2 (mkV "teach" "taught" "taught") ;
lin train_N = mkN "train" ;
lin travel_V = mkV "travel" ;
lin tree_N = mkN "tree" ;
lin understand_V2 = mkV2 (mkV "understand" "understood" "understood") ;
lin wait_V2 = mkV2 "wait" "for" ;
lin walk_V = mkV "walk" ;
lin warm_A = mkA "warm" ;
lin water_N = mkN "water" ;
lin white_A = mkA "white" ;
lin wine_N = mkN "wine" ;
lin woman_N = mkN "woman" "women" ;
lin yellow_A = mkA "yellow" ;
lin young_A = mkA "young" ;

---------------------------
-- Paradigms part ---------
---------------------------

oper
  mkN = overload {
    mkN : Str -> Noun   -- predictable noun, e.g. car-cars, boy-boys, fly-flies, bush-bushes
      = \n -> lin N (smartNoun n) ;
    mkN : Str -> Str -> Noun  -- irregular noun, e.g. man-men
      = \sg,pl -> lin N (mkNoun sg pl) ;
    } ;

  mkA : Str -> A
    = \s -> lin A {s = s} ;

  mkV = overload {
    mkV : (inf : Str) -> V  -- predictable verb, e.g. play-plays, cry-cries, wash-washes
      = \s -> lin V (smartVerb s) ;
    mkV : (inf,pres,part : Str) -> V  -- irregular verb, e.g. drink-drank-drunk
      = \inf,pres,part -> lin V (irregVerb inf pres part) ;
    } ;

  mkV2 = overload {
    mkV2 : Str -> V2          -- predictable verb with direct object, e.g. "wash"
      = \s   -> lin V2 (smartVerb s ** {c = []}) ;
    mkV2 : Str  -> Str -> V2  -- predictable verb with preposition, e.g. "wait - for"
      = \s,p -> lin V2 (smartVerb s ** {c = p}) ;
    mkV2 : V -> V2            -- any verb with direct object, e.g. "drink"
      = \v   -> lin V2 (v ** {c = []}) ;
    mkV2 : V -> Str -> V2     -- any verb with preposition
      = \v,p -> lin V2 (v ** {c = p}) ;
    } ;

  mkAdv : Str -> Adv
    = \s -> lin Adv {s = s} ;
  
  mkPrep : Str -> Prep
    = \s -> lin Prep {s = s} ;

}
