abstract MicroLang = {

-- a very minimal version of MiniGrammar + MiniLexicon, helping to get started

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

  cat
  
-- Common
    Utt ;    -- sentence, question, word...         e.g. "be quiet"

-- Cat
    S ;      -- declarative sentence                e.g. "she lives here"
    VP ;     -- verb phrase                         e.g. "lives here"
    Comp ;   -- complement of copula                e.g. "warm"
    AP ;     -- adjectival phrase                   e.g. "warm"
    CN ;     -- common noun (without determiner)    e.g. "red house"
    NP ;     -- noun phrase (subject or object)     e.g. "the red house"
    Det ;    -- determiner phrase                   e.g. "those"
    Prep ;   -- preposition, or just case           e.g. "in", dative
    V ;      -- one-place verb                      e.g. "sleep" 
    V2 ;     -- two-place verb                      e.g. "love"
    A ;      -- one-place adjective                 e.g. "warm"
    N ;      -- common noun                         e.g. "house"
    Pron ;   -- personal pronoun                    e.g. "she"
    Adv ;    -- adverbial phrase                    e.g. "in the house"
    
  fun
-- Phrase
    UttS      : S  -> Utt ;         -- he walks
    UttNP     : NP -> Utt ;         -- he

-- Sentence
    PredVPS   : NP -> VP -> S ;             -- John walks --s shortcut even wrt MiniGrammar

-- Verb
    UseV      : V   -> VP ;             -- sleep
    ComplV2   : V2  -> NP -> VP ;       -- love it ---s
    UseComp   : Comp  -> VP ;           -- be small
    CompAP    : AP  -> Comp ;           -- small
    AdvVP     : VP -> Adv -> VP ;       -- sleep here

-- Noun
    DetCN     : Det -> CN -> NP ;       -- the man
    UsePron   : Pron -> NP ;            -- she
    a_Det     : Det ;                   -- indefinite singular ---s
    aPl_Det   : Det ;                   -- indefinite plural   ---s
    the_Det   : Det ;                   -- definite singular   ---s
    thePl_Det : Det ;                   -- definite plural     ---s
    UseN      : N -> CN ;               -- house
    AdjCN     : AP -> CN -> CN ;        -- big house

-- Adjective
    PositA    : A  -> AP ;              -- warm

-- Adverb
    PrepNP    : Prep -> NP -> Adv ;     -- in the house

-- Structural
    in_Prep   : Prep ;
    on_Prep   : Prep ;
    with_Prep : Prep ;

    he_Pron   : Pron ;
    she_Pron  : Pron ;
    they_Pron : Pron ;


-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

fun
  already_Adv : Adv ;
  animal_N : N ;
  apple_N : N ;
  baby_N : N ;
  bad_A : A ;
  beer_N : N ;
  big_A : A ;
  bike_N : N ;
  bird_N : N ;
  black_A : A ;
  blood_N : N ;
  blue_A : A ;
  boat_N : N ;
  book_N : N ;
  boy_N : N ;
  bread_N : N ;
  break_V2 : V2 ;
  buy_V2 : V2 ;
  car_N : N ;
  cat_N : N ;
  child_N : N ;
  city_N : N ;
  clean_A : A ;
  clever_A : A ;
  cloud_N : N ;
  cold_A : A ;
  come_V : V ;
  computer_N : N ;
  cow_N : N ;
  dirty_A : A ;
  dog_N : N ;
  drink_V2 : V2 ;
  eat_V2 : V2 ;
  find_V2 : V2 ;
  fire_N : N ;
  fish_N : N ;
  flower_N : N ;
  friend_N : N ;
  girl_N : N ;
  good_A : A ;
  go_V : V ;
  grammar_N : N ;
  green_A : A ;
  heavy_A : A ;
  horse_N : N ;
  hot_A : A ;
  house_N : N ;
--  john_PN : PN ;
  jump_V : V ;
  kill_V2 : V2 ;
--  know_VS : VS ;
  language_N : N ;
  live_V : V ;
  love_V2 : V2 ;
  man_N : N ;
  milk_N : N ;
  music_N : N ;
  new_A : A ;
  now_Adv : Adv ;
  old_A : A ;
--  paris_PN : PN ;
  play_V : V ;
  read_V2 : V2 ;
  ready_A : A ;
  red_A : A ;
  river_N : N ;
  run_V : V ;
  sea_N : N ;
  see_V2 : V2 ;
  ship_N : N ;
  sleep_V : V ;
  small_A : A ;
  star_N : N ;
  swim_V : V ;
  teach_V2 : V2 ;
  train_N : N ;
  travel_V : V ;
  tree_N : N ;
  understand_V2 : V2 ;
  wait_V2 : V2 ;
  walk_V : V ;
  warm_A : A ;
  water_N : N ;
  white_A : A ;
  wine_N : N ;
  woman_N : N ;
  yellow_A : A ;
  young_A : A ;

}