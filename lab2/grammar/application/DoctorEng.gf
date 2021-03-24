--# -path=.:../abstract:../english:../api

-- model implementation using Mini RGL

concrete DoctorEng of Doctor =
  open
    MiniSyntaxEng,
    MiniParadigmsEng,
    Prelude
  in {

-- application using your own Mini* modules

lincat
  Phrase = Utt ;
  Fact = Cl ;
  Action = VP ;
  Property = VP ;
  Profession = CN ;
  Person = NP ;
  Place = {at,to : Adv} ;
  Substance = NP ;
  Illness = NP ;

lin
  presPosPhrase fact = mkUtt (mkS fact) ;
  presNegPhrase fact = mkUtt (mkS negativePol fact) ;
  pastPosPhrase fact = mkUtt (mkS anteriorAnt fact) ;
  pastNegPhrase fact = mkUtt (mkS anteriorAnt negativePol fact) ;
  -- presQuestionPhrase fact = mkUtt (mkQS (mkQCl fact)) ;
  -- pastQuestionPhrase fact = mkUtt (mkQS anteriorAnt (mkQCl fact)) ;
  presQuestionPhrase fact = let p : Utt = mkUtt (mkQS (mkQCl fact)) in p ** {s = p.s ++ SOFT_BIND ++ "?"} ;
  pastQuestionPhrase fact = let p : Utt = mkUtt (mkQS anteriorAnt (mkQCl fact)) in p ** {s = p.s ++ SOFT_BIND ++ "?"} ;


  impPosPhrase action = mkUtt (mkImp action) ;
  impNegPhrase action = mkUtt negativePol (mkImp action) ;

  actionFact person action = mkCl person action ;
  propertyFact person property = mkCl person property ;

  isProfessionProperty profession = mkVP (mkNP a_Det profession) ;
  needProfessionProperty profession = mkVP need_V2 (mkNP a_Det profession) ;
  isAtPlaceProperty place = mkVP place.at ;
  haveIllnessProperty illness = mkVP have_V2 illness ;

  theProfessionPerson profession = mkNP the_Det profession ;

  iMascPerson = i_NP ;
  iFemPerson = i_NP ;
  youMascPerson = you_NP ;
  youFemPerson = you_NP ;
  hePerson = he_NP ;
  shePerson = she_NP ;

  goToAction place = mkVP (mkVP go_V) place.to ;
  stayAtAction place = mkVP (mkVP stay_V) place.at ;
  vaccinateAction person = mkVP vaccinate_V2 person ;
  examineAction person = mkVP examine_V2 person ;
  takeSubstanceAction substance = mkVP take_V2 substance ;

-- end of what could be a functor
--------------------------------

  coughAction = mkVP (mkV "cough") ;
  breatheAction = mkVP (mkV "breathe") ;
  vomitAction = mkVP (mkV "vomit") ;
  sleepAction = mkVP (mkV "sleep" "slept" "slept") ;
  undressAction = mkVP (mkVP take_V2 (mkNP thePl_Det (mkN "clothe"))) (pAdv "off") ;
  dressAction = mkVP (mkVP put_V2 (mkNP thePl_Det (mkN "clothe"))) (pAdv "on") ;
  eatAction = mkVP (mkV "eat" "ate" "eaten") ;
  drinkAction = mkVP (mkV "drink" "drank" "drunk") ;
  smokeAction = mkVP (mkV "smoke") ;
  measureTemperatureAction = mkVP (mkV2 (mkV "measure")) (mkNP the_Det (mkN "body temperature")) ;
  measureBloodPressureAction = mkVP (mkV2 (mkV "measure")) (mkNP the_Det (mkN "blood pressure")) ;

  hospitalPlace = {at = pAdv "at the hospital" ; to = pAdv "to the hospital"} ;
  homePlace = {at = pAdv "at home" ; to = pAdv "home"} ;
  schoolPlace = {at = pAdv "at school" ; to = pAdv "to school"} ;
  workPlace = {at = pAdv "at work" ; to = pAdv "to work"} ;

  doctorProfession = mkCN (mkN "doctor") ;
  nurseProfession = mkCN (mkN "nurse") ;
  interpreterProfession = mkCN (mkN "interpreter") ;

  bePregnantProperty = mkVP (mkA "pregnant") ;
  beIllProperty = mkVP (mkA "ill") ;
  beWellProperty = mkVP (mkA "well") ;
  beDeadProperty = mkVP (mkA "dead") ;
  haveAllergiesProperty = mkVP have_V2 (mkNP aPl_Det (mkN "allergy")) ;
  havePainsProperty = mkVP have_V2 (mkNP aPl_Det (mkN "pain")) ;
  haveChildrenProperty = mkVP have_V2 (mkNP aPl_Det (mkN "child" "children")) ;

  feverIllness = mkNP a_Det (mkN "fever") ;
  fluIllness = mkNP a_Det (mkN "flu") ;
  headacheIllness = mkNP a_Det (mkN "headache") ;
  diarrheaIllness = mkNP a_Det (mkN "diarrhea") ;
  heartDiseaseIllness = mkNP a_Det (mkN "heart disease") ;
  lungDiseaseIllness = mkNP a_Det (mkN "lung disease") ;
  hypertensionIllness = mkNP (mkN "hypertension") ;

  alcoholSubstance = mkNP (mkN "alcohol") ;
  medicineSubstance = mkNP a_Det (mkN "drug") ;
  drugsSubstance = mkNP aPl_Det (mkN "drug") ;

oper
  pAdv : Str -> Adv = MiniParadigmsEng.mkAdv ;

  go_V = mkV "go" "went" "gone" ;
  stay_V = mkV "stay" ;
  need_V2 = mkV2 (mkV "need") ;
  take_V2 = mkV2 (mkV "take" "took" "taken") ;
  put_V2 = mkV2 (mkV "put" "put" "put") ;
  vaccinate_V2 = mkV2 (mkV "vaccinate") ;
  examine_V2 = mkV2 (mkV "examine") ;

}
