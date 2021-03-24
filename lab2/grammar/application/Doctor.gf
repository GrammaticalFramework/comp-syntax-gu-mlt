abstract Doctor = {

flags startcat = Phrase ;

cat
  Phrase ;
  Fact ;
  Action ;
  Property ;
  Profession ;
  Person ;
  Place ;
  Substance ;
  Illness ;

fun
  presPosPhrase      : Fact -> Phrase ;
  presNegPhrase      : Fact -> Phrase ;
  pastPosPhrase      : Fact -> Phrase ;
  pastNegPhrase      : Fact -> Phrase ;
  presQuestionPhrase : Fact -> Phrase ;
  pastQuestionPhrase : Fact -> Phrase ;

  impPosPhrase       : Action -> Phrase ;
  impNegPhrase       : Action -> Phrase ;

  actionFact         : Person -> Action -> Fact ;
  propertyFact       : Person -> Property  -> Fact ;
  
  isProfessionProperty   : Profession -> Property ;
  isAtPlaceProperty      : Place -> Property ;
  haveIllnessProperty    : Illness -> Property ;
  needProfessionProperty : Profession -> Property ;

  theProfessionPerson  : Profession -> Person ;

  iMascPerson   : Person ;
  iFemPerson    : Person ;
  youMascPerson : Person ;
  youFemPerson  : Person ;
  hePerson      : Person ;
  shePerson     : Person ;

  goToAction         : Place -> Action ;
  stayAtAction       : Place -> Action ;
  vaccinateAction    : Person -> Action ;
  examineAction      : Person -> Action ;
  takeSubstanceAction : Substance -> Action ;

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
