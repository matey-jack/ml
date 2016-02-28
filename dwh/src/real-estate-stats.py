#!/usr/bin/python3
# -*- coding: utf-8 -*-
import csv

with open('real-estates-utf8.csv', 'r', encoding="utf8") as f:
    rows = csv.reader(f, quotechar='"', delimiter=',')
    header = next(rows)
    print(header)
    kauf_summe = dict()
    kauf_anzahl = dict()
    miet_summe = dict()
    miet_anzahl = dict()
    for row in rows:
        typ = row[1].replace('Miete', '').replace('Kauf', '').strip(' /')
        kaufpreis = row[4].replace(',', '.')
        miete = row[5].replace(',', '.')
        if kaufpreis:
            kauf_summe[typ] = kauf_summe.get(typ, 0) + float(kaufpreis)
            kauf_anzahl[typ] = kauf_anzahl.get(typ, 0) + 1
        if miete:
            if float(miete) < 10000 or typ != 'Wohnung':
                miet_summe[typ] = miet_summe.get(typ, 0) + float(miete)
                miet_anzahl[typ] = miet_anzahl.get(typ, 0) + 1
            else:
                print(row)
    
print(u'durchschnittliche Kaufpreise: ')
print(u'{0:20} {1:8} {2:15}'.format('Immotyp', 'Fallzahl', u'⌀ Preis'))
for typ in sorted(kauf_summe.keys(), key = lambda typ: kauf_anzahl[typ]):
    print(u'{0:20} {1:8d} {2:12.2f}'.format(typ, kauf_anzahl[typ], kauf_summe[typ] / kauf_anzahl[typ]))

print(u'\ndurchschnittliche Mieten: ')
print(u'{0:20} {1:8} {2:11}'.format('Immotyp', 'Fallzahl', u'⌀ Preis'))
for typ in sorted(miet_summe.keys(), key = lambda typ: miet_anzahl[typ]):
    print(u'{0:20} {1:8d} {2:8.2f}'.format(typ, miet_anzahl[typ], miet_summe[typ] / miet_anzahl[typ]))


#%%

import pygal

chart = pygal.Bar()
chart.add('Kaufpreise', [ kauf_summe[k] / kauf_anzahl[k] for k in kauf_summe.keys() ])
chart.x_labels = kauf_summe.keys()
chart.render_to_file('kauf_chart.svg')

