# import pgf

def mk_fun(s):
    s = '_'.join(s.split())  # spaces replaced by underscores
    
    if (s[0].isalpha() and
        all(ord(c)<256 and (c.isdigit() or c.isalpha() or c in "_'")
            for c in s)):  # test if legal GF identifier
        return s
    else:
        return "'" + s.replace("'", "\\'") + "'"  # if not, single quotes make it legal


def mk_fun_from_strs(ss):
    return mk_fun('_'.join(ss))


def quote(s):
    return '"' + s + '"'


def app(fun, args):
    return ' '.join([fun, quote(args[0])] + args[1:])

def empty_variants():
    return 'variants {}'

def mk_lin(oper, words, params):
    return ' '.join([oper] + [quote(w) for w in words] + params) 


def mk_cat_rule(cat):
    return ' '.join(['cat', cat, ';\n'])


def mk_fun_rule(fun, cat, comment=None):
    co = '--' + comment if comment else ''
    return ' '.join(['fun', fun, ':', cat, ';', co])


def mk_lin_rule(fun, lin, comment=None):
    co = '--' + comment if comment else ''
    return ' '.join(['lin', fun, '=', lin, ';', co])


def mk_lincat_rule(cat, lin):
    return ' '.join(['lincat', cat, '=', lin, ';'])

