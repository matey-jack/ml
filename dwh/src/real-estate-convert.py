#!/usr/bin/python3
# -*- coding: utf-8 -*-
import pandas as pd
import csv
import re

re_numeric = re.compile(r'\d*\.?\d*')

with open('real-estates-utf8.csv', newline='', encoding="utf8") as f:
    rows = csv.reader(f, quotechar='"', delimiter=',')
    header = next(rows)
    print(header)
    with open('miete.csv', 'w', newline='', encoding="utf8") as miet_f:
        miet_csv = csv.writer(miet_f)
        miet_csv.writerow(['typ', 'kreis', 'miete', 'fläche', 'zimmer'])
        with open('kauf.csv', 'w', newline='', encoding="utf8") as kau_f:
            kauf_csv = csv.writer(kau_f)
            kauf_csv.writerow(['typ', 'kreis', 'preis', 'fläche', 'zimmer'])
            for row in rows:
                typ = row[1].replace('Miete', '').replace('Kauf', '').strip(' /')
                ort = row[3]
                kaufpreis = row[4].replace(',', '.')
                miete = row[5].replace(',', '.')
                fläche = row[6].replace(',', '.')
                zimmer = row[8].replace(',', '.')
                if re_numeric.fullmatch(zimmer):
                    if zimmer and float(zimmer) > 20:
                        zimmer = ''
                else:
                    print("'{}' ".format(zimmer), end='')
                    zimmer = ''

                # some objects have this data obviously swapped the wrong way; fix it.
                if typ == 'Wohnung' and miete and float(miete) > 5000:
                    kaufpreis = miete
                    miete = ''
                    
                if miete:
                    miet_csv.writerow([typ, ort, miete, fläche, zimmer])
                if kaufpreis:
                    kauf_csv.writerow([typ, ort, kaufpreis, fläche, zimmer])
      
