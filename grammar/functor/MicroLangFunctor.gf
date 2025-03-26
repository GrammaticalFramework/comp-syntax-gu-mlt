incomplete concrete MicroLangFunctor of MicroLang =

open
  Grammar,
  Syntax,
  Lexicon
in {

-- a functor implementation of MicroLang, using Grammar and Lexicon whenever the function is
-- directly from there, Syntax otherwise

-----------------------------------------------------
---------------- Grammar part -----------------------
-----------------------------------------------------

lincat
  Utt = Grammar.Utt ;
  S = Grammar.S ;
  VP = Grammar.VP ;
  Comp = Grammar.Comp ;
  AP = Grammar.AP ;
  CN = Grammar.CN ;
  NP = Grammar.NP ;
  Det = Grammar.Det ;
  Prep = Grammar.Prep ;
  V = Grammar.V ;
  V2 = Grammar.V2 ;
  A = Grammar.A ;
  N = Grammar.N ;
  Pron = Grammar.Pron ;
  Adv = Grammar.Adv ;

lin
  UttS = Grammar.UttS ;
  UttNP = Grammar.UttNP ;
  PredVPS np vp = Syntax.mkS (Syntax.mkCl np vp) ;
  UseV = Grammar.UseV ;
  ComplV2 v2 np = Syntax.mkVP v2 np ;
  UseComp = Grammar.UseComp ;
  CompAP = Grammar.CompAP ;
  AdvVP = Grammar.AdvVP ;
  DetCN = Grammar.DetCN ;
  UsePron = Grammar.UsePron ;
  a_Det = Syntax.a_Det ;
  aPl_Det = Syntax.aPl_Det ;
  the_Det = Syntax.the_Det ;
  thePl_Det = Syntax.thePl_Det ;
  UseN = Grammar.UseN ;
  AdjCN = Grammar.AdjCN ;
  PositA = Grammar.PositA ;
  PrepNP = Grammar.PrepNP ;
  in_Prep = Grammar.in_Prep ;
  on_Prep = Grammar.on_Prep ;
  with_Prep = Grammar.with_Prep ;
  he_Pron = Grammar.he_Pron ;
  she_Pron = Grammar.she_Pron ;
  they_Pron = Grammar.they_Pron ;

-----------------------------------------------------
---------------- Lexicon part -----------------------
-----------------------------------------------------

lin
  already_Adv = Lexicon.already_Adv ;
  animal_N = Lexicon.animal_N ;
  apple_N = Lexicon.apple_N ;
  baby_N = Lexicon.baby_N ;
  bad_A = Lexicon.bad_A ;
  beer_N = Lexicon.beer_N ;
  big_A = Lexicon.big_A ;
  bike_N = Lexicon.bike_N ;
  bird_N = Lexicon.bird_N ;
  black_A = Lexicon.black_A ;
  blood_N = Lexicon.blood_N ;
  blue_A = Lexicon.blue_A ;
  boat_N = Lexicon.boat_N ;
  book_N = Lexicon.book_N ;
  boy_N = Lexicon.boy_N ;
  bread_N = Lexicon.bread_N ;
  break_V2 = Lexicon.break_V2 ;
  buy_V2 = Lexicon.buy_V2 ;
  car_N = Lexicon.car_N ;
  cat_N = Lexicon.cat_N ;
  child_N = Lexicon.child_N ;
  city_N = Lexicon.city_N ;
  clean_A = Lexicon.clean_A ;
  clever_A = Lexicon.clever_A ;
  cloud_N = Lexicon.cloud_N ;
  cold_A = Lexicon.cold_A ;
  come_V = Lexicon.come_V ;
  computer_N = Lexicon.computer_N ;
  cow_N = Lexicon.cow_N ;
  dirty_A = Lexicon.dirty_A ;
  dog_N = Lexicon.dog_N ;
  drink_V2 = Lexicon.drink_V2 ;
  eat_V2 = Lexicon.eat_V2 ;
  find_V2 = Lexicon.find_V2 ;
  fire_N = Lexicon.fire_N ;
  fish_N = Lexicon.fish_N ;
  flower_N = Lexicon.flower_N ;
  friend_N = Lexicon.friend_N ;
  girl_N = Lexicon.girl_N ;
  good_A = Lexicon.good_A ;
  go_V = Lexicon.go_V ;
  grammar_N = Lexicon.grammar_N ;
  green_A = Lexicon.green_A ;
  heavy_A = Lexicon.heavy_A ;
  horse_N = Lexicon.horse_N ;
  hot_A = Lexicon.hot_A ;
  house_N = Lexicon.house_N ;
  jump_V = Lexicon.jump_V ;
  kill_V2 = Lexicon.kill_V2 ;
  language_N = Lexicon.language_N ;
  live_V = Lexicon.live_V ;
  love_V2 = Lexicon.love_V2 ;
  man_N = Lexicon.man_N ;
  milk_N = Lexicon.milk_N ;
  music_N = Lexicon.music_N ;
  new_A = Lexicon.new_A ;
  now_Adv = Lexicon.now_Adv ;
  old_A = Lexicon.old_A ;
  play_V = Lexicon.play_V ;
  read_V2 = Lexicon.read_V2 ;
  ready_A = Lexicon.ready_A ;
  red_A = Lexicon.red_A ;
  river_N = Lexicon.river_N ;
  run_V = Lexicon.run_V ;
  sea_N = Lexicon.sea_N ;
  see_V2 = Lexicon.see_V2 ;
  ship_N = Lexicon.ship_N ;
  sleep_V = Lexicon.sleep_V ;
  small_A = Lexicon.small_A ;
  star_N = Lexicon.star_N ;
  swim_V = Lexicon.swim_V ;
  teach_V2 = Lexicon.teach_V2 ;
  train_N = Lexicon.train_N ;
  travel_V = Lexicon.travel_V ;
  tree_N = Lexicon.tree_N ;
  understand_V2 = Lexicon.understand_V2 ;
  wait_V2 = Lexicon.wait_V2 ;
  walk_V = Lexicon.walk_V ;
  warm_A = Lexicon.warm_A ;
  water_N = Lexicon.water_N ;
  white_A = Lexicon.white_A ;
  wine_N = Lexicon.wine_N ;
  woman_N = Lexicon.woman_N ;
  yellow_A = Lexicon.yellow_A ;
  young_A = Lexicon.young_A ;

}