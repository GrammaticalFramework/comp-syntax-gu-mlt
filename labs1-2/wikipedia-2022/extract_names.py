country_file = '../data/countries.tsv'
labels_file = '../data/alllabels.tsv'
name_cat = 'CName'
included_fields = [0,1,4,5]

source_field = 1  # English
target_field = 4  # German

def get_names(filename):
    names = set()
    file = open(filename)
    for line in file.readlines()[1:]:
        fields = line.split('\t')
        for i in included_fields:
            names.add(fields[i].strip())
    return names
     
def name_rules(name,cat,lin):
    fun = mkFun(name,cat)
    return (
      ' '.join(["fun",fun,':',cat,';']),
      ' '.join(["lin",fun,'=','mk'+cat, '"'+lin+'"', ';'])
      )

def escape(s):
    r = ''
    for c in s:
        if c in "\\'":
            r = r + "\\" + c
        else:
            r = r + c
    return r

def mkFun(name,cat):
    parts = name.split()
    parts.append(cat)
    fun = '_'.join(parts)

    esc = False
    if not name or not (name[0].isalpha()):
        esc = True
    else:
        for c in name:
            if not (c.isalpha() or c.isdigit() or c in "' _"):
                esc = True
                break
    if esc:
        fun = "'" + escape(fun) + "'"
    return fun


def main_eng():
  names = get_names(country_file)
  for name in names:
      fun,lin = name_rules(name,name_cat,name)
      print(fun)
      print(lin)
    
def main_lang():
    
    labeldefs = open(labels_file)
    labels = {}
    for row in labeldefs:
        cols = row.split('\t')
        labels[cols[source_field].strip()] = cols[target_field].strip()

    names = get_names(country_file)
    for name in names:
        linname = labels.get(name,name)
        fun,lin = name_rules(name,name_cat,linname)
        print(fun)
        print(lin)
    
if __name__ == "__main__":
    main_lang()


