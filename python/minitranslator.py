# minimal translator that reads one line from stdio and translates from Eng to Swe with Minilang
# presupposes 'make minilang'

import pgf

# change these three to translate with other grammars and languages
absmodule = "MiniLang"
fromname  = absmodule + "Eng"
toname    = absmodule + "Swe"

def main():
  # read in the grammar, set up to and from languages
  grammar  = pgf.readPGF(absmodule + ".pgf")
  fromlang = grammar.languages[fromname]
  tolang   = grammar.languages[toname]

  # read a line of input, parse in "from" language, linearize in "to" language
  line  = input("")
  parseresult = fromlang.parse(line)
  prob,tree  = parseresult.__next__()
  print(tolang.linearize(tree))
 
main()


