--# -path=.:../abstract

concrete MiniLangFunctorEng of MiniLang = MiniLangFunctor with
  (Grammar = GrammarEng),
  (Syntax = SyntaxEng),
  (Lexicon = LexiconEng)
  ;
  