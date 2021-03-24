# a simple query system for arithmetic, using Montague-style semantics
# and an embedded GF grammar
# examples: "is 131 prime", "which numbers are prime", "365 * 24 * 60"
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
  
  if fun == "QWhich":
    ans = enumerate(lambda x: predicate(args[0])(x) and predicate(args[1])(x), allNumbers)
  elif fun == "QWhether":
    ans = quantifier(args[0])(predicate(args[1]))
  else: # QWhat
    ans = value(args[0])
    
  return str(ans)

def predicate(property):
  "takes Property or Kind to int -> bool"
  prop,pargs = property.unpack()
  if prop == "PAnd":
    return lambda x: predicate(pargs[0])(x) and predicate(pargs[1])(x)
  elif prop == "POr":
    return lambda x: predicate(pargs[0])(x) or predicate(pargs[1])(x)
  elif prop == "PNot":
    return lambda x: not predicate(pargs[0])(x)
  elif prop == "PEven":
    return lambda x: x % 2 == 0
  elif prop == "POdd":
    return lambda x: x % 2 != 0
  elif prop == "PEqual":
    return lambda x: quantifier(pargs[0])(lambda y: x == y)
  elif prop == "PSmaller":
    return lambda x: quantifier(pargs[0])(lambda y: x < y)
  elif prop == "PGreater":
    return lambda x: quantifier(pargs[0])(lambda y: x > y)
  elif prop == "PBetween":
    return lambda y: quantifier(pargs[0])(lambda x: quantifier(pargs[1])(lambda z: x < y and y < z))
  elif prop == "PPrime":
    return prime

# works also for Kind:
  elif prop == "KNumber":
    return lambda x: True
  elif prop == "KProperty":
    return lambda x: predicate(pargs[0])(x) and predicate(pargs[1])(x)
  
  else:
    print("not a valid property",property)

def quantifier(term):
  "takes Term to (int -> bool) -> bool"
  fun,args = term.unpack()
  if fun == "TElement":
    return lambda p: p(value(args[0]))
  elif fun == "TAll":
    return lambda p: forAll(lambda x: not predicate(args[0])(x) or p(x), allNumbers)
  elif fun == "TAny":
    return lambda p: forSome(lambda x: predicate(args[0])(x) and p(x), allNumbers)
  else:
    print("not a valid term",term)

def value(element):
  "takes Element to int"
  fun,args = element.unpack()
  if fun == "EInteger":
    return int(args[0].unpack())
  elif fun == "ESum":
    return value(args[0]) + value(args[1])
  elif fun == "EProduct":
    return value(args[0]) * value(args[1])
  elif fun == "EMinus":
    return value(args[0]) - value(args[1])
  elif fun == "EDivided":
    return value(args[0]) / value(args[1]) ## // ?
  elif fun == "EFactorial":
    return factorial(value(args[0]))
  else:
    print("not a valid element",element)
  
def prime(n):
    "simple way to decide if a positive number is prime"
    if n == 1:
        r = False
    else:
        r = True
    for k in range(2,n//2+1):
        if n % k == 0: return False
    return r

def forAll(p,ns):
    "universal quantifier over a list"
    for n in ns:
        if not p(n): return False
    return True
    
def forSome(p,ns):
    "existential quantifier over a list"
    for n in ns:
        if p(n): return True
    return False

def enumerate(p,ns):
    "filter over a list"
    r = []
    for n in ns:
        if p(n): r = r + [n]
    return r

def enumer(p,ns):
    return [n for n in ns if p(n)]

def factorial(n):
    "factorial of positive numbers"
    r = 1
    for k in range(1,n+1):
        r = k*r
    return r
    
def main():
  "main function to be called from stdio, language code as optional argument"
  
  # read in the grammar, set up the input language
  grammar = pgf.readPGF(absmodule + ".pgf")
  langcode = langname
  if len(sys.argv) > 1:
    langcode = absmodule + sys.argv[1]
  lang = grammar.languages[langcode]

  # read a line of input, parse in lang, return answer
  line  = input("")
  parseresult = lang.parse(line)
  prob,tree   = parseresult.__next__()
#  print(tree) ## debugging
  print(answer(tree))
  for r in parseresult: print("WARNING: ambiguous")
  
main()
