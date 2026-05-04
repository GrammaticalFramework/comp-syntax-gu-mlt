import pgf

grammar = pgf.readPGF("Foods.pgf")
parse_lang = grammar.languages["FoodsEng"]

with open("data.csv") as data:
    lines = data.readlines()

for line in lines:
    [polarity, kind, quality] = line.split(",")
    k = [e for (_,e) in parse_lang.parse(kind, cat=pgf.readType("Kind"))][0]
    q = [e for (_,e) in parse_lang.parse(quality, cat=pgf.readType("Quality"))][0]
    expr_string = "{} (This ({})) ({})".format("Pred" if polarity == "+" else "PredNeg", k, q)
    print(expr_string)
    expr = pgf.readExpr(expr_string)

    for lin_lang in grammar.languages.values():
        print(lin_lang.linearize(expr))
    print()