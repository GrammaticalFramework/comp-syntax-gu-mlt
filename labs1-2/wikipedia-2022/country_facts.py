from data_facts import *

pgffile = 'Countries.pgf'
datafile = '../data/countries.tsv'

# 0.238s
def country_facts_embedded(factsys,tuple):
    countr = factsys.str2exp("CName",tuple[0])
    cap    = factsys.str2exp('Name',tuple.capital)
    cont   = factsys.str2exp('CName',tuple.continent)
    curr   = factsys.str2exp('Name',tuple.currency)
    pop    = mkInt(tuple.population)
    are    = mkInt(tuple.area)

    factsys.grammar.embed("G")
    import G
    object = G.NameObject(G.cName(countr))
    
    return [
      G.AttributeFact(G.capital_Attribute, object, G.NameValue(cap)),
      G.AttributeFact(G.area_Attribute, object, G.IntValue(are)),
      G.populationFact(countr, pop),
      G.continentFact(countr, cont),
      G.AttributeFact(G.currency_Attribute, object, G.NameValue(curr))
      ]

# 0.367s
def country_facts_parsed(factsys,tuple):
    countr = factsys.data2lin("CName",tuple[0])
    cap    = factsys.data2lin('Name',tuple.capital)
    cont   = factsys.data2lin('CName',tuple.continent)
    curr   = factsys.data2lin('Name',tuple.currency)
    pop    = mkInt(tuple.population)
    are    = mkInt(tuple.area)

    return [ factsys.str2exp('Fact',s) for s in
        [
        "the capital of {} is {}".format(countr,cap),
        "the area of {} is {}".format(countr,are),
        "{} has {} inhabitants".format(countr,pop),
        "{} is in {}".format(countr, cont),
        "the currency of {} is {}".format(countr,are)
        ]
      ]

def countries_facts(factsys,cs):
    return [t for c in cs for t in country_facts_embedded(factsys,c)]

def mkInt(s):
    return pgf.readExpr(str(s))

def main():
    gr = pgf.readPGF('Countries.pgf')

    factsys = FactSystem(
      'country capital area population continent currency',
      gr,
      'CountriesEng'
      )
    factsys.run(datafile, countries_facts)
    
if __name__ == "__main__":
    main()

