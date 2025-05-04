# https://www.wikidata.org/wiki/Special:EntityData/Q18644475.json

import urllib.request
import json
import sys
import ssl
from gf_utils import *

"""
To collect labels from query.json (Wikidata query result) and extract grammars:
python3 find_labels.py init >../data/labels.jsonl
python3 find_labels.py funs >../data/funs.jsonl
python3 find_labels.py abstract >../data/Labels.gf
python3 find_labels.py en >../data/LabelsEng.gf
"""

WIKIDATA_FILE = '../data/query.json'
WIKIDATA_PREFIX = 'http://www.wikidata.org/entity/'
WIKIDATA_URL_PREFIX = 'http://www.wikidata.org/wiki/Special:EntityData/'
NOBEL_FIELDS = ['award', 'country']
LABEL_FILE = '../data/labels.jsonl'

USAGE = 'usage: find_labels.py (init | funs | abstract | en | sv | fi | ...)'

if sys.argv[1:]:
    MODE = sys.argv[1]
else:
    print(USAGE)
    

# qids given in the data file
def get_wikidata_qids(jsonfile, fields):
    qids = set()
    with open(jsonfile) as file:
        data = json.load(file)
        for d in data:
            for f in fields:
                if f in d:
                    qids.add((f, d[f][len(WIKIDATA_PREFIX):]))
    return qids


qids = get_wikidata_qids(WIKIDATA_FILE, NOBEL_FIELDS)

if __name__ == '__mainz__':
    for qid in qids:
        print(qid)

# get all wikidata for each qid
# use this only once, because it is slow
def get_wikidata_json(qids):
    context = ssl._create_unverified_context()
    for field, qid in qids:
        try:
            with urllib.request.urlopen(WIKIDATA_URL_PREFIX + qid +'.json', context=context) as url:
                data = json.load(url)
                yield (field, qid, data)
        except Exception as error:
            pass

# extract the labels, redirect to LABEL_FILE (only once)
def get_wikidata_labels(data, languages=None):
    for field, qid, dict in data:
        entities = dict.get('entities', {'foo': {}})
        entity = list(entities.values())[0]
        entitylabels = entity.get('labels', {})
        entitylabels = {val['language']: val['value']
                        for val in entitylabels.values()
                        if (languages is None) or
                           (val['language'] in languages)}
        entitylabels['field'] = field
        print(json.dumps({qid: entitylabels}, ensure_ascii=False))


# {"Q800": {"tg": "Коста Рика", "sk": "Kostarika", ... "field": <field>}}
def extract_labels(labeldata, mode):
    for entry in data:
        qid, labels = list(entry.items())[0]
        eng = labels.get('en', 'X')
        cat = labels['field'].capitalize()
        fun = mk_fun_from_strs([qid, eng, cat])
        if mode == 'funs':
            print(json.dumps([qid, fun], ensure_ascii=False))
        elif mode == 'abstract':
            print(mk_fun_rule(fun, cat))
        else:
            lin = labels.get(mode, labels.get('en', 'X'))
            oper = 'mk' + cat
            print(mk_lin_rule(fun, mk_lin(oper, [lin], [])))


if MODE == 'init':
    # do this only once, redirect to labels.jsonl
    data = get_wikidata_json(list(qids))
    get_wikidata_labels(data)
else:
    # do this once for abs and for every language you want
    with open(LABEL_FILE) as file:
        data = [json.loads(line) for line in file]
        extract_labels(data, MODE)



        
