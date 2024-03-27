# examples of morphology

# Latin noun inflection

# features

Number = ['Sg', 'Pl']
Case = ['Nom', 'Acc', 'Gen', 'Dat', 'Abl']
Gender = ['Masc', 'Fem']


# a paradigm: the first declension

def decl1(rosa, n, c):
    ros = rosa[:-1]
    match (n, c):
        case ('Sg', ('Nom'|'Abl')):
            return ros + 'a'
        case ('Sg', 'Acc'):
            return ros + 'am'
        case ('Sg', ('Gen'|'Dat')) | ('Pl', 'Nom'):
            return ros + 'ae'
        case ('Pl', 'Gen'):
            return ros + 'arum'
        case ('Pl', ('Dat'|'Abl')):
            return ros + 'is'


# inflection table as a dictionary

def noun_dict(decl, noun):
    return {n: {c: decl(noun, n, c) for c in Case} for n in Number}


# lexical entry: inflection table together with inherent features

rosa_N = {'infl': noun_dict(decl1, 'rosa'), 'gender': 'Fem'}

mensa_N = {'infl': noun_dict(decl1, 'mensa'), 'gender': 'Fem'}


if __name__ == '__main__':
    print(rosa_N)
    print(mensa_N)









