# translator for arbitrary pgf grammar and language pair, given as arguments

import pgf
import sys

def trim(s0):
    "lower-case first word and tokenize" 
    s = s0.strip()
    if not(s):
        return s
    s = (s[0].lower() + s[1:])
    r = ""
    for c in s:
        if c in [',','.',':','(',')']:
            r = r + ' ' + c + ' '
        else:
            r = r + c
    return r

def missing(eng,s):
  "words in a sentence not found in morphological analysis"
  ws = s.split()
  ms = []
  for w in ws:
    if not eng.lookupMorpho(w):  # strange behaviour of eng
      ms = ms + [w]
  return ms

def main():
  "translation loop, reads stdio line by line"
  if len(sys.argv) < 4:
    print("  usage: python3 translator.py <pgf-file-prefix> <from-lang-suffix> <to-lang-suffix> -debug?")
    print("  e.g. python3 translator.py CSETranslator Eng Swe")
    print("  The program reads and writes stdio line by line, e.g")
    print("    cat ../course_plans/TIN214Eng.txt | python3 translator.py CSEShallow Eng Swe")
    return
  pgfm = sys.argv[1]
  pgff = pgfm + ".pgf"
  ceng = pgfm + sys.argv[2]
  cswe = pgfm + sys.argv[3]
  debug = len(sys.argv) == 5 and sys.argv[4] == "-debug"
  gr = pgf.readPGF(pgff)
  eng = gr.languages[ceng]
  swe = gr.languages[cswe]
  print("#","translating with",pgff,"from",ceng,"to",cswe)
  while True:
    try:
        line = input("")
    except EOFError:
        break
    t = trim(line)
    if not(t):
          pass
    else:
          try:
              px = eng.parse(t)
              p,e = px.__next__()
              if debug:
                  print("# TREE", e)
              print(swe.linearize(e))
          except pgf.ParseError:
              print("# NO PARSE", t)
              if debug:
                  print("# MISSING", missing(eng,t))

main()


