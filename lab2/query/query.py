import sys
import json
import pgf

# we assume this abstract syntax
ABSMODULE = "Query"

# data file with laureates
DATAFILE = '../data/query.json'

WIKIDATA_PREFIX = 'http://www.wikidata.org/entity/'

# the domain of quantification is the list of laureates with their properties, built from the query result
with open(DATAFILE) as file:
    data = json.load(file)


def listNames(ds):
    return [d['personLabel'] for d in ds]


def funQID(fun):
    return WIKIDATA_PREFIX + str(fun).split('_')[0]

def age(d):
    return int(d['date'][:4]) - int(d['birthDate'][:4])

  
def answer(tree):
    "top level Query interpreter"

    match tree.unpack():
        case ("QWhich", [kind, property]):
            return listNames([x for x in data if predicate(kind)(x) and predicate(property)(x)])
        case ("QHowMany", [kind, property]):
            return len([x for x in data if predicate(kind)(x) and predicate(property)(x)])
        case ( "QWhether", [term, property]):
            return quantifier(term)(predicate(property))
        case ( "QWhat", [element]):
            return value(element)

    print('not yet', str(tree))

  
def predicate(tree):
    "takes Property or Kind to int -> bool"

    match tree.unpack():
        case ("PCountry", [fun]):
            return lambda d: d['country'] == funQID(fun)
        case ("PMale", []):
            return lambda d: d['sexLabel'] == 'male'
        case ("PFemale", []):
            return lambda d: d['sexLabel'] == 'female'
        case ("KProperty", [property, kind]):
            return lambda d: predicate(property)(d) and predicate(kind)(d)
        case ("KLaureate", []):
            return lambda d: True
        case ("KMan", []):
            return lambda d: d['sexLabel'] == 'male'
        case ("KWoman", []):
            return lambda d: d['sexLabel'] == 'female'
          
    print('not yet', str(tree))

          
def quantifier(term):
    "takes Term to (int -> bool) -> bool"
    match term.unpack():
        case ("TElement", element):
            return lambda p: p(value(element))
        case ("TAll", [kind]):
            return lambda p: all(lambda x: not predicate(kind)(x) or p(x), data)
        case ("TAny", [kind]):
            return lambda p: any(lambda x: predicate(kind)(x) and p(x), data)
          
    print('not yet', str(tree))


def value(element):
    "takes Element to a laureate record"

    match element.unpack():
        case ('ELaureate', [name]):
            _, string = name.unpack
            return [d for d in data if d['personLabel'] == string][0]  ## uncertain !
        case ('EYoungest', [kind]):
            return min([d for d in data if predicate(kind)(d)], key = age)
        case ('EOldest', [kind]):
            return max([d for d in data if predicate(kind)(d)], key = age)
          
    print('not yet', str(tree))

  
def main():
    "main function to be called from stdio, language code as optional argument"
  
    # read in the grammar, set up the input language
    grammar = pgf.readPGF(ABSMODULE + ".pgf")
    LANG = ABSMODULE + sys.argv[1]
    lang = grammar.languages[LANG]

    # read a line of input, parse in lang, return answer
    line  = input("")
    parseresult = lang.parse(line)
    prob,tree   = parseresult.__next__()
    print('#', tree) ## debugging
    print(answer(tree))
    for r in parseresult:
        print("WARNING: ambiguous")


main()
