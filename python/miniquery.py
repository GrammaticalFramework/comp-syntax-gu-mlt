# a minimal query system for arithmetic, using Montague-style semantics
# and an embedded GF grammar
# examples: "is 131 prime", "2 + 2"
# presupposes 'gf -make QueryEng (QuerySwe ...)'

import pgf
import sys

# we assume this abstract syntax
absmodule = "Query"

# change this to change input language
langname = absmodule + "Eng"

# the meaning of "number" in unrestricted quantification
allNumbers = range(1,10000)

def answer(tree):
  "top level Query interpreter"
  fun,args = tree.unpack()
  
  if fun == "QWhether":
    ans = predicate(args[1])(value(args[0]))
  else: # QWhat
    ans = value(args[0])
    
  return str(ans)

def predicate(property):
  "takes Property or Kind to int -> bool"
  prop,pargs = property.unpack()
  if prop == "PPrime":
    return prime
  else:
    print("property not available")

def value(term):
  "takes Term to int, does not cover quantifiers"
  fun,args = term.unpack()
  if fun == "TElement":
    return value(args[0])
  elif fun == "EInteger":
    return int(args[0].unpack())
  elif fun == "ESum":
    return value(args[0]) + value(args[1])
  else:
    print("term not availeble")
  
def prime(n):
    "simple way to decide if a positive number is prime"
    if n == 1:
        r = False
    else:
        r = True
    for k in range(2,n//2+1):
        if n % k == 0: return False
    return r
    
def main():
  "main function to be called from stdio"
  
  # read in the grammar, set up the input language
  grammar = pgf.readPGF(absmodule + ".pgf")
  lang = grammar.languages[langname]

  # read a line of input, parse in lang, return answer
  line  = input("")
  parseresult = lang.parse(line)
  prob,tree = parseresult.__next__()
  print(answer(tree))
  
main()
