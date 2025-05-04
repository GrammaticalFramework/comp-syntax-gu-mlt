import json

# query: https://w.wiki/3tEM

DATA_FILE = 'query.json'

with open(DATA_FILE) as file:
    data = json.load(file)

print(data[0])

awards = {(d['award'], d['awardLabel']) for d in data}

#print(awards)
#print(len(awards))

countries = {(d['country'], d['countryLabel']) for d in data}

#print(countries)
#print(len(countries))

#print(data[0].keys())

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


def person_descr(d):
    died = f"{d['personLabel']} died {year(d['deathDate'])}" if 'deathDate' in d else ''
    return (
        f"{d['personLabel']} from {d['countryLabel']} was born in {year(d['birthDate'])}. " +
        f"{pronoun(d)} got {d['awardLabel']} in {year(d['date'])}." +
        died
        )

for d in data:
    print(person_descr(d))


