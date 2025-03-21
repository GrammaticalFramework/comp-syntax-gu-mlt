--# -path=.:../english:../abstract

resource MiniSyntaxEng = 
  MiniGrammarEng **    --- inheriting everything from Grammar, not just Cat and Structural
  MiniSyntax with
    (MiniGrammar=MiniGrammarEng) ;
