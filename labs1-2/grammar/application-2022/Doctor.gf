abstract Doctor = {

flags startcat = Phrase ;

cat
  Phrase ;      -- has she slept?
  Fact ;        -- she sleeps
  Action ;      -- sleep
  Property ;    -- be a doctor
  Profession ;  -- doctor
  Person ;      -- she
  Place ;       -- the hospital
  Substance ;   -- drugs
  Illness ;     -- fever

fun
  presPosPhrase      : Fact -> Phrase ;  -- she sleeps
  presNegPhrase      : Fact -> Phrase ;  -- she doesn't sleep
  pastPosPhrase      : Fact -> Phrase ;  -- she has slept
  pastNegPhrase      : Fact -> Phrase ;  -- she has not slept
  presQuestionPhrase : Fact -> Phrase ;  -- does she sleep
  pastQuestionPhrase : Fact -> Phrase ;  -- has she slept

  impPosPhrase       : Action -> Phrase ;  -- eat
  impNegPhrase       : Action -> Phrase ;  -- don't eat

  actionFact         : Person -> Action -> Fact ;    -- she vaccinates you
  propertyFact       : Person -> Property  -> Fact ; -- she is a doctor 
  
  isProfessionProperty   : Profession -> Property ;  -- be a doctor
  isAtPlaceProperty      : Place -> Property ;       -- be at the hospital
  haveIllnessProperty    : Illness -> Property ;     -- have a fever
  needProfessionProperty : Profession -> Property ;  -- need a doctor

  theProfessionPerson  : Profession -> Person ;      -- the doctor

  iMascPerson   : Person ;
  iFemPerson    : Person ;
  youMascPerson : Person ;
  youFemPerson  : Person ;
  hePerson      : Person ;
  shePerson     : Person ;

  goToAction         : Place -> Action ;      -- go to the hospital
  stayAtAction       : Place -> Action ;      -- stay at home
  vaccinateAction    : Person -> Action ;     -- vaccinate you
  examineAction      : Person -> Action ;     -- examine you
  takeSubstanceAction : Substance -> Action ; -- take drugs

  coughAction     : Action ;
  breatheAction   : Action ;
  vomitAction     : Action ;
  sleepAction     : Action ;
  undressAction   : Action ;
  dressAction     : Action ;
  eatAction       : Action ;
  drinkAction     : Action ;
  smokeAction     : Action ;
  measureTemperatureAction   : Action ;
  measureBloodPressureAction : Action ;

  hospitalPlace : Place ;
  homePlace     : Place ;
  schoolPlace   : Place ;
  workPlace     : Place ;

  doctorProfession      : Profession ;
  nurseProfession       : Profession ;
  interpreterProfession : Profession ;

  bePregnantProperty    : Property ;
  beIllProperty         : Property ;
  beWellProperty        : Property ;
  beDeadProperty        : Property ;
  haveAllergiesProperty : Property ;
  havePainsProperty     : Property ;
  haveChildrenProperty  : Property ;
  
  feverIllness        : Illness ;
  fluIllness          : Illness ;
  headacheIllness     : Illness ;
  diarrheaIllness     : Illness ;
  heartDiseaseIllness : Illness ;
  lungDiseaseIllness  : Illness ;
  hypertensionIllness : Illness ;

  alcoholSubstance  : Substance ;
  medicineSubstance : Substance ;
  drugsSubstance    : Substance ;
  

}
