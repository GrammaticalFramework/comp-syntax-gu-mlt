import sys
import json
import pgf

# query: https://w.wiki/3tEM

DATA_FILE = '../data/query.json'
WIKIDATA_PREFIX = 'http://www.wikidata.org/entity/'
GRAMMAR_PREFIX = 'Nobel'
GRAMMAR_FILE = f'../grammars/{GRAMMAR_PREFIX}.pgf'
FUN_FILE = f'../data/{GRAMMAR_PREFIX}-funs.jsonl'


with open(DATA_FILE) as file:
    data = json.load(file)

#print(data[0])

awards = {(d['award'], d['awardLabel']) for d in data}

#print(awards)
#print(len(awards))

countries = {(d['country'], d['countryLabel']) for d in data}

# template-based generation in English

def pronoun(d):
    sex = d.get('sexLabel', 'other')
    if sex == 'female':
        return 'she'
    elif sex == 'male':
        return 'he'
    else:
        return 'they'

def year(date):
    return date[:4]

# template-based generation in English

def template_description(d):
    died = f"{d['personLabel']} died {year(d['deathDate'])}" if 'deathDate' in d else ''
    return (
        f"{d['personLabel']} was born in {d['countryLabel']} in {year(d['birthDate'])}. " +
        f"{pronoun(d)} got the {d['awardLabel']} in {year(d['date'])}." +
        died
        )

# grammar-based generation in a given language

def name(d):
    person = d['personLabel']
    return f'StringName "{person}"'


def funs(funfile):
    with open(funfile) as file:
        data = {WIKIDATA_PREFIX + qf[0]: qf[1] for line in file for qf in [json.loads(line)]}
    return data


def country(fundata, d):
    return fundata[d['country']]
    

def award(fundata, d):
    return fundata[d['award']]


def grammar_description(grammar, fundata, d, lang):
    born = pgf.readExpr(
        f"BornSentence ({name(d)}) {country(fundata, d)} (YearDate {year(d['birthDate'])})")
    awarded = pgf.readExpr(
        f"AwardSentence {pronoun(d)}_Name {award(fundata, d)} (YearDate {year(d['date'])})")
    sentences = [born, awarded]
    if 'deathDate' in d:
        died = pgf.readExpr(
            f"DiedSentence ({name(d)}) (YearDate {year(d['deathDate'])})")
        sentences.append(died)
#    return ('\n '.join([str(s) for s in sentences]))
    return ' '.join([lang.linearize(s) + '.' for s in sentences])


if sys.argv[1:]:
    grammar = pgf.readPGF(GRAMMAR_FILE)
    fundata = funs(FUN_FILE)
    lang = grammar.languages[GRAMMAR_PREFIX + sys.argv[1]]
    for d in data:
        print(grammar_description(grammar, fundata, d, lang))
else:
    for d in data:
        print(template_description(d))




