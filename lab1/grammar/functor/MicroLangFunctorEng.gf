--# -path=.:../abstract

concrete MicroLangFunctorEng of MicroLang = MicroLangFunctor with
  (Grammar = GrammarEng),
  (Syntax = SyntaxEng),
  (Lexicon = LexiconEng)
  ;
  