abstract MiniGrammar = {

-- collected from GF/lib/src/abstract/*.gf
-- the functions marked ---s are shortcuts
-- the leading comments, e.g. "-- Common", indicate the standard RGL module

  cat
  
-- Common
    Utt ;    -- sentence, question, word...         e.g. "be quiet"
    Pol ;    -- polarity                            e.g. positive, negative
    Temp ;   -- temporal features                   e.g. present, anterior

-- Cat
    Imp ;    -- imperative                          e.g. "walk", "don't walk"
    S ;      -- declarative sentence                e.g. "she lives here"
    QS ;     -- question sentence                   e.g. "does she live here"    
    Cl ;     -- declarative clause, with all tenses e.g. "she looks at this"
    QCl ;    -- question clause                     e.g. "does she look at this"
    VP ;     -- verb phrase                         e.g. "lives here"
    Comp ;   -- complement of copula                e.g. "in trouble"
    AP ;     -- adjectival phrase                   e.g. "very warm"
    CN ;     -- common noun (without determiner)    e.g. "red house"
    NP ;     -- noun phrase (subject or object)     e.g. "the red house"
    IP ;     -- interrogative phrase                e.g. "who"
    Pron ;   -- personal pronoun                    e.g. "she"
    Det ;    -- determiner phrase                   e.g. "those"
    Conj ;   -- conjunction                         e.g. "and"
    Prep ;   -- preposition, or just case           e.g. "in", dative
    V ;      -- one-place verb                      e.g. "sleep" 
    V2 ;     -- two-place verb                      e.g. "love"
    VS ;     -- sentence-complement verb            e.g. "know"
    VV ;     -- verb-phrase-complement verb         e.g. "want"
    A ;      -- one-place adjective                 e.g. "warm"
    N ;      -- common noun                         e.g. "house"
    PN ;     -- proper name                         e.g. "Paris"
    Adv ;    -- adverbial phrase                    e.g. "in the house"
    IAdv ;   -- interrogative adverbial             e.g. "where"
    
  fun
-- Phrase
    UttS      : S  -> Utt ;         -- John walks
    UttQS     : QS -> Utt ;         -- does John walk
    UttNP     : NP -> Utt ;         -- John
    UttAdv    : Adv -> Utt ;        -- in the house
    UttIAdv   : IAdv -> Utt ;       -- why
    UttImpSg  : Pol -> Imp -> Utt ; -- (do not) walk

-- Sentence
    UseCl     : Temp -> Pol -> Cl   -> S ;  -- John has not walked
    UseQCl    : Temp -> Pol -> QCl  -> QS ; -- has John walked
    PredVP    : NP -> VP -> Cl ;            -- John walks / John does not walk
    QuestCl   : Cl -> QCl ;                 -- does John (not) walk
    QuestVP   : IP -> VP -> QCl ;           -- who does (not) walk
    ImpVP     : VP -> Imp ;                 -- walk / do not walk

-- Verb
    UseV      : V   -> VP ;             -- sleep
    ComplV2   : V2  -> NP -> VP ;       -- love it ---s
    ComplVS   : VS -> S -> VP ;         -- know that it is good
    ComplVV   : VV -> VP -> VP ;        -- want to be good
    UseComp   : Comp  -> VP ;           -- be small
    CompAP    : AP  -> Comp ;           -- small
    CompNP    : NP  -> Comp ;           -- a man
    CompAdv   : Adv -> Comp ;           -- in the house
    AdvVP     : VP -> Adv -> VP ;       -- sleep here

-- Noun
    DetCN     : Det -> CN -> NP ;       -- the man
    UsePN     : PN -> NP ;              -- John
    UsePron   : Pron -> NP ;            -- he
    MassNP    : CN -> NP ;              -- milk
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

-- Conjunction
    CoordS    : Conj -> S -> S -> S ;   -- he walks and she runs ---s

-- Tense
    PPos      : Pol ;                   -- I sleep  [positive polarity]
    PNeg      : Pol ;                   -- I do not sleep [negative polarity]
    TSim      : Temp ;                  -- simultanous: she sleeps ---s
    TAnt      : Temp ;                  -- anterior: she has slept ---s

-- Structural
    and_Conj  : Conj ;
    or_Conj   : Conj ;
    
    every_Det : Det ;

    in_Prep   : Prep ;
    on_Prep   : Prep ;
    with_Prep : Prep ;

    i_Pron     : Pron ;
    youSg_Pron : Pron ;
    he_Pron    : Pron ;
    she_Pron   : Pron ;
    we_Pron    : Pron ;
    youPl_Pron : Pron ;
    they_Pron  : Pron ;

    whoSg_IP   : IP ;
    
    where_IAdv : IAdv ;
    why_IAdv   : IAdv ;

    have_V2 : V2 ;
    want_VV : VV ;
    
}